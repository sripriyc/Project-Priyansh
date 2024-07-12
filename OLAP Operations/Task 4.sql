--Task 4
--1.Database Creation
--CREATE DATABASE Company_Sales;

CREATE TABLE sales_sample ( 
    Product_Id INTEGER, 
    Region VARCHAR (50), 
    Date DATE, 
    Sales_amount INT
);

--2.Data creation
INSERT INTO Sales_sample (Product_Id,Region,Date,Sales_Amount) 
VALUES  
(01,'North','12-NOV-2024',10000), 
(02,'East','14-NOV-2024',12000), 
(03,'South','16-NOV-2024',8800), 
(04,'West','18-NOV-2024',25000), 
(05,'North','20-NOV-2024',10000), 
(06,'East','22-NOV-2024',17000), 
(07,'South','24-NOV-2024',2000), 
(08,'West','26-NOV-2024',20000), 
(09,'North','28-NOV-2024',11000), 
(10,'East','29-NOV-2024',7000);

--3.Perform OLAP operations
--3.a

SELECT 
Region, 
Product_Id, 
SUM(Sales_Amount) AS Total_sales 
FROM 
sales_sample 
GROUP BY 
Region, Product_Id 
ORDER BY 
Region, Product_Id;

--3.b
SELECT 
    CASE 
        WHEN GROUPING(Region) = 1 THEN 'All Regions' 
        ELSE Region 
    END AS Region,
    CASE 
        WHEN GROUPING(Product_Id) = 1 THEN 'Total' 
        ELSE CAST(Product_Id AS TEXT) 
    END AS Product_Id,
    SUM(Sales_amount) AS Total_Sales
FROM 
    sales_sample
GROUP BY 
    ROLLUP(Region, Product_Id)
ORDER BY 
    Region, 
    Product_Id;
    
    
--3.c
SELECT Product_Id, Region, Date, SUM(Sales_Amount) AS Total_sales 
FROM sales_sample 
GROUP BY Product_Id, Region, Date 
ORDER BY Product_Id, Region, Date;

--3.d
SELECT * 
FROM sales_sample 
WHERE Region = 'West' 
AND DATE BETWEEN '14-NOV-2024' AND '20-NOV-2024';

--3.e
SELECT * 
FROM sales_sample 
WHERE Product_Id = '08'
AND Region = 'West' 
AND DATE = '26-NOV-2024';