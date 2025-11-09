CREATE TABLE Sales(
    TransactionID INT,
    Store VARCHAR(50),
    SalesAmount DECIMAL(10,2)
);

INSERT INTO Sales (TransactionID, Store, SalesAmount)
 VALUES
(1, 'A', 100.00),
(2, 'A', 200.00),
(3, 'A', 150.00),
(4, 'B', 250.00),
(5, 'B', 300.00);

SELECT * FROM Sales

SELECT Store, sum(SalesAmount) from sales
group by Store

USE de_project

 DROP TABLE IF EXISTS Employees1;
 CREATE TABLE Employees1 (
            EmployeeID INT,
            Name VARCHAR(100),
            Department VARCHAR (50),
            HireDate DATE
); 

INSERT INTO Employees1 ( EmployeeID, Name, Department,  HireDate)
VALUES
(1, 'Alice', 'HR', '2020-05-01'),
(1, 'Alice', 'HR', '2022-06-15'),
(2, 'Bob', 'IT', '2021-07-15'),
(3, 'Charlie', 'Finance', '2020-09-30'),
(3, 'Charlie', 'Finance', '2022-05-22');
SELECT * FROM Employees1

use de_project

SELECT EmployeeID, Name, Department, HireDate,
ROW_NUMBER() OVER ( partition by EmployeeID order by HireDate asc) as rownum
FROM Employees1

WITH EmployeeRANK AS(

SELECT EmployeeID, Name, Department, HireDate,
ROW_NUMBER() OVER ( partition by EmployeeID order by HireDate asc) as rownum
FROM Employees1

)
SELECT * FROM EmployeeRank where RowNum = 1

use de_project

WITH EmployeeRANK AS(

SELECT EmployeeID, Name, Department, HireDate,
ROW_NUMBER() OVER ( partition by EmployeeID order by HireDate asc) as rownum
FROM Employees1

)
SELECT EmployeeID, Name, Department, HireDate FROM EmployeeRank where RowNum = 1

use de_project

CREATE TABLE Students (
       StudentID INT,
       StudentName VARCHAR(100),
       ExamScore INT
);

INSERT INTO Students( StudentID, StudentName, ExamScore)
VALUES
(1, 'Alice', 95),
(2, 'Bob', 90),
(3, 'Charlie', 95),
(4, 'David', 85),
(5, 'Eva', 90);
select * from Students

use de_project

SELECT StudentID, StudentName, ExamScore,
rank() over(order by ExamScore desc) as Score_rank from Students

SELECT StudentID, StudentName, ExamScore,
dense_rank() over(order by ExamScore desc) as Score_rank from Students


CREATE TABLE ProductSales (
    ProductID INT,
    ProductName VARCHAR(100),
    SalesAmount INT
);


INSERT INTO ProductSales (ProductID, ProductName, SalesAmount) VALUES
(1, 'Product 1', 500),
(2, 'Product 2', 600),
(3, 'Product 3', 550),
(4, 'Product 4', 700),
(5, 'Product 5', 750),
(6, 'Product 6', 800),
(7, 'Product 7', 850),
(8, 'Product 8', 900),
(9, 'Product 9', 950),
(10, 'Product 10', 1000),
(11, 'Product 11', 600),
(12, 'Product 12', 650),
(13, 'Product 13', 700),
(14, 'Product 14', 750),
(15, 'Product 15', 800),
(16, 'Product 16', 850),
(17, 'Product 17', 900),
(18, 'Product 18', 950),
(19, 'Product 19', 1000),
(20, 'Product 20', 100),
(21, 'Product 21', 200),
(22, 'Product 22', 250),
(23, 'Product 23', 300),
(24, 'Product 24', 350),
(25, 'Product 25', 400),
(26, 'Product 26', 450),
(27, 'Product 27', 500),
(28, 'Product 28', 550),
(29, 'Product 29', 600),
(30, 'Product 30', 650),
(31, 'Product 31', 700),
(32, 'Product 32', 750),
(33, 'Product 33', 800),
(34, 'Product 34', 850),
(35, 'Product 35', 900),
(36, 'Product 36', 950),
(37, 'Product 37', 1000),
(38, 'Product 38', 550),
(39, 'Product 39', 600),
(40, 'Product 40', 650),
(41, 'Product 41', 700),
(42, 'Product 42', 750),
(43, 'Product 43', 800),
(44, 'Product 44', 850),
(45, 'Product 45', 900),
(46, 'Product 46', 950),
(47, 'Product 47', 1000),
(48, 'Product 48', 550),
(49, 'Product 49', 600),
(50, 'Product 50', 650);

select ProductID, ProductName, SalesAmount,
    PERCENT_RANK() OVER(ORDER BY SalesAmount DESC) AS PERCENTRANK FROM ProductSales;

select ProductID, ProductName, SalesAmount,
    PERCENT_RANK() OVER(ORDER BY SalesAmount DESC) AS PERCENTRANK,
	RANK() OVER(ORDER BY SalesAmount DESC) AS RANK_S
FROM ProductSales;

CREATE TABLE EmployeeSales (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    SalesAmount DECIMAL(10, 2)
);

INSERT INTO EmployeeSales (EmployeeID, EmployeeName, SalesAmount) VALUES
(1, 'Alice', 10000),
(2, 'Bob', 8500),
(3, 'Charlie', 7500),
(4, 'David', 6000),
(5, 'Eva', 11000),
(6, 'Frank', 4500),
(7, 'Grace', 3000),
(8, 'Hank', 4000),
(9, 'Ivy', 8000),
(10, 'Jack', 9500);

SELECT * FROM EmployeeSales

SELECT EmployeeID,EmployeeName, SalesAmount,
       NTILE(4) OVER (ORDER BY SalesAmount DESC) AS PreformanceGroup
FROM EmployeeSales

use de_project

drop table if exists EmployeeSalaries;
CREATE TABLE EmployeeSalaries (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Salary DECIMAL(10, 2),
    Year INT
);
INSERT INTO EmployeeSalaries (EmployeeID, EmployeeName, Salary, Year) VALUES
(1, 'Alice', 5000, 2023),
(1, 'Alice', 5500, 2024),
(2, 'Bob', 4500, 2023),
(2, 'Bob', 4800, 2024),
(3, 'Charlie', 4000, 2023),
(3, 'Charlie', 4200, 2024),
(4, 'David', 4600, 2023),
(4, 'David', 4700, 2024),
(5, 'Eva', 5200, 2023),
(5, 'Eva', 5400, 2024);

SELECT * ,
LAG (Salary) over (partition by EmployeeID order by Year) as PreviousYearSalary
from EmployeeSalaries;

SELECT * ,
LAG (Salary) over (order by Year) as PreviousYearSalary
from EmployeeSalaries;

SELECT * ,
LAG (Salary) over (partition by EmployeeID order by Year) as PreviousYearSalary,
Salary - LAG (Salary) over (partition by EmployeeID order by Year) as SalaryChange
from EmployeeSalaries;

CREATE TABLE SalesData (
    SaleID INT,
    EmployeeName VARCHAR(100),
    SaleAmount DECIMAL(10, 2),
    SaleDate DATE
);
INSERT INTO SalesData (SaleID, EmployeeName, SaleAmount, SaleDate) VALUES
(1, 'Alice', 5000, '2025-01-01'),
(2, 'Bob', 3000, '2025-01-02'),
(3, 'Charlie', 4000, '2025-01-03'),
(4, 'David', 4500, '2025-01-04'),
(5, 'Eva', 5500, '2025-01-05');

SELECT * FROM SalesData
DROP TABLE IF EXISTS ProductSales;
CREATE TABLE ProductSales(
ProductID INT,
ProductName VARCHAR(50),
SalesAmount INT,
SaleDate DATE
);

INSERT INTO ProductSales (ProductID, ProductName, SalesAmount, SaleDate)
VALUES
(1, 'Product A', 500.00, '2025-01-01'),
(2, 'Product A', 400.00, '2025-02-02'),
(3, 'Product A', 700.00, '2025-03-01'),
(4, 'Product A', 500.00, '2025-04-02');

SELECT * FROM ProductSales

