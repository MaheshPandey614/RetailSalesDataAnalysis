
/*
Exploring the Sales dataset
Basic SQL practice

*/


-- Total Number of Transactions
SELECT COUNT(*) AS total_transactions FROM sales_data;

-- Total Sales Revenue


SELECT SUM(Total_Amount) AS total_revenue FROM sales_data;
-- Top 5 Best-Selling Product Categories

SELECT Product_Category, SUM(Quantity) AS total_sold
FROM sales_data
GROUP BY Product_Category
ORDER BY total_sold DESC
LIMIT 5;

-- Average Spending per Customer

SELECT Customer_ID, AVG(Total_Amount) AS avg_spending
FROM sales_data
GROUP BY Customer_ID
ORDER BY avg_spending DESC
LIMIT 10;

-- Sales Distribution by Gender

SELECT Gender, SUM(Total_Amount) AS total_sales
FROM sales_data
GROUP BY Gender;

-- Sales by month
SELECT 
    DATE_FORMAT(Transaction_Date, '%Y-%m') AS Month,
    SUM(Total_Amount) AS Total_Sales
FROM sales_data
GROUP BY Month
ORDER BY Month;


-- Sales by category

SELECT 
    Product_Category,
    SUM(Total_Amount) AS Total_Sales,
    COUNT(Transaction_ID) AS Transactions
FROM sales_data
GROUP BY Product_Category
ORDER BY Total_Sales DESC;

-- Highest spending customers

SELECT 
    Customer_ID,
    SUM(Total_Amount) AS Total_Spent,
    COUNT(Transaction_ID) AS Transactions
FROM sales_data
GROUP BY Customer_ID
ORDER BY Total_Spent DESC
LIMIT 10;


-- Agewise speding

SELECT 
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS Age_Group,
    COUNT(Transaction_ID) AS Transactions,
    SUM(Total_Amount) AS Total_Spent
FROM sales_data
GROUP BY Age_Group
ORDER BY Total_Spent DESC;

-- Small/Medium/Large Order
SELECT 
    CASE 
        WHEN Total_Amount < 50 THEN 'Small Order (<$50)'
        WHEN Total_Amount BETWEEN 50 AND 200 THEN 'Medium Order ($50-$200)'
        ELSE 'Large Order (>$200)'
    END AS Order_Size,
    COUNT(Transaction_ID) AS Transactions,
    SUM(Total_Amount) AS Total_Revenue
FROM sales_data
GROUP BY Order_Size
ORDER BY Total_Revenue DESC;


