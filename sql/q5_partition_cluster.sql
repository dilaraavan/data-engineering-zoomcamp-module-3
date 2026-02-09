CREATE OR REPLACE TABLE `zoomcamp-de-dilara.yellowtaxi_data_2024.yellow_taxi_partitioned`
PARTITION BY DATE(tpep_dropoff_datetime)
CLUSTER BY VendorID AS
SELECT *
FROM `zoomcamp-de-dilara.yellowtaxi_data_2024.yellow_taxi`;
