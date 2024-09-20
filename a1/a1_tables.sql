CREATE TABLE CLIENTS (
    ClientID INT PRIMARY KEY,
    ClientName VARCHAR(100) NOT NULL
);
CREATE TABLE PRODUCTS (
	ProductID INT PRIMARY KEY,
	ProductName VARCHAR(100) NOT NULL
);
CREATE TABLE ORDERS (
    OrderID INT PRIMARY KEY,
    ClientID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (ClientID) REFERENCES CLIENTS(ClientID),
    FOREIGN KEY (ProductID) REFERENCES PRODUCTS(ProductID)
);
CREATE TABLE PAYMENTS (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    Amount FLOAT,
    FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID)
);
CREATE TABLE SHIPMENTS (
    ShipmentID INT PRIMARY KEY,
    OrderID INT,
    DeliveryAddress VARCHAR(100),
    FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID)
);
INSERT INTO CLIENTS (ClientID, ClientName) VALUES
(1, 'John Doe'),
(2, 'Jane Smith'),
(3, 'Tom Johnson'),
(4, 'Emily Davis'),
(5, 'Michael Brown'),
(6, 'Sarah Wilson'),
(7, 'David Lee'),
(8, 'Karen Taylo'),
(9, 'Chris Evans'),
(10, 'Laura Walker');

INSERT INTO PRODUCTS (ProductID, ProductName) VALUES
(1, 'Laptop'),
(2, 'Smartphone'),
(3, 'Tablet'),
(4, 'Monitor'),
(5, 'Keyboard'),
(6, 'Mouse'),
(7, 'Printer'),
(8, 'Headphones'),
(9, 'Webcam'),
(10, 'Charger');

INSERT INTO ORDERS (OrderID, ClientID, ProductID, Quantity) VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 1),
(4, 4, 4, 2),
(5, 5, 5, 3),
(6, 6, 6, 1),
(7, 7, 7, 1),
(8, 8, 8, 2),
(9, 9, 9, 1),
(10, 10, 10, 3);

INSERT INTO PAYMENTS (PaymentID, OrderID, Amount) VALUES
(1, 1, 2000.00),
(2, 2, 600.00),
(3, 3, 300.00),
(4, 4, 300.00),
(5, 5, 150.00),
(6, 6, 25.00),
(7, 7, 200.00),
(8, 8, 160.00),
(9, 9, 60.00),
(10, 10, 60.00);

INSERT INTO SHIPMENTS (ShipmentID, OrderID, DeliveryAddress) VALUES
(1, 1, '123 Main St'),
(2, 2, '456 Oak St'),
(3, 3, '789 Pine St'),
(4, 4, '101 Maple St'),
(5, 5, '202 Birch St'),
(6, 6, '303 Cedar St'),
(7, 7, '404 Elm St'),
(8, 8, '505 Spruce St'),
(9, 9, '606 Willow St'),
(10, 10, '707 Redwood St');

UPDATE CLIENTS
SET ClientName = 'Laura Walker'
WHERE ClientID = 8;
