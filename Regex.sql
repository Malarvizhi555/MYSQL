use test

CREATE TABLE Regex_Samples(
   Id INT AUTO_INCREMENT PRIMARY KEY,
   Sample_Text VARCHAR(100)
);

INSERT INTO Regex_Samples (Sample_Text) VALUES
('Apple'),
('Banana'),
('Cherry'),
('Date'),
('Elderberry'),
('Fig'),
('Grape'),
('Honeydaw'),
('Running'),
('123abc');

SELECT * FROM Regex_Samples;

select *
FROM Regex_Samples
WHERE Sample_Text REGEXP '^a';

select *
FROM Regex_Samples
WHERE Sample_Text REGEXP 'e$';

select *
FROM Regex_Samples
WHERE Sample_Text REGEXP '^[0-9]';

select *
FROM Regex_Samples
WHERE Sample_Text REGEXP 'ing$';

select *
FROM Regex_Samples
WHERE Sample_Text REGEXP '(.)\\1';

select *
FROM Regex_Samples
WHERE Sample_Text REGEXP '^[A-Z a-z]+$';

select *
FROM Regex_Samples
WHERE Sample_Text REGEXP '^.{5}$';

select *
FROM Regex_Samples
WHERE Sample_Text REGEXP '^[0-9]{3}[A-Z a-z]+$';

select *
FROM Regex_Samples
WHERE Sample_Text REGEXP '^(apple|banana)$';

CREATE TABLE demo_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(50),
    phone VARCHAR(25),
    email VARCHAR(100),
    date_col VARCHAR(10),   -- Storing as VARCHAR for the demo
    status VARCHAR(20),
    sku VARCHAR(20),
    username VARCHAR(30),
    notes VARCHAR(100)
);


INSERT INTO demo_data (full_name, phone, email, date_col, status, sku, username, notes)
VALUES
-- 1
('John Smith', 
 '123-456-7890', 
 'john@example.com', 
 '2025-02-07', 
 'pending', 
 'ABCD', 
 'johnsmith', 
 'Ships to CA'),

-- 2
('Alice Johnson', 
 '(987) 654-3210', 
 'alice@@example.net', 
 '2025-02-07', 
 'inactive', 
 'SKU-123', 
 'alice', 
 'NY location'),

-- 3
('Bob Williams', 
 '+1-555-123-4567', 
 'bob@sample.org', 
 '20250207', 
 'complete', 
 '1SKU', 
 'bob123', 
 'Shipping to CA'),

-- 4
('Mary 1 White', 
 '(123) 123-4567', 
 'mary123@example.com', 
 '2025-13-31', 
 'PENDING', 
 'abc-999', 
 'mary_white', 
 'Something about CA or'),

-- 5
('Mark-Spencer', 
 '1234567890', 
 'mark@example.com', 
 '2024-11-02', 
 'active', 
 'SKU-9999', 
 'mark', 
 'Random note'),

-- 6
('Jane O''Connor',   -- Note the doubled apostrophe for SQL
 '987-654-3210', 
 'jane.o.connor@example.org', 
 '2024-12-31', 
 'inactive', 
 'ABCDE', 
 'janeO', 
 'Contains CA or NY'),

-- 7
('Invalid Mail', 
 '000-000-0000', 
 'invalid@@example..com', 
 '2023-01-15', 
 'inactive', 
 'XYZ000', 
 'invalid', 
 'Double @ and dots'),

-- 8
('NoSpacesHere', 
 '+12-345-678-9012',
 'nospaces@example.co',
 '2025-02-07',
 'pending',
 'SKU999',
 'NoSpaces',
 'Ends with .co domain');
  
  SELECT*FROM demo_data
  
select *
FROM demo_data
WHERE date_col REGEXP '^[0-[0-9]9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]$';

SELECT *
FROM demo_data
WHERE date_col REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$';

SELECT *
FROM demo_data
WHERE full_name REGEXP '^[A-Z a-z]+$';


  
  

