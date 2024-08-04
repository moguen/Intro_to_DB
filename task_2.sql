-- Create the database 'alx_book_store' if it does not already exist
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Select the 'alx_book_store' database for subsequent operations
USE alx_book_store;

-- Create the 'Books' table
CREATE TABLE Books (
    -- Unique identifier for each book
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    -- Title of the book
    title VARCHAR(100),
    -- Price of the book
    price INT,
    -- Foreign key referencing 'Authors' table
    author_id INT,
    -- Year of publication of the book
    publication_year INT,
    -- Set up foreign key relationship with the 'Authors' table
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Create the 'Authors' table
CREATE TABLE Authors (
    -- Unique identifier for each author
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    -- Name of the author
    author_name VARCHAR(50)
);

-- Create the 'Customers' table
CREATE TABLE Customers (
    -- Unique identifier for each customer
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    -- Name of the customer
    customer_name VARCHAR(215),
    -- Email address of the customer
    email VARCHAR(215),
    -- Address of the customer
    address TEXT
);

-- Create the 'Orders' table
CREATE TABLE Orders (
    -- Unique identifier for each order
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    -- Foreign key referencing 'Customers' table
    customer_id INT,
    -- Date when the order was placed
    order_date DATE,
    -- Foreign key relationship with 'Customers' table
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create the 'OrderDetails' table
CREATE TABLE OrderDetails (
    -- Foreign key referencing 'Orders' table
    order_id INT,
    -- Foreign key referencing 'Books' table
    book_id INT,
    -- Quantity of the book ordered
    quantity INT,
    -- Primary key composed of 'order_id' and 'book_id'
    PRIMARY KEY (order_id, book_id),
    -- Set up foreign key relationship with 'Orders' table
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    -- Set up foreign key relationship with 'Books' table
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
