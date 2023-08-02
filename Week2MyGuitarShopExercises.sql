SELECT ProductCode, ProductName, ListPrice, DiscountPercent
FROM Products
ORDER BY ListPrice DESC;

SELECT LastName + ' , ' + FirstName as FullName 
FROM Customers
WHERE LastName > 'M'
ORDER BY LastName;

SELECT ProductName, ListPrice, DateAdded
FROM Products
WHERE ListPrice > 500 and ListPrice < 2000
ORDER BY DateAdded DESC;

SELECT ProductName, ListPrice, DiscountPercent, 
DiscountPercent *( ListPrice/100) AS DiscountAmount,
ListPrice - (DiscountPercent * (ListPrice /100)) AS DiscountPrice
FROM Products
ORDER BY DiscountPrice DESC;

SELECT ItemID, ItemPrice, DiscountAmount, Quantity,
ItemPrice * Quantity AS PriceTotal, DiscountAmount *
Quantity AS DiscountTotal, Quantity * (ItemPrice - DiscountAmount) 
AS ItemTotal
FROM OrderItems
WHERE Quantity * (ItemPrice -DiscountAmount) > 500
ORDER BY ItemTotal DESC;

SELECT OrderID, OrderDate, ShipDate
FROM Orders
WHERE ShipDate is NULL;

SELECT 100 AS Price, 0.7 AS TaxRate, 
100 * 0.7 AS TaxAmount,
100 + (100 * 0.7) AS Total;
