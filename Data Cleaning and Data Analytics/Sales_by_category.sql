SELECT `Category`, SUM(`Sales`) AS Total_Sales
FROM orders
GROUP BY `Category`
ORDER BY Total_Sales DESC;
