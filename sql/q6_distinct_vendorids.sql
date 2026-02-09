-- Non-partitioned: scans entire table → high bytes
SELECT DISTINCT VendorID
FROM `zoomcamp-de-dilara.yellowtaxi_data_2024.yellow_taxi`
WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15';

-- Partitioned: scans only relevant partition → low bytes
SELECT DISTINCT VendorID
FROM `zoomcamp-de-dilara.yellowtaxi_data_2024.yellow_taxi_partitioned`
WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15';
``