SELECT * ,
LEAD(SalesAmount) OVER (ORDER BY SaleDate) as NextSaleAmount
FROM ProductSales

SELECT ProductID, ProductName, SaleDate, SalesAmount,  
LEAD(SalesAmount) OVER (ORDER BY SaleDate) as NextSaleAmount
FROM ProductSales

SELECT ProductID, ProductName, SaleDate, SalesAmount,  
LEAD(SalesAmount) OVER (ORDER BY SaleDate) as NextMonthAmount,
SalesAmount - LEAD(SalesAmount) OVER (ORDER BY SaleDate) as SaleDifference
FROM ProductSales

SELECT ProductID, ProductName, SaleDate, SalesAmount,  
LEAD(SalesAmount) OVER (ORDER BY SaleDate) as NextMonthAmount,
LEAD(SalesAmount) OVER (ORDER BY SaleDate) - SalesAmount as SaleDifference
FROM ProductSales

drop table if exists EmployeeSalaries;
CREATE TABLE EmployeeSalaries (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Salary DECIMAL(10, 2),
    Year INT
);
INSERT INTO EmployeeSalaries (EmployeeID, EmployeeName, Salary, Year) VALUES
(1, 'Alice', 5000, 2021),
(1, 'Alice', 5500, 2022),
(1, 'Alice', 6000, 2023),
(1, 'Alice', 6500, 2024),
(1, 'Alice', 7000, 2025),
(2, 'Bob', 4500, 2023),
(2, 'Bob', 4800, 2024),
(3, 'Charlie', 4000, 2023),
(3, 'Charlie', 4200, 2024),
(4, 'David', 4600, 2023),
(4, 'David', 4700, 2024),
(5, 'Eva', 5200, 2023),
(5, 'Eva', 5400, 2024);

SELECT * FROM  EmployeeSalaries

SELECT *  ,
first_value (Salary) OVER (PARTITION BY EmployeeID ORDER BY Year) as Frist_Salary
FROM EmployeeSalaries;

SELECT *  ,
last_value (Salary) OVER (PARTITION BY EmployeeID ORDER BY Year) as Last_Salary
FROM EmployeeSalaries;

SELECT *  ,
last_value (Salary) OVER (PARTITION BY EmployeeID ORDER BY Year
                           ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) as Last_Salary
FROM EmployeeSalaries;

SELECT *  ,
last_value (Salary) OVER (PARTITION BY EmployeeID ORDER BY Year
                           ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) as Last_Salary,
last_value (Salary) OVER (PARTITION BY EmployeeID ORDER BY Year
                           ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING)-Salary as Difference
FROM EmployeeSalaries;

drop table if exists EmployeeSalaries;
CREATE TABLE EmployeeSalaries (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    SalaryDate DATE
);
INSERT INTO EmployeeSalaries (EmployeeID, EmployeeName, Department, Salary, SalaryDate) VALUES
(1, 'Alice', 'HR', 5000.00, '2025-01-01'),
(2, 'Bob', 'Engineering', 7000.00, '2025-01-02'),
(3, 'Charlie', 'Engineering', 8000.00, '2025-01-03'),
(4, 'David', 'HR', 6000.00, '2025-01-04'),
(5, 'Eva', 'Engineering', 7500.00, '2025-01-05'),
(6, 'Frank', 'Engineering', 6500.00, '2025-01-06'),
(7, 'Grace', 'HR', 5500.00, '2025-01-07'),
(8, 'Hank', 'Engineering', 8000.00, '2025-01-08');	

SELECT * FROM EmployeeSalaries;

SELECT * FROM EmployeeSalaries order by Salary

SELECT * ,
nth_value(salary, 3) OVER (PARTITION BY Department ORDER BY Salary DESC) as Nth
FROM EmployeeSalaries;

SELECT * ,
nth_value(salary, 3) OVER (PARTITION BY Department ORDER BY Salary DESC
                           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) as Nth
FROM EmployeeSalaries;

SELECT * ,
nth_value(salary, 2) OVER (PARTITION BY Department ORDER BY Salary DESC
                           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) as Nth
FROM EmployeeSalaries;
