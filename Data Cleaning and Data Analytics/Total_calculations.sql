Use superstore;

SELECT SUM(`Sales`) AS Total_Sales FROM orders;

SELECT SUM(`Profit`) AS Total_Profit FROM orders;

SELECT COUNT(DISTINCT `OrderID`) AS Total_Orders FROM orders;

SELECT 
    (SUM(`Profit`)/SUM(`Sales`))*100 AS Profit_Margin_Percentage
FROM orders;

