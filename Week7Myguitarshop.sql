USE MyGuitarShop;

CREATE ROLE OrderEntry;

GRANT INSERT,UPDATE
  ON Orders
  TO OrderItems ;

ALTER ROLE db_datareader ADD MEMBER OrderEntry;
