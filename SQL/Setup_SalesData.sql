#Create a database and table in the server

CREATE DATABASE retail_sales;
USE retail_sales;


#Create a table scnhema

CREATE TABLE sales_data (
    Transaction_ID INT PRIMARY KEY,
    Transaction_Date DATE,
    Customer_ID VARCHAR(20),
    Gender VARCHAR(10),
    Age INT,
    Product_Category VARCHAR(255),
    Quantity INT,
    Price_Per_Unit DECIMAL(12,2),
    Total_Amount DECIMAL(12,2)
);

#Alternbative to table import wizard process
LOAD DATA INFILE 'C:/GitHub/Bootcamp-2025-DA/Data/retail_sales_dataset.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
