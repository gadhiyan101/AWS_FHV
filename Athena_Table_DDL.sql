CREATE EXTERNAL TABLE IF NOT EXISTS `nyc_data`.`nyc_daily_data` (
  `active` string,
  `vehicle_license_number` string,
  `name` string,
  `license_type` string,
  `expiration_date` timestamp,
  `permit_license_number` string,
  `dmv_license_plate_number` string,
  `vehicle_vin_number` string,
  `wheelchair_accessible` string,
  `certification_date` timestamp,
  `hack_up_date` timestamp,
  `vehicle_year` bigint,
  `base_number` string,
  `base_name` string,
  `base_type` string,
  `veh` string,
  `base_telephone_number` string,
  `website` string,
  `base_address` string,
  `reason` string,
  `order_date` timestamp,
  `last_date_updated` timestamp,
  `last_time_updated` string
) COMMENT "This table provide information about FHV nyc data"
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES ('field.delim' = ',')
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat' OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION 's3://nyc-data-store-bucket-2023/nyc-data/'
TBLPROPERTIES (
  'classification' = 'csv',
  'write.compression' = 'NONE',
  'skip.header.line.count' = '1'
);