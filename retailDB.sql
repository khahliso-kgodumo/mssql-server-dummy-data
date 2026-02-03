
IF DB_ID('RetailDB') IS NULL
    CREATE DATABASE RetailDB;
GO
USE RetailDB;
GO

-- Drop tables if they already exist (for reruns)
IF OBJECT_ID('OrderDetails', 'U') IS NOT NULL DROP TABLE OrderDetails;
IF OBJECT_ID('Orders', 'U') IS NOT NULL DROP TABLE Orders;
IF OBJECT_ID('Products', 'U') IS NOT NULL DROP TABLE Products;
IF OBJECT_ID('Customers', 'U') IS NOT NULL DROP TABLE Customers;
GO


CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Price DECIMAL(10,2),
    StockQuantity INT
);


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100),
    City NVARCHAR(50)
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT,
    LineTotal DECIMAL(10,2)
);


INSERT INTO Products (ProductName, Category, Price, StockQuantity) VALUES
('Laptop', 'Electronics', 1200.00, 50),
('Smartphone', 'Electronics', 800.00, 100),
('Headphones', 'Accessories', 150.00, 200),
('Coffee Maker', 'Home Appliances', 90.00, 75),
('Desk Chair', 'Furniture', 250.00, 40);


INSERT INTO Customers (FirstName, LastName, Email, City) VALUES
('Alice', 'Johnson', 'alice.johnson@email.com', 'New York'),
('Bob', 'Smith', 'bob.smith@email.com', 'Chicago'),
('Charlie', 'Brown', 'charlie.brown@email.com', 'Los Angeles'),
('Diana', 'Prince', 'diana.prince@email.com', 'Houston'),
('Ethan', 'Hunt', 'ethan.hunt@email.com', 'Miami');


INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2024-01-15', 1350.00),
(2, '2024-02-10', 800.00),
(3, '2024-03-05', 340.00),
(4, '2024-04-20', 250.00),
(5, '2024-05-12', 1200.00);


INSERT INTO OrderDetails (OrderID, ProductID, Quantity, LineTotal) VALUES
(1, 1, 1, 1200.00), -- Laptop
(1, 3, 1, 150.00),  -- Headphones
(2, 2, 1, 800.00),  -- Smartphone
(3, 4, 2, 180.00),  -- Coffee Maker
(3, 3, 1, 150.00),  -- Headphones
(4, 5, 1, 250.00),  -- Desk Chair
(5, 1, 1, 1200.00); -- Laptop
GO
