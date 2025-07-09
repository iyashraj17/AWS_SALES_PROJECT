DESCRIBE aws_saas_sales.saassales;
ALTER TABLE aws_saas_sales.saassales
ADD COLUMN order_date_clean DATE;

ALTER TABLE aws_saas_sales.saassales
ADD COLUMN order_id_clean VARCHAR(100);

ALTER TABLE aws_saas_sales.saassales
ADD COLUMN row_id_clean VARCHAR(100);

-- Disable safe update mode temporarily
SET SQL_SAFE_UPDATES = 0;

-- Clean Order Date
UPDATE aws_saas_sales.saassales
SET order_date_clean = STR_TO_DATE(`Order Date`, '%m/%d/%Y');

-- Clean Order ID (trim + uppercase)
UPDATE aws_saas_sales.saassales
SET order_id_clean = UPPER(TRIM(`Order ID`));

-- Clean ROW ID 
UPDATE aws_saas_sales.saassales
SET row_id_clean = `Row ID`;

SET SQL_SAFE_UPDATES = 1;

-- REMOVE DUPLICATES
DELETE FROM aws_saas_sales.saassales
WHERE row_id_clean NOT IN (
    SELECT * FROM (
        SELECT MIN(row_id_clean)
        FROM aws_saas_sales.saassales
        GROUP BY order_id_clean
    ) AS unique_orders
);

-- Drop or Rename Old Columns
ALTER TABLE aws_saas_sales.saassales
DROP COLUMN `Order ID`,
DROP COLUMN `Order Date`;

ALTER TABLE aws_saas_sales.saassales
CHANGE order_date_clean order_date DATE,
CHANGE order_id_clean order_id VARCHAR(100);


-- Monthly Revenue Trend
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    ROUND(SUM(Sales), 2) AS total_revenue
FROM aws_saas_sales.saassales
GROUP BY month
ORDER BY month;


 -- Top 10 Customers by Profit
 SELECT 
    Customer,
    ROUND(SUM(Profit), 2) AS total_profit
FROM aws_saas_sales.saassales
GROUP BY Customer
ORDER BY total_profit DESC
LIMIT 10;


-- Regional Sales Distribution
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS total_sales
FROM aws_saas_sales.saassales
GROUP BY Region
ORDER BY total_sales DESC;

-- License Type vs Profitability
SELECT 
    License,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM aws_saas_sales.saassales
GROUP BY License;






-- In MySQL Workbench or CLI
SELECT * FROM aws_saas_sales.saassales
INTO OUTFILE 'D:/saas_sales_clean.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

