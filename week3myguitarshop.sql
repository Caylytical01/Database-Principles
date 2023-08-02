USE MyGuitarShop;

CREATE INDEX index_zipcode ON customers(ZipCode);


DROP database MyWebDB;
CREATE database MyWebDB;
USE MyWebDB;

CREATE TABLE USERS
(UserID INT NOT NULL IDENTITY PRIMARY KEY,
EmailAddress VARCHAR(100),
FirstName VARCHAR(45),
LastName VARCHAR(45));


CREATE TABLE PRODUCTS

(ProductID INT NOT NULL IDENTITY PRIMARY KEY,
ProductName VARCHAR(20));

CREATE TABLE DOWNLOADS
(DownloadID INT NOT NULL IDENTITY PRIMARY KEY,
UserID INT REFERENCES Users(UserID),
DownloadDate DATETIME,
Filename VARCHAR(50),
ProductID INT REFERENCES Products (ProductID));

SELECT email_address, first_name, last_name, download_date, filename, product_name
FROM  USERS, PRODUCTS, DOWNLOADS
WHERE USERS.user_id=DOWNLOADS.user_id
and PRODUCTS.product_id=DOWNLOADS.product_id;

SELECT email_address, first_name, last_name, download_date, filename, product_name
FROM USERS, PRODUCTS, DOWNLOADS
WHERE USERS.user_id=DOWNLOADS.user_id
and PRODUCTS.product_id=DOWNLOADS.product_id
ORDER BY email_address DESC, product_name ASC;

ALTER TABLE PRODUCTS

ADD price (5,2) default 9.99,

ADD dateAdded DATETIME;


ALTER TABLE USERS

MODIFY first_name VARCHAR(20) NULL