import mysql.connector
from mysql.connector import Error
try:
  python --version
  
  #Establish the connector
  connection = mysql.connector.connect(
      host = 'localhost',
      database = 'test',
      user = 'root',
      password = 'Root'
)

if connection.is_connected():
   print("Connected to MYSQL database")
   
   #create a cursor object using the connection
   cursor = connection.cursor()
   
   #Define your query(for example selecting all rows from a table)
   query = "SELECT * FROM app"
   
   #Execute the query
   cursor.excute(query)
   
   #Fetch all rows from the executed query
   rows = cursor.fetchall()
   
   #process the rows
   for row in rows:
       print(row)
       
except Error as e:
      print ("Error  while connecting to MYSQL", e)
      
finally:
     #close the cursor and connection
     if connection.is_connected():
		cursor.close()
        connection.close()
        print("MYSQL Connection is closed")
	

import JDBC Connect.connector
from JDBC Connect.connector import Error

try:
    # Establish the connection
    connection = mysql.connector.connect(
        host='localhost',            # e.g., 'localhost' or the IP address of your MySQL server
        database='your_database',    # the name of the database you created
        user='your_username',        # your MySQL username
        password='your_password'     # your MySQL password
    )

    if connection.is_connected():
        print("Connected to MySQL database")

        # Create a cursor object using the connection
        cursor = connection.cursor()

        # Define your query (for example, selecting all rows from a table)
        query = "SELECT * FROM your_table"

        # Execute the query
        cursor.execute(query)

        # Fetch all rows from the executed query
        rows = cursor.fetchall()

        # Process the rows
        for row in rows:
            print(row)

except Error as e:
    print("Error while connecting to MySQL", e)

finally:
    # Close the cursor and connection
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection is closed")
        
use test

