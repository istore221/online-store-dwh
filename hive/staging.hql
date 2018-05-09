DROP DATABASE IF EXISTS online_store_stag CASCADE;
DROP DATABASE IF EXISTS online_store_dwh CASCADE;

CREATE DATABASE IF NOT EXISTS online_store_stag;
CREATE DATABASE IF NOT EXISTS online_store_dwh;

USE online_store_stag;



-- staging tables --

CREATE EXTERNAL TABLE products
PARTITIONED BY (imported_date STRING)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.avro.AvroSerDe'
STORED AS INPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerOutputFormat'
LOCATION 'hdfs:///user/athena_admin/online_store/stag/products'
TBLPROPERTIES ('avro.schema.url'='hdfs:///user/athena_admin/online_store/avro_schemas/products/v1/products.avsc');



-- target tables --
