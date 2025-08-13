CREATE DATABASE online_sales;

USE online_sales;

CREATE TABLE IF NOT EXISTS orders (
    order_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id INT
);

LOAD DATA INFILE 'C:/Users/nanduchowdary/Downloads/archive (3)/sales_data_sample.csv'
INTO TABLE orders
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, order_date, amount, product_id);


SELECT 
    strftime('%Y', order_date) AS order_year,
    strftime('%m', order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY order_year, order_month
ORDER BY order_year, order_month;


