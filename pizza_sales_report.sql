SELECT 
    *
FROM
    pizza_sales;
    
    
# Total Revenue 

SELECT 
    ROUND(SUM(total_price), 2) AS 'Total Revenue'
FROM
    pizza_sales;
    
    
# Total number of orders

SELECT 
    COUNT(DISTINCT order_id) AS "Number of Orders"
FROM
    pizza_sales;
    

# Avg order value

SELECT 
    ROUND(SUM(total_price) / COUNT(DISTINCT order_id),
            2) AS 'Avg Order Value'
FROM
    pizza_sales;


# Total pizza sold

SELECT 
    SUM(quantity) AS 'Total pizza sold'
FROM
    pizza_sales;



# Total number of orders

SELECT 
    COUNT(DISTINCT order_id) AS "Number of Orders"
FROM
    pizza_sales;
    
    
# Avg pizza per order

SELECT 
    ROUND(SUM(quantity) / COUNT(DISTINCT order_id),
            2) AS 'Avg Pizzas per Order'
FROM
    pizza_sales;
    
    

# Daily Trend for Total Orders 

SELECT 
    WEEKDAY(order_date) AS "Week number",
    DAYNAME(order_date) AS "Week day Name",
    COUNT(DISTINCT order_id) AS "Total number of Orders"
FROM
    pizza_sales
GROUP BY WEEKDAY(order_date), DAYNAME(order_date);


# Monthly Trend for Total Orders 

SELECT 
    EXTRACT(MONTH FROM order_date) AS "Month Number",
    MONTHNAME(order_date) AS 'Month Name',
    COUNT(DISTINCT order_id) AS 'Total number of Orders'
FROM
    pizza_sales
GROUP BY EXTRACT(MONTH FROM order_date) , MONTHNAME(order_date);



# Percentage of sales by pizza category

SELECT 
    pizza_category,
    ROUND((SUM(total_price) / (SELECT 
                    SUM(total_price)
                FROM
                    pizza_sales)) * 100,
            2) "% by total of revenue"
FROM
    pizza_sales
GROUP BY pizza_category;



# Percentage of sales by pizza size

SELECT 
    pizza_size,
    ROUND((SUM(total_price) / (SELECT 
                    SUM(total_price)
                FROM
                    pizza_sales)) * 100,
            2) "% by total of revenue"
FROM
    pizza_sales
GROUP BY pizza_size;



# Total pizzas sold by pizza category

SELECT 
	pizza_category,
    SUM(quantity) AS "Total Pizzas Sold"
FROM
    pizza_sales
GROUP BY pizza_category;



# Top 5 pizzas by Revenue

SELECT 
    pizza_name, SUM(total_price) AS 'Total Revenue'
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY SUM(total_price) DESC
LIMIT 5;


# Top 5 pizzas by quantity

SELECT 
    pizza_name, SUM(quantity) AS 'Total Quantity'
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC
LIMIT 5;


# Top 5 pizzas by orders

SELECT 
    pizza_name, COUNT(DISTINCT order_id) AS 'Total Orders'
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY COUNT(DISTINCT order_id) DESC
LIMIT 5;




# Bottom 5 pizzas by Revenue

SELECT 
    pizza_name, SUM(total_price) AS 'Total Revenue'
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY SUM(total_price) DESC
LIMIT 27, 5;



# Bottom 5 pizzas by quantity

SELECT 
    pizza_name, SUM(quantity) AS 'Total Quantity'
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC
LIMIT 27, 5;


# Bottom 5 pizzas by orders

SELECT 
    pizza_name, COUNT(DISTINCT order_id) AS 'Total Orders'
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY COUNT(DISTINCT order_id) DESC
LIMIT 27, 5;
