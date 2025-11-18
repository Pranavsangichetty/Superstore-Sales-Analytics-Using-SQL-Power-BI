SELECT `State`, SUM(`Profit`) AS Total_Profit
FROM orders
GROUP BY `State`
ORDER BY Total_Profit DESC;
