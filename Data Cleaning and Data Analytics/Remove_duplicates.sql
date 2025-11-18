ALTER TABLE orders
ADD PRIMARY KEY (`RowID`);

DELETE FROM orders
WHERE `RowID` NOT IN (
    SELECT MIN(`RowID`)
    FROM orders
    GROUP BY `OrderID`, `Product ID`
);
