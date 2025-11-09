use test

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS contractors;

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    position    VARCHAR(50),
    salary      DECIMAL(10,2)
);

CREATE TABLE contractors (
    contractor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    position      VARCHAR(50),
    hourly_rate   DECIMAL(10,2)
);

INSERT INTO employees (first_name, last_name, position, salary)
VALUES
('Alice', 'Smith', 'Developer', 70000.00),
('Bob', 'Johnson', 'Developer', 75000.00),
('Charlie', 'Lee', 'Manager', 90000.00);

INSERT INTO contractors (first_name, last_name, position, hourly_rate)
VALUES
('Dave', 'Williams', 'Developer', 40.00),
('Eve', 'Brown', 'Tester', 35.00),
('Bob', 'Johnson', 'Developer', 45.00);

SELECT * FROM employees;

SELECT * FROM contractors;

SELECT * FROM employees
UNION ALL
SELECT * FROM contractors;

SELECT * FROM employees
UNION 
SELECT * FROM contractors;


SELECT first_name, last_name, position FROM employees
UNION ALL
SELECT first_name, last_name, position FROM contractors;

SELECT first_name, last_name, position FROM employees
UNION 
SELECT first_name, last_name, position FROM contractors;

CREATE TABLE contractors1 (
    contractor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name    VARCHAR(50)
);

INSERT INTO contractors1 (first_name)
VALUES
('Dave'),
('Eve'),
('Bob');

SELECT * FROM contractors1

SELECT employee_id, first_name FROM employees
UNION 
SELECT contractor_id, first_name FROM contractors
UNION 
SELECT contractor_id, first_name FROM contractors1 ;

use test

drop table if exists customers;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(50) NOT NULL,
    last_name   VARCHAR(50) NOT NULL,
    email       VARCHAR(100) NOT NULL,
    city        VARCHAR(100) NOT NULL
);

CREATE INDEX idx_email ON customers (email);

INSERT INTO customers (first_name, last_name, email, city)
VALUES
('John', 'Doe', 'john@example.com', 'New York'),
('Jane', 'Smith', 'jane.smith@example.com', 'Los Angeles'),
('Michael', 'Brown', 'michael.brown@example.com', 'Chicago'),
('Emily', 'Johnson', 'emily.johnson@example.com', 'Houston'),
('Robert', 'Green', 'robert.green@example.com', 'Phoenix');

SELECT * FROM customers;

SELECT * FROM customers where email= 'john@example.com';
 
EXPLAIN
SELECT *
FROM customers
where email= 'john@example.com';

EXPLAIN ANALYZE
SELECT *
FROM customers
where email= 'john@example.com';


CREATE TABLE customers1 (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(50) NOT NULL,
    last_name   VARCHAR(50) NOT NULL,
    email       VARCHAR(100) NOT NULL,
    city        VARCHAR(100) NOT NULL
);

INSERT INTO customers1 (first_name, last_name, email, city)
VALUES
('John', 'Doe', 'john@example.com', 'New York'),
('Jane', 'Smith', 'jane.smith@example.com', 'Los Angeles'),
('Michael', 'Brown', 'michael.brown@example.com', 'Chicago'),
('Emily', 'Johnson', 'emily.johnson@example.com', 'Houston'),
('Robert', 'Green', 'robert.green@example.com', 'Phoenix');

EXPLAIN
SELECT *
FROM customers1
where email= 'john@example.com';

EXPLAIN ANALYZE
SELECT *
FROM customers1
where email= 'john@example.com';

EXPLAIN FORMAT = JSON
SELECT *
FROM customers
where email= 'john@example.com';