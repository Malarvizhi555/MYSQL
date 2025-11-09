use uber;
alter table rides add column is_delete boolean default false;
select*from  rides;
update rides set  is_delete=true where driver_id =103;
select *from rides;

CREATE TABLE demo1 (Sno int,name varchar(100),Country varchar(3) default 'ind');
select* from demo1;
desc demo1;
insert into demo1 (Sno, name, country) value(2, 'Raghini', 'usa');

use de_project;
CREATE TABLE CustomerTransactions(
     id INT PRIMARY KEY,
     login_device VARCHAR(50),
     customer_name  VARCHAR(20),
     ip_address VARCHAR(100),
     product VARCHAR(100),
     amount DECIMAL (10,2),
     is_placed BOOLEAN,
     is_viewed BOOLEAN,
     transaction_status VARCHAR(20)
);

INSERT INTO CustomerTransactions VALUES
(1, 'Mobile', 'Raghini', '192.168.1.1', 'Laptop', 50000.00, TRUE, FALSE, 'Completed'),
(2, 'Desktop', 'Kayal', '192.168.1.2', 'Smartphone', 20000.00, TRUE, TRUE, 'Completed'),
(3, 'Tablet', 'Arjun', '192.168.1.3', 'Headphones', 1500.00,  FALSE, TRUE, 'Failed'),
(4, 'Mobile', 'Meena', '192.168.1.4', 'Shoes', 2500.00, TRUE, FALSE, 'Completed'),
(5, 'Desktop', 'Malar', '192.168.1.5', 'Watch', 5000.00, TRUE, TRUE, 'Completed'),
(6, 'Mobile', 'Sowmya', '192.168.1.6', 'Tablet', 15000.00, TRUE, TRUE, 'Completed'),
(7, 'Tablet', 'Ramesh', '192.168.1.7', 'Smartphone', 25000.00, FALSE, TRUE, 'Failed'),
(8, 'Desktop', 'Divya', '192.168.1.8', 'Laptop', 60000.00, TRUE, FALSE, 'Completed'),
(9, 'Mobile', 'Arun', '192.168.1.9', 'Smartwatch', 12000.00, TRUE, TRUE, 'Completed'),
(10, 'Tablet', 'Mahe', '192.168.1.10', 'Laptop', 55000.00, FALSE, FALSE, 'Pending');
     
select * from CustomerTransactions;

select count(*) from CustomerTransactions;

select count(*) from CustomerTransactions where transaction_status = 'Failed'

select count(*) from CustomerTransactions where transaction_status = 'Failed' and product = 'Laptop'

select count(*) from CustomerTransactions where transaction_status = 'Failed' or transaction_status = 'pending'

use de_project;

select count(*) from CustomerTransactions where transaction_status in ('Failed','pending')

select count(*) from CustomerTransactions where transaction_status not in ('Failed', 'pending')

select sum(amount) from CustomerTransactions

select sum(amount) from CustomerTransactions where transaction_status = 'completed'

select sum(amount) as Total_Transactions from CustomerTransactions where transaction_status = 'Completed'

select min(amount) as Min_Transactions from CustomerTransactions

select max(amount) as Max_Transactions from CustomerTransactions

select avg(amount) as avg_transactions from CustomerTransactions

select login_device,
SUM(amount) as Total_Revenue
from CustomerTransactions;


select login_device,
SUM(amount) as Total_Revenue
from CustomerTransactions
group by login_device;

select login_device,
sum(amount) as Total_Revenue
from CustomerTransactions
group by login_device
HAVING
SUM(amount) >80000;

select login_device,
sum(amount) as Total_Revenue
from CustomerTransactions where
SUM(amount) >80000
group by login_device

select login_device,
sum(amount) as Total_Revenue
from CustomerTransactions where
amount >80000
group by login_device

select login_device,
sum(amount) as Total_Revenue
from CustomerTransactions where
group by login_device
HAVING
amount >80000

use de_project

select

case
   when 8 > 10 then 'True'
   else 'Flase'
end as Test

select

case
    when 8 > 10 then 'True'
    when 10 > 8 then 'Yes'
    else 'Flase'
end as Test

CREATE TABLE CustomerData (
Id int PRIMARY KEY,
Customer_Name VARCHAR(20),
Email VARCHAR(50),
Phone_Numbers VARCHAR (15),
Address VARCHAR(100),
Amount DECIMAL (10,2)
);

CREATE TABLE CustomerData (
    Id INT PRIMARY KEY,
    Customer_Name VARCHAR(20),
    Email VARCHAR(50), 
    Phone_Number VARCHAR(15), 
    Address VARCHAR(100), 
    Amount DECIMAL(10,2)
);

INSERT INTO CustomerData VALUES
(1, 'Raghini', 'raghini123@gmail.com', '+9189764 55555', 'Chennai', 1500.00),
(2, 'Kumari', Null, '+91 65487 15424', 'Gova', Null),
(3, 'Kayal', 'kayal555@gmail.com', Null, 'Banglore', 3000.00),
(4, 'Malar', 'malar111@gmail.com', Null, 'Delhi', 5000.00),
(5, 'Meena', 'meena@gmail.com', '+91 96541 21312', 'Chennai', 2500.00);

