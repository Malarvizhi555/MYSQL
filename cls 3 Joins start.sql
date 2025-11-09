use de_project

CREATE TABLE Restaurants(
  id INT PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Location VARCHAR(100) NOT NULL
);

INSERT INTO Restaurants VALUES
(1, 'Raghini', 'NewYork'),
(2, 'Kayal', 'LOS Angels'),
(3, 'Malar', 'Chicago');

CREATE TABLE Order2(
  Order_id INT PRIMARY KEY,
  Resturant_id VARCHAR(100) NOT NULL,
  Order_Date VARCHAR(100) NOT NULL
);

INSERT INTO Order2 VALUES
(1, 1, '2023-01-01'),
(2, 1, '2023-01-02'),
(3, 2, '2023-01-05'),
(4, 4, '2023-01-07');

select * from Restaurants

select * from Order2

select
r.Name as Restaurant_Name,
o.Order_Date
from Restaurants r
join order2 o on r.id = o.Resturant_id

use de_project

SELECT 
r.Name as Restaurant_Name,
o.Order_Date
FROM Restaurants r
LEFT JOIN Order2 o on r.id = o.Resturant_id

SELECT 
r.Name as Restaurant_Name,
o.Order_Date
FROM Restaurants r
RIGHT JOIN Order2 o on r.id = o.Resturant_id

SELECT 
r.Name as Restaurant_Name,
o.Order_Date
FROM Restaurants r
FULL OUTER JOIN Order2 o on r.id = o.Resturant_id

select
r.Name as Restaurant_Name,
o.Order_Date
from Restaurants r
join order2 o on r.id = o.Resturant_id
join Customers c on c.cust_id = o.customer_id

use de_Project

DROP TABLE IF EXISTS Employees1;

create table Employees1(
      Id INT PRIMARY KEY ,
      Name VARCHAR (100) NOT NULL,
      Manager_Id INT NULL
);

INSERT INTO Employees1 VALUES
(1,'Alice',3),
(2,'Bob',3),
(3,'Charile',null),
(4,'Diana',3);

select * from Employees1

select
    e.Name as Employee_Name,
    m.Name as Manager_Name
FROM Employees1 e
    LEFT JOIN Employees1 m
    ON e.Manager_Id = m.Id;

SELECT 
    e.Name AS Employee_Name,
    m.Name AS Manager_Name
FROM Employees1 e
LEFT JOIN Employees1 m
    ON e.Manager_Id = m.Id;