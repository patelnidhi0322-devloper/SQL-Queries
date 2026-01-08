Create Database OrderSummary;
USE OrderSummary;
GO

/*CREATE TABLE Customers (
    CustomerID INT IDENTITY(100,1) PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);
Drop table Customers;

CREATE TABLE Books (
    BookID INT IDENTITY(1,1) PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL
);

CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderItems (
    OrderItemID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    BookID INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
*/

-- Customers
INSERT INTO Customers (CustomerName)
VALUES ('Ravi Kumar'), ('Anita Sharma');
Select * from Orders;
-- Books
INSERT INTO Books (Title, UnitPrice)
VALUES 
('Clean Code', 650),
('SQL Fundamentals', 450);

-- Orders
INSERT INTO Orders (CustomerID, OrderDate)
VALUES (100, '2025-01-12'),(100, '2025-01-01'),(100, '2025-01-01'),(100, '2025-02-01');
INSERT INTO Orders (CustomerID, OrderDate)
VALUES (100, '2025-01-01');
INSERT INTO Orders (CustomerID, OrderDate)
VALUES (100, '2025-02-01');

-- OrderItems
INSERT INTO OrderItems (OrderID, BookID, Quantity)
VALUES 
(3, 1, 1),
(3, 2, 2),
(12, 2, 2);

Update Books
SET Title = 'SQL Basics for Beginners'
WHERE BookID = 1;

Select * from Books;

Select * from Customers;

Select * from OrderItems;

Select * from Orders;

Delete from Orders where OrderID = 11;

 SELECT c.CustomerName,
        o.OrderID,
        o.OrderDate,
        b.Title AS BookTitle,
        oi.Quantity,
        b.UnitPrice
        FROM Customers c
        LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
        LEFT JOIN OrderItems oi ON o.OrderID = oi.OrderID
        LEFT JOIN Books b ON oi.BookID = b.BookID
        WHERE c.CustomerID = 100
        ORDER BY o.OrderID;


/*
Task 1 Write a query to display all customers.
Learn:
SELECT * FROM table

Task 2 Write a query to display only CustomerID and CustomerName.
Learn:
Selecting specific columns

Task 3 Write a query to display all orders placed after 1-Jan-2025.
Learn:
WHERE with date condition

LEVEL 2 – INNER JOIN (CORE)
Task 4 Display OrderID, OrderDate, CustomerName for all orders.
Learn:
INNER JOIN between Orders and Customers

Task 5 Display OrderID, Book Title, Quantity for all order items.
Learn:
JOIN between OrderItems and Books

Task 6 Display CustomerName, OrderID, OrderDate, Book Title, Quantity.
Learn:
Joining 3 tables


LEVEL 2 – LEFT JOIN (IMPORTANT)
Task 7 Display all customers, even if they have no orders.
Learn:
Difference between INNER JOIN vs LEFT JOIN

Task 8 Display customers who have NOT placed any orders.
Learn:
LEFT JOIN + WHERE IS NULL

LEVEL 4 – CALCULATIONS (REAL PROJECT)
Task 9 Display OrderID, Book Title, Quantity, UnitPrice, LineTotal
(LineTotal = Quantity × UnitPrice)
Learn:
Calculated columns

Task 10 Display total amount per order.
Learn:
SUM() + GROUP BY
*/
Select * from Customers;

Select CustomerID, CustomerName From Customers;

Select * from Orders Where OrderDate > '01-01-2025';

Select o.OrderID,
       o.OrderDate,
       c.CustomerName
       From Orders o
       INNER JOIN Customers c ON o.CustomerID = o.CustomerID;

Select oi.OrderID,
       b.Title,
       oi.Quantity
       From OrderItems oi
       INNER JOIN Books b ON oi.BookID = oi.BookID;

Select c.CustomerName,
       o.OrderID,
       o.OrderDate,
       b.Title,
       oi.Quantity
       from Customers c
       Inner Join Orders o ON c.CustomerID = o.CustomerID
       Inner Join OrderItems oi ON o.OrderID = oi.OrderID
       Inner join Books b On oi.BookID = b.BookID

Select c.CustomerID,
       c.CustomerName,
       o.OrderID
       from Customers c
       Left Join Orders o ON c.CustomerID = o.CustomerID
      
Select c.CustomerID,
       c.CustomerName
       from Customers c
       Left Join Orders o ON c.CustomerID = o.CustomerID
       Where o.OrderID IS NULL;
      
Select oi.OrderID,
       b.Title,
       oi.Quantity,
       b.UnitPrice,
       (oi.Quantity * b.UnitPrice) AS LineTotal
       From OrderItems oi
       Join Books b ON oi.BookID = b.BookID;

Select 
       c.CustomerName,
       SUM(oi.Quantity * b.UnitPrice) AS TotalAmount
       from Customers c
       Join Orders o ON c.CustomerID = o.CustomerID
       Join OrderItems oi ON o.OrderID = oi.OrderID
       Join Books b ON oi.BookID = b.BookID
       Group BY c.CustomerName;
   
        
