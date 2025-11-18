USE superstore;

SELECT *
FROM orders
WHERE `OrderID` IS NULL
    OR `Sales` IS NULL
    OR `Order Date` IS NULL;




