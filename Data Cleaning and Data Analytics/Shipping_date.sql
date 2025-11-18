SELECT 
    `OrderID`,
    DATEDIFF(`Ship Date`, `Order Date`) AS Shipping_Days
FROM orders
ORDER BY Shipping_Days DESC;
