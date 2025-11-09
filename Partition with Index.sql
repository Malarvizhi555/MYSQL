use test

drop table if exists Customers;

Create table Customers (
    CustomerID   INT AUTO_INCREMENT ,
    CustomerName VARCHAR(50),
    City         VARCHAR(20),
    Area         VARCHAR(20),
    Orders       int,
    Primary key(CustomerID, City)
)
PARTITION BY List columns (city) ( 
   PARTITION p_Karur VALUES IN('Karur'),
   PARTITION p_Coimbatore VALUES IN('Coimbatore'),
   PARTITION p_Trichy VALUES IN('Trichy'),
   PARTITION p_Other      VALUES IN ('Chennai','Madurai','Salem','Erode')
);

INSERT INTO Customers (CustomerName, City, Area, Orders) VALUES
('Raja', 'Karur', 'West', 5),
('Malar', 'Coimbatore', 'RS Puram', 7),
('Priya', 'Trichy', 'Srirangam', 9),
('Arun',  'Chennai', 'Anna Nagar', 6),
('vicky', 'Madurai', 'kirshna Nagar', 11),
('Nalani', 'Salem', 'kanchpil Nagar', 13),
('Ashok', 'ERode', 'Ashok Nagar', 21);

SELECT * FROM Customers

SELECT * 
FROM Customers WHERE City = 'Coimbatore';


EXPLAIN FORMAT = JSON
SELECT * 
FROM Customers WHERE City = 'Coimbatore';

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id      INT AUTO_INCREMENT ,
    order_date    DATE NOT NULL,
    customer_name VARCHAR(50),
    amount        DECIMAL(10,2),
    PRIMARY KEY(order_id, order_date)
)

PARTITION BY RANGE (YEAR(order_date)) (
    PARTITION p_before_2020 VALUES LESS THAN (2020),
    PARTITION p_2020       VALUES LESS THAN (2021),
    PARTITION p_2021       VALUES LESS THAN (2022),
    PARTITION p_2022       VALUES LESS THAN (2023),
    PARTITION p_future     VALUES LESS THAN MAXVALUE
);
CREATE INDEX idx_order_date ON orders (order_date);


INSERT INTO orders (order_date, customer_name, amount)
VALUES
('2019-05-10', 'Alice', 100.00),
('2020-01-15', 'Bob', 200.50),
('2020-12-01', 'Charlie', 300.00),
('2021-07-20', 'Diana', 150.75),
('2022-03-02', 'Edward', 500.00),
('2025-06-18', 'FutureMan', 9999.99);

SELECT *
FROM orders
WHERE order_date BETWEEN '2020-01-01' AND '2020-12-31';

drop table if exists orders;
CREATE TABLE orders (
    order_id      INT AUTO_INCREMENT PRIMARY KEY,
    order_date    DATE NOT NULL,
    customer_name VARCHAR(50),
    amount        DECIMAL(10,2)
)

PARTITION BY RANGE (YEAR(order_date))
SUBPARTITION BY HASH (MONTH(order_date))
PARTITIONS 3
SUBPARTITIONS 2
(
  PARTITION p_before_2020 VALUES LESS THAN (2020),
  PARTITION p_2020        VALUES LESS THAN (2021),
  PARTITION p_future      VALUES LESS THAN MAXVALUE
);


DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id       INT AUTO_INCREMENT PRIMARY KEY,
    order_date     DATE NOT NULL,
    customer_name  VARCHAR(50),
    amount         DECIMAL(10,2),
    order_year     INT GENERATED ALWAYS AS (YEAR(order_date)) STORED,
    order_month    INT GENERATED ALWAYS AS (MONTH(order_date)) STORED,
    UNIQUE KEY (order_id, order_year, order_month)  -- required for partitioning
)
PARTITION BY RANGE (order_year)
SUBPARTITION BY HASH (order_month)
SUBPARTITIONS 2
(
  PARTITION p_before_2020 VALUES LESS THAN (2020),
  PARTITION p_2020        VALUES LESS THAN (2021),
  PARTITION p_future      VALUES LESS THAN MAXVALUE
);
