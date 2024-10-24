CREATE OR REPLACE FUNCTION transfer_jsonb_data()
RETURNS TRIGGER AS $$
DECLARE
    product_data jsonb; 
    j_id Text;
    jsonb_data jsonb;
    count integer;
BEGIN
    j_id:=(new.id);
    product_data := (new.data->'level3ProductsList');
    jsonb_data:=new.data-'level3ProductsList';
    count :=jsonb_array_length(new.data->'level3ProductsList');
    if count>0 then 
    for i in 0..count-1 loop

    INSERT INTO lavanya_trigger_table (id,
         data, 
         product, 
         base_category_id,
         base_category_value,
         storetype,
         productlevel1_id,
         productlevel1_title,
         productlevel2_id,
        productlevel2_title,
        productlevel3_id,
        productlevel3_title,
        stores,
        domain,
        hsncode,
        main_category_id, 
        main_category_value,
        sub_category1_id,
        sub_category1_value,
        sub_category2_id,
        sub_category2_value,
        sub_category3_id,
        sub_category3_value,
        manufacturer_profilekey,
        manufacturer_firstname,
        manufacturer_businesskey, 
        manufacturer_business_typename,
        manufacturer_profile_pic_url,
        manufacturer_lat_long,
        manufacturer_location,
        manufacturer_contact_info,
        manufacturer_district,
        manufacturer_state,
        manufacturer_country,
        manufacturer_memberof,
        reseller_profilekey,
        reseller_firstname,
        reseller_businesskey,
        reseller_businesstype_name,
        reseller_profilepic_url,
        reseller_lat_long,
        reseller_location,
        reseller_contactinfo,
        reseller_district,
        reseller_state,
        reseller_country,
        reseller_memberof,
        parentof,
        attachments,
        sellertype,
        tenure,
        loanamount,
        presanction,
        postsanction,
        otherdocuments,
        specialtags,
        revolvingtypes,
        shareholdermembers,
        isonline,
        isoffline, 
        shipping,
        shipping_details,
        sku_createdts,
        sku_lut,
        mrp,
        price_per_unit,
        smart_elements,
        tax_details,
        isbulkorder,
        selected_trade_specifications,
        master_product_type,
        base_product_id,
        base_product_name,
        variety_id,
        variety_name,
        derivative_id,
        derivative_name,
        varietyof_id,
        varietyof_name,
        derivativeof_id,
        derivativeof_name,
        variant_createdby_profilekey,
        variant_createdby_firstname,
        variant_updatedby_profilekey,
        variant_updatedby_firstname,
        variant_ispublished,
        variant_isreviewaccepted,
        variant_isreviewinprogress,
        variant_isforreview,
        variant_createdts,
        variant_lut,
        sku_createdby_profilekey,
        sku_createdby_firstname,
        sku_updatedby_profilekey,
        sku_updatedby_firstname,
        sku_isforreview,
        sku_ispublished,
        sku_isreviewinprogress,
        sku_isreviewaccepted,
        appname,
        isunifiedstoreproduct

        ) 
    VALUES (j_id, 
        jsonb_data, 
        product_data->i,
         NEW.data->'baseCategory'->'id',
         NEW.data->'baseCategory'->'value',
         NEW.data->'storeType',
         new.data->'productLevel1Id',
         new.data->'productLevel1Title',
         new.data->'productLevel2Id',
         new.data->'productLevel2Title',
         product_data->i->'productLevel3Id',
         product_data->i->'productLevel3Title',
         new.data->'stores',
         new.data->'',
         Coalesce(product_data->i->'hsnCode','0'),
         Coalesce(new.data->'unifiedStore'->'categories'->0->'mainCategory'->'id','0'),
         Coalesce(new.data->'unifiedStore'->'categories'->0->'mainCategory'->'value','0'),
         Coalesce(new.data->'unifiedStore'->'categories'->0->'subCategory1'->'id','0'),
         Coalesce(new.data->'unifiedStore'->'categories'->0->'subCategory1'->'value','0'),
         Coalesce(new.data->'unifiedStore'->'categories'->0->'subCategory2'->'id','0'),
         Coalesce(new.data->'unifiedStore'->'categories'->0->'subCategory2'->'value','0'),
         Coalesce(new.data->'unifiedStore'->'categories'->0->'subCategory3'->'id','0'),
         Coalesce(new.data->'unifiedStore'->'categories'->0->'subCategory3'->'value','0'),
         Coalesce(new.data->'manufacturerDetails'->'profileKey','0'),
         Coalesce(new.data->'manufacturerDetails'->'firstName','0'),
         Coalesce(new.data->'manufacturerDetails'->'businessKey','0'),
         Coalesce(new.data->'manufacturerDetails'->'businessName','0'),
         Coalesce(new.data->'manufacturerDetails'->'profilePicURL','0'),
         Coalesce(new.data->'manufacturerDetails'->'latLong','0'),
         Coalesce(new.data->'manufacturerDetails'->'location','0'),
         Coalesce(new.data->'manufacturerDetails'->'contactInfo','0'),
         Coalesce(new.data->'manufacturerDetails'->'district','0'),
         Coalesce(new.data->'manufacturerDetails'->'state','0'),
         Coalesce(new.data->'manufacturerDetails'->'country','0'),
         Coalesce(new.data->'manufacturerDetails'->'memberOf','0'),
         'null',
         'null',
         'null',
         'null',
         'null',
         'null',
         'null',
         'null',
         'null',
         'null',
         'null',
         'null',
         Coalesce(new.data->>'parentOf','0'),
         Coalesce(product_data->i->'attachments'->'attachments'->0->'url','0'),
         Coalesce(product_data->i->'create table M_table(id number,data jsonb);sellerType','0'),
         'null',
         'null',
         'null',
         'null',
         'null',
         'null',
         'null',
         'null',
         false,
         false,
         Coalesce(product_data->i->'shipping','0'),
         Coalesce(product_data->i->'shippingDetails','0'),
         Coalesce(product_data->i->'createdTS','0'),
         Coalesce(product_data->i->'LUT','0'),
         Coalesce(product_data->i->'mrp','0'),
         Coalesce(product_data->i->'pricePerUnit','0'),
         Coalesce(product_data->i->'smartElements','0'),
         Coalesce(product_data->i->'taxDetails','0'),
         Coalesce((product_data->i->'isBulkOrder')::boolean,'0'),
         Coalesce(product_data->i->'selectedTradeSpecifications','0'),
         Coalesce(new.data->'type','0'),
         Coalesce(new.data->'baseProduct'->'productId','0'),
         Coalesce(new.data->'baseProduct'->'productName','0'),
         Coalesce(new.data->'variety'->'VProductId','0'),
         Coalesce(new.data->'variety'->'VProductName','0'),
         Coalesce(new.data->'derivative'->'VProductId','0'),
         Coalesce(new.data->'derivative'->'VProductName','0'),
         Coalesce(new.data->'varietyOf'->'VProductId','0'),
         Coalesce(new.data->'varietyOf'->'VProductName','0'),
         Coalesce(new.data->'derivativeOf'->'VProductId','0'),
         Coalesce(new.data->'derivativeOf'->'VProductName','0'),
         Coalesce(new.data->'createdBy'->'profileKey','0'),
         Coalesce(new.data->'createdBy'->'firstName','0'),
         Coalesce(new.data->'updatedBy'->'profileKey','0'),
         Coalesce(new.data->'updatedBy'->'firstName','0'),
         Coalesce((new.data->'isPublished')::boolean,'0'),
         Coalesce((new.data->'isReviewAccepted')::boolean,'0'),
         Coalesce((new.data->'isReviewInProgress')::boolean,'0'),
         Coalesce((new.data->'isForReview')::boolean,'0'),
         Coalesce(product_data->i->'createdTS','0'),
         Coalesce(product_data->i->'LUT','0'),
         Coalesce(product_data->i->'createdBy'->'profileKey','0'),
         Coalesce(product_data->i->'createdBy'->'firstName','0'),
         Coalesce(product_data->i->'updatedBy'->'profileKey','0'),
         Coalesce(product_data->i->'updatedBy'->'firstName','0'),
         Coalesce((product_data->i->'createdBy'->'isForReview')::boolean,'0'),
         Coalesce((product_data->i->'createdBy'->'isPublished')::boolean,'0'),
         Coalesce((product_data->i->'createdBy'->'isReviewInProgress')::boolean,'0'),
         Coalesce((product_data->i->'createdBy'->'isReviewAccepted')::boolean,'0'),
         Coalesce(new.data->'appName','0'),
         Coalesce((new.data->'isUnifiedStoreProduct')::boolean,'0')
    );
   
    end loop;

end if;

   Return new; 

END;
$$ LANGUAGE plpgsql;


CREATE or replace  TRIGGER my_trigger
AFTER UPDATE ON lavanya_table
FOR EACH ROW
EXECUTE FUNCTION transfer_jsonb_data();


UPDATE lavanya_table 
SET actiontype= "UPDATE";

UPDATE lavanya_table 
SET data = jsonb_set(data, '{actionPerformed}', '"UPDATE"') 
WHERE id = '5mav';



