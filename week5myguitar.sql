Write scripts for My Guitar Shop. Be sure to submit your answers 
in one Notepad file with either a .txt or .sql extension. 
Identify each solution with part and exercise number.
 
Part A
SELECT ListPrice, DiscountPercent, 
ROUND((ListPrice * (DiscountPercent/100)),2) AS DisountAmount
FROM Products;

SELECT OrderDate, YEAR(OrderDate) AS OrderYear, 
DAY(OrderDate) AS OrderDay, DATEADD(DAY,30,OrderDate) AS '30Day'
FROM Orders;

 SELECT CardNumber, LEN(CardNumber) AS CardLen, 
RIGHT(CardNumber,4) AS Last4Dig, 
CONCAT('XXXX-XXXX-XXXX-',RIGHT(CardNumber,4)) AS SecuredNum
FROM Orders;

Part B

CREATE VIEW CustomerAddresses AS
SELECT custo.CustomerID, custo.EmailAddress, custo.LastName,
custo.FirstName, bill.Line1 AS BillLine1, bill.Line2 AS BillLine2,
bill.City AS BillCity, bill.State AS BillState, 
bill.ZipCode AS BillZip, ship.Line1 AS ShipLine1,
ship.Line2 AS ShipLine2, ship.City AS ShipCity,
ship.State AS ShipSate, ship.ZipCode AS ShipZip
FROM Customers custo, Addresses ship, Addresses bill
WHERE custo.BillingAddressID = bill.AddressID
and custo.ShippingAddressID = ship.AddressID;

SELECT CustomerID, LastName, FirstName, BillLine1
FROM CustomerAddresses;


IF OBJECT_ID('spCopyCustomers') IS NOT NULL
    DROP PROC spCopyCustomers;
GO

CREATE PROC spCopyCustomers
AS
    IF OBJECT_ID('CustomersCopy') IS NOT NULL
        DROP TABLE CustomersCopy;
    SELECT *
    INTO CustomersCopy
    FROM Customers;

IF OBJECT_ID('fnProductID') IS NOT NULL
    DROP FUNCTION fnProductID;
GO

CREATE FUNCTION fnProductID
    (@ProductName varchar(50))
    RETURNS int
BEGIN
    RETURN (SELECT ProductID FROM Products WHERE ProductName = @ProductName);
END;

