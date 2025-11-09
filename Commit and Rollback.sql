use test

CREATE TABLE Accountss(
     AccountID INT PRIMARY KEY,
     AccountHolder VARCHAR(100),
     Balance Decimal(10,2)
);

INSERT INTO Accountss ( AccountID, AccountHolder, Balance)
VALUE (1, 'Alice', 5000.00);

SELECT * FROM Accountss;

START TRANSACTION;
UPDATE Accountss SET Balance = Balance-1000 WHERE AccountID = 1;

SELECT * FROM Accountss;

ROLLBACK;

SELECT * FROM Accountss;

UPDATE Accountss SET Balance = Balance-1000 WHERE AccountID = 1;

SELECT * FROM Accountss;

rollback;

SELECT * FROM Accountss;

COMMIT;

 