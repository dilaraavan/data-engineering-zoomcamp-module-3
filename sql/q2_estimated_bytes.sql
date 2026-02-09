-- External Table
SELECT COUNT(DISTINCT PULocationID) AS distinct_puloc
FROM `zoomcamp-de-dilara.yellowtaxi_data_2024.yellow_taxi_external`;

-- Materialized Table
SELECT COUNT(DISTINCT PULocationID) AS distinct_puloc
FROM `zoomcamp-de-dilara.yellowtaxi_data_2024.yellow_taxi`;
