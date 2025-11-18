SELECT DATE_FORMAT(`Order Date`, '%Y-%m') AS Month,
       SUM(`Sales`) AS Total_Sales
FROM orders
GROUP BY Month
ORDER BY Month;
