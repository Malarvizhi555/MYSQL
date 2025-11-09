DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id   INT AUTO_INCREMENT ,
    order_date DATE NOT NULL, 
    customer_name VARCHAR(50),
    amount     DECIMAL(10,2),
PRIMARY KEY(order_id, order_date)
)
PARTITION BY RANGE (YEAR(order_date)) (
    PARTITION p_before_2020 VALUES LESS THAN (2020),
    PARTITION p_2020       VALUES LESS THAN (2021),
    PARTITION p_2021       VALUES LESS THAN (2022),
    PARTITION p_2022       VALUES LESS THAN (2023),
    PARTITION p_future     VALUES LESS THAN MAXVALUE
);


INSERT INTO orders (order_date, customer_name, amount)
VALUES
('2019-05-10', 'Alice', 100.00),
('2020-01-15', 'Bob', 200.50),
('2020-12-01', 'Charlie', 300.00),
('2021-07-20', 'Diana', 150.75),
('2022-03-02', 'Edward', 500.00),
('2025-06-18', 'FutureMan', 9999.99);

select * from orders

SELECT 
    PARTITION_NAME,
    PARTITION_METHOD,
    PARTITION_EXPRESSION,
    SUBPARTITION_METHOD,
    SUBPARTITION_EXPRESSION
FROM information_schema.PARTITIONS
WHERE TABLE_SCHEMA = 'test'
  AND TABLE_NAME   = 'orders';
  
  show create table orders;

--show output
CREATE TABLE `orders` (
   `order_id` int NOT NULL AUTO_INCREMENT,
   `order_date` date NOT NULL,
   `customer_name` varchar(50) DEFAULT NULL,
   `amount` decimal(10,2) DEFAULT NULL,
   PRIMARY KEY (`order_id`,`order_date`)
 ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
 /*!50100 PARTITION BY RANGE (year(`order_date`))
 (PARTITION p_before_2020 VALUES LESS THAN (2020) ENGINE = InnoDB,
  PARTITION p_2020 VALUES LESS THAN (2021) ENGINE = InnoDB,
  PARTITION p_2021 VALUES LESS THAN (2022) ENGINE = InnoDB,
  PARTITION p_2022 VALUES LESS THAN (2023) ENGINE = InnoDB,
  PARTITION p_future VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */

SELECT * FROM orders WHERE year(order_date) = 2020 ; 

EXPLAIN FORMAT =JSON
SELECT * FROM orders WHERE year(order_date) = 2021;

EXPLAIN FORMAT = JSON
SELECT * FROM orders WHERE order_date = '2021-07-20'; 

use test
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    department  VARCHAR(50),
    primary key (employee_id,department)
)
PARTITION BY LIST COLUMNS (department) (
    PARTITION p_sales       VALUES IN ('Sales'),
    PARTITION p_hr          VALUES IN ('HR'),
    PARTITION p_engineering VALUES IN ('Engineering', 'DevOps'),
    PARTITION p_other       VALUES IN ('Finance', 'Marketing', 'Operations')
);


INSERT INTO employees (first_name, last_name, department)
VALUES
('Alice', 'Smith', 'Sales'),
('Bob', 'Johnson', 'HR'),
('Charlie', 'Lee', 'Engineering'),
('Diana', 'Lopez', 'DevOps'),
('Eve', 'Turner', 'Marketing');

SELECT*FROM Employees WHERE department = 'Sales'

EXPLAIN 
SELECT * FROM Employees WHERE department = 'Sales'

EXPLAIN FORMAT = JSON 
SELECT * FROM Employees WHERE department = 'Sales'

EXPLAIN FORMAT = JSON 
SELECT * FROM Employees WHERE department  in ('Sales','Hr')

--Hash

CREATE TABLE sensor_data (
    sensor_id     INT NOT NULL,
    reading_time  DATETIME NOT NULL,
    reading_value DECIMAL(10,2),
    PRIMARY KEY (sensor_id, reading_time)
)
PARTITION BY HASH(sensor_id)
PARTITIONS 2;

INSERT INTO sensor_data (sensor_id, reading_time, reading_value)
VALUES
(101, '2025-01-01 10:00:00', 23.50),
(102, '2025-01-01 10:05:00', 24.10),
(103, '2025-01-01 10:10:00', 22.75),
(104, '2025-01-01 10:15:00', 25.00),
(105, '2025-01-01 10:20:00', 20.00),
(106, '2025-01-01 10:25:00', 21.60);


SELECT * FROM sensor_data WHERE sensor_id = 101

EXPLAIN FORMAT = JSON
SELECT * FROM sensor_data WHERE sensor_id = 101

EXPLAIN FORMAT = JSON
SELECT * FROM sensor_data WHERE sensor_id = 104

Note:-
account_num, phone_num, customer_id

hash(sensor_id)
13 % 2 = 1
10 % 2 = 0
reminder = 1
reminder = 0

0  1
101 % 2 =1
102 % 2 =0
p0                                                    p1
10                                                  13
                                                    (101,'2025-01-01 10:00:00', 23.50)
(102, '2025-01-01 10:05:00', 24.10) 
													(103, '2025-01-01 10:10:00', 22.75)
(104, '2025-01-01 10:15:00', 25.00)
													(105, '2025-01-01 10:20:00', 20.00)
(106, '2025-01-01 10:25:00', 21.60)


