# Module 3 Homework – Data Warehousing & BigQuery
Data Engineering Zoomcamp by DataTalksClub

This repository contains my solutions for Module 3 (Data Warehousing & BigQuery) of the Data Engineering Zoomcamp.
The focus of this module is understanding BigQuery, working with external tables, materialized tables, partitioned and clustered tables, and querying Yellow Taxi Trip Records.

Data Used:
- Yellow Taxi Trip Records (Parquet) – January 2024 to June 2024
- All files were uploaded to a GCS bucket and used to create:
  - External Table: `yellow_taxi_external`
  - Materialized Table: `yellow_taxi`
  - Partitioned + Clustered Table: `yellow_taxi_partitioned`

---

### Question 1. What is count of records for the 2024 Yellow Taxi Data?

- 65,623  
- 840,402  
- 20,332,093  
- 85,431,289  

📄 SQL file: sql/q1_total_records.sql

**Answer:** 20,332,093

---

### Question 2. What is the estimated amount of data that will be read when this query is executed on the External Table and the Table?

- 18.82 MB for the External Table and 47.60 MB for the Materialized Table  
- 0 MB for the External Table and 155.12 MB for the Materialized Table  
- 2.14 GB for the External Table and 0MB for the Materialized Table  
- 0 MB for the External Table and 0MB for the Materialized Table  

📄 SQL file: sql/q2_distinct_pulocationid.sql

**Answer:** 0 MB for the External Table and 155.12 MB for the Materialized Table

---

### Question 3. Why are the estimated number of Bytes different?

- BigQuery is a columnar database, and it only scans the specific columns requested in the query. Querying two columns (PULocationID, DOLocationID) requires reading more data than querying one column (PULocationID), leading to a higher estimated number of bytes processed.  
- BigQuery duplicates data across multiple storage partitions, so selecting two columns instead of one requires scanning the table twice, doubling the estimated bytes processed.  
- BigQuery automatically caches the first queried column, so adding a second column increases processing time but does not affect the estimated bytes scanned.  
- When selecting multiple columns, BigQuery performs an implicit join operation between them, increasing the estimated bytes processed  

**Answer:** BigQuery is a columnar database, and it only scans the specific columns requested in the query. Querying two columns (PULocationID, DOLocationID) requires reading more data than querying one column (PULocationID), leading to a higher estimated number of bytes processed.

---

### Question 4. How many records have a fare_amount of 0?

- 128,210  
- 546,578  
- 20,188,016  
- 8,333  

📄 SQL file: sql/q4_zero_fare.sql

**Answer:** 8,333

---

### Question 5. What is the best strategy to make an optimized table in Big Query if your query will always filter based on tpep_dropoff_datetime and order the results by VendorID (Create a new table with this strategy)

- Partition by tpep_dropoff_datetime and Cluster on VendorID  
- Cluster on by tpep_dropoff_datetime and Cluster on VendorID  
- Cluster on tpep_dropoff_datetime Partition by VendorID  
- Partition by tpep_dropoff_datetime and Partition by VendorID  

📄 SQL file: sql/q5_partition_strategy.sql

**Answer:** Partition by tpep_dropoff_datetime and Cluster on VendorID

---

### Question 6. Write a query to retrieve the distinct VendorIDs between tpep_dropoff_datetime 2024-03-01 and 2024-03-15 (inclusive). Use the materialized table you created earlier in your from clause and note the estimated bytes. Now change the table in the from clause to the partitioned table you created for question 5 and note the estimated bytes processed. What are these values?

- 12.47 MB for non-partitioned table and 326.42 MB for the partitioned table  
- 310.24 MB for non-partitioned table and 26.84 MB for the partitioned table  
- 5.87 MB for non-partitioned table and 0 MB for the partitioned table  
- 310.31 MB for non-partitioned table and 285.64 MB for the partitioned table  

📄 SQL file: sql/q6_vendorid_partitioned.sql

**Answer:** 310.24 MB for non-partitioned table and 26.84 MB for the partitioned table

---

### Question 7. Where is the data stored in the External Table you created?

- Big Query  
- Container Registry  
- GCP Bucket  
- Big Table  

**Answer:** GCP Bucket

---

### Question 8. It is best practice in Big Query to always cluster your data:

- True  
- False  

**Answer:** False

---

### Question 9. Write a `SELECT count(*)` query FROM the materialized table you created. How many bytes does it estimate will be read? Why?

📄 SQL file: sql/q9_count_fare_amount.sql

**Answer:** Estimated bytes processed: 155.12 MB  
Explanation: COUNT(fare_amount) reads the column data physically. Unlike COUNT(*), which can sometimes use metadata to get the row count, this requires scanning the column data, leading to higher bytes processed.
