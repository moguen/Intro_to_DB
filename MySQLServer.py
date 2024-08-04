import mysql.connector
from mysql.connector import Error

def create_database():
    """Create the 'alx_book_store' database if it does not already exist."""
    try:
        # Establish a connection to the MySQL server
        connection = mysql.connector.connect(
            host='localhost',  # Replace with your MySQL server host
            user='root',       # Replace with your MySQL username
            password='your_password'  # Replace with your MySQL password
        )

        # Check if the connection was successful
        if connection.is_connected():
            print("Successfully connected to the MySQL server")

            # Create a cursor object
            cursor = connection.cursor()

            # Create the 'alx_book_store' database
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            
            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        print(f"Error: {e}")
    
    finally:
        if (connection.is_connected()):
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    create_database()
