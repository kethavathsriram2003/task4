CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(15),
    city VARCHAR(50));
    INSERT INTO Customers (customer_id, name, email, phone, city)
VALUES
(1, 'Alice', 'alice@example.com', '9876543210', 'New York'),
(2, 'Bob', 'bob@example.com', '8765432109', 'Los Angeles'),
(3, 'Charlie', 'charlie@example.com', '7654321098', 'Chicago');


CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0
);
INSERT INTO Products (product_id, product_name, price, stock)
VALUES
(101, 'Laptop', 75000.00, 10),
(102, 'Smartphone', 35000.00, 20),
(103, 'Headphones', 2500.00, 50),
(104, 'Smartwatch', 8000.00, 15);
CREATE TABLE Orders(
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES
(1001, 1, '2025-09-20', 78000.00),
(1002, 2, '2025-09-21', 43000.00),
(1003, 1, '2025-09-22', 2500.00);


CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT DEFAULT 1,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, price)
VALUES
(1, 1001, 101, 1, 75000.00),
(2, 1001, 103, 1, 3000.00),
(3, 1002, 102, 1, 35000.00),
(4, 1002, 104, 1, 8000.00),
(5, 1003, 103, 1, 2500.00);
-- task3 
select * from Customers;
select * from Order_Items;
select * from Order_Items where price > 3000;
select * from Order_Items where order_id>1001; 
select * from Products where product_name like'S%';
select * from Products where product_name like'%S%';
select * from Products where product_name like'%S%'limit 2;
select * from Order_Items where Price between 5000 and 30000;
select * from Order_Items where Price>1000 order by price  ASC;
-- task 4
select avg(Price) from Order_Items where Price>1000 order by price  ASC;
select max(Price) from Order_Items where Price>1000 order by price  ASC;
select min(total_amount) from Orders;
select max(total_amount) from Orders;
select sum(total_amount) from Orders;
select avg(total_amount) from Orders;
select count(total_amount) from Orders;
select customer_id, SUM(total_amount) AS total_spent from Orders GROUP BY customer_id
HAVING SUM(total_amount) > 50000;
select  product_id, SUM(quantity) AS total_quantity_sold from Order_Items
GROUP BY product_id;
select product_id, SUM(quantity) AS total_quantity_sold from Order_Items GROUP BY product_id
HAVING SUM(quantity) > 1;

