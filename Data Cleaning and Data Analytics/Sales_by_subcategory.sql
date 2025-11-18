SELECT `Sub-Category`, SUM(`Sales`) AS Total_Sales
FROM orders
GROUP BY `Sub-Category`
ORDER BY Total_Sales DESC;
