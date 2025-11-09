CREATE User 'jane_doe'@'localhost' IDENTIFIED BY 'Strong';

GRANT SELECT, INSERT ON test.* TO 'jane_doe'@'localhost';

FLUSH PRIVILEGES;

SELECT User, Host FROM Mysql.user;

REVOKE SELECT, INSERT ON test.* FROM 'jane_doe'@'localhost';

FLUSH PRIVILEGES;