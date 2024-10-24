
CREATE OR REPLACE FUNCTION delete_trigger()
RETURNS TRIGGER AS $$
DECLARE
    t_ids TEXT[];
    m_ids TEXT[];
    n_id text;
BEGIN 
    SELECT ARRAY_AGG(REPLACE(productlevel3_id::text, '"', '')) INTO t_ids FROM lavanya_trigger_table WHERE id = NEW.id;

    SELECT ARRAY_AGG(elem) INTO m_ids 
    FROM (
        SELECT jsonb_array_elements(NEW.data->'level3ProductsList')->>'productLevel3Id' AS elem FROM lavanya_table WHERE id = NEW.id
    ) AS subquery;

    for n_id in (SELECT unnest(t_ids) EXCEPT SELECT unnest(m_ids)) loop
            DELETE FROM lavanya_trigger_table WHERE productlevel3_id =format('"%s"',n_id);
            -- RAISE NOTICE 'm_ids: %, t_ids: %, difference_ids: %', m_ids, t_ids,n_id;
    END LOOP;
    
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;


CREATE or replace TRIGGER del_trigger
AFTER  Update ON lavanya_table
FOR EACH ROW
EXECUTE FUNCTION delete_trigger();

UPDATE lavanya_table SET data=jsonb_delete_path(data,'{level3ProductsList,1}') WHERE id='4wb4';
