SELECT `Region`, SUM(`Sales`) AS Total_Sales
FROM orders
GROUP BY `Region`;

