SELECT `Segment`, SUM(`Sales`) AS Total_Sales
FROM orders
GROUP BY `Segment`;