INSERT INTO CustomerData  Values
(6, 'Karthi', 'karthi@gmail.com', '+918976511232', 'Trichy', 1500.00);

INSERT INTO CustomerData  Values
(7, 'Kevin', null, null, 'Trichy', 1500.00);

INSERT INTO CustomerData  Values
(8, 'Gowtham', 'gowtham@gmail.com', '+91 91254 36541', 'null', 1500.00);

 

select * from CustomerData

SELECT
    Customer_Name,
    Amount,
    CASE
        WHEN Amount > 4000 THEN 'High Spender'
        WHEN Amount BETWEEN 2000 AND 4000 THEN 'Medium Spender'
        WHEN Amount <= 2000 THEN 'Low Spender'
	else 'No data'
    End as Spending
from CustomerData

SELECT

Customer_Name,
case
   when Phone_Number is null then Email
end as contact
from CustomerData;

SELECT

Customer_Name,
Case
    When phone_Number is null then email
    else phone_Number
end as Contact
from CustomerData

select

Customer_Name,
Case
    when email is null and phone_Number is null then '9999'
    when phone_Number is null then email
    else Phone_Number
end as Contact
from CustomerData


select * from CustomerData limit 3;

use de_project;

select count(*) from CustomerData where Phone_Number = null

select count(*) from CustomerData where Phone_Number IS NULL

SELECT COUNT(*) FROM CustomerData WHERE Phone_Number IS NOT NULL

select count(*) from CustomerData WHERE Address is null 'Null'

SELECT 
     Id,
     Customer_Name,
     Email,
     Phone_Number,
     Address
FROM
     CustomerData
WHERE
     Email IS NULL
     OR Phone_Number IS NULL
     OR Address IS NULL;
     
SELECT
     Id,
     Customer_Name,
     Email,
     Phone_Number,
     Address
FROM
     CustomerData
WHERE
     Email IS NULL
     AND Phone_Number IS NULL
     AND Address IS NULL;
     
SELECT
     Id,
     Customer_Name,
     Email,
     Phone_Number,
     Address
FROM
     CustomerData
WHERE
     Email IS NULL
     AND Phone_Number IS NULL
     
select id,
        Customer_Name,
        Email,
        Phone_Number,
        Address,
        amount
from customerData

SELECT Id,
         Customer_Name,
         
         Amount,
         coalesce (Amount,'0.00')
from CustomerData;

SELECT coalesce(NULL,NULL,NULL,'0.00')

use de_project

SELECT coalesce(NULL, NULL, NULL, '0.00', NULL, NULL, '111')

SELECT Id,
        Customer_Name,
        
        Amount,
        IFNULL (Amount, '0.00')
FROM CustomerData

SELECT Id,
        Customer_Name,
        
        Amount,
        IFNULL (Amount, '0.00', 'FFF')
FROM CustomerData

CREATE TABLE CustomerDetails(
Id INT PRIMARY KEY,
Customer_Name VARCHAR(50),
Email VARCHAR(50),
City VARCHAR(10),
Phone VARCHAR(11)
);
desc CustomerDetails

INSERT INTO CustomerDetails Values 
(1, 'Raghini', 'raghini342@gmail.com', 'Singapore', '452541'),
(2, 'Mahe', 'mahe111@gmail.com', 'Singapore', '751212'),
(3, 'Kayal', 'kayal1342@gmail.com', 'America', '54621'),
(4, 'Malar', 'malar1142@gmail.com', 'Bangolre', '97567'),
(5, 'kumari', 'kumarii342@gmail.com', 'Srianka', '4712');

SELECT * FROM CustomerDetails

SELECT length(Customer_Name) as Name_Length

from CustomerDetails;


UPDATE CustomerDetails
SET customer_Name = 'Kumari Aammasi'
WHERE Id = 5; 

UPDATE CustomerDetails
SET Customer_Name ='Raghini Mahe'
where id =1;

UPDATE CustomerDetails
SET Customer_Name ='Kayal Mahe'
where id =3;

UPDATE CustomerDetails
SET Customer_Name ='Malar Mahe'
where id =4;

select * from CustomerDetails
 
SELECT

length(Customer_Name) as Name_Length,
Upper(City) as City_Upper,
Lower(Customer_Name) as Cust_lower,
Concat(Customer_Name, '-', City, '-','TN') as Name_City,
Substring(Customer_Name, 1, 7) as Name_Prefix,
Trim('  Chennai  ') as Trimmed_City,
Rpad(Customer_Name, 15, '*') as left_Padded_Name,
REPLACE(Customer_Name, ' ', '_') as Update_Name,
INSTR(Customer_Name, 'a') as Postion_of_a,
LEFT(Customer_Name,5) as Frist_5_Char,
RIGHT(Customer_Name,5) AS Frist_5_Char,
Reverse(Customer_Name) as Reverse_Name,
FORMAT(3546871253,2) as Format_Num


from CustomerDetails;

select
length(Upper(Concat(Customer_Name, '-', City, '-','TN'))) as Name_City
from CustomerDetails



    

