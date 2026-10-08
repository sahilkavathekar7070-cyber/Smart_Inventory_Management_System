
CREATE DATABASE inventory_db;

USE inventory_db;

CREATE TABLE customers(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100),
city VARCHAR(50),
state VARCHAR(50)
);

CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
unit_cost DECIMAL(10,2),
selling_price DECIMAL(10,2)
);

CREATE TABLE suppliers (
supplier_id INT PRIMARY KEY,
supplier_name VARCHAR(100),
city VARCHAR(50),
state VARCHAR(50),
supplier_rating DECIMAL(3,2)
);

CREATE TABLE warehouses (
warehouse_id INT PRIMARY KEY,
warehouse_name VARCHAR(100),
city VARCHAR(50),
state VARCHAR(50),
capacity INT
);

CREATE TABLE inventory (
inventory_id INT PRIMARY KEY,
product_id INT,
warehouse_id INT,
stock_quantity INT,
reserved_quantity INT,
damaged_quantity INT,
last_stock_update DATE,

    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);


CREATE TABLE purchase_orders (
purchase_order_id INT PRIMARY KEY,
supplier_id INT,
product_id INT,
warehouse_id INT,
order_date DATE,
expected_date DATE,
received_date DATE,
quantity INT,
unit_cost DECIMAL(10,2),
status VARCHAR(30),

    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);



CREATE TABLE sales_orders (
    sales_order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    warehouse_id INT,
    order_date DATE,
    quantity INT,
    unit_price DECIMAL(10,2),
    status VARCHAR(30),

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);



INSERT INTO customers
(customer_id, customer_name, city, state)
VALUES
(501, 'Aarav Sharma', 'Mumbai', 'Maharashtra'),(502, 'Rohan Patil', 'Pune', 'Maharashtra'),
(503, 'Sneha Kulkarni', 'Nashik', 'Maharashtra'),(504, 'Aditya Joshi', 'Nagpur', 'Maharashtra'),
(505, 'Priya Deshmukh', 'Mumbai', 'Maharashtra'),(506, 'Rahul Mehta', 'Ahmedabad', 'Gujarat'),
(507, 'Neha Shah', 'Surat', 'Gujarat'),(508, 'Vikram Rao', 'Bengaluru', 'Karnataka'),
(509, 'Ananya Iyer', 'Bengaluru', 'Karnataka'),(510, 'Karan Reddy', 'Hyderabad', 'Telangana'),
(511, 'Pooja Nair', 'Kochi', 'Kerala'),(512, 'Arjun Menon', 'Chennai', 'Tamil Nadu'),
(513, 'Meera Singh', 'Delhi', 'Delhi'),(514, 'Yash Verma', 'Noida', 'Uttar Pradesh'),
(515, 'Kavya Gupta', 'Jaipur', 'Rajasthan'),(516, 'Amit Agarwal', 'Delhi', 'Delhi'),
(517, 'Ishita Jain', 'Indore', 'Madhya Pradesh'),(518, 'Siddharth Khan', 'Bhopal', 'Madhya Pradesh'),
(519, 'Tanvi Bhosale', 'Pune', 'Maharashtra'),(520, 'Nikhil More', 'Thane', 'Maharashtra'),
(521, 'Shreya Pawar', 'Mumbai', 'Maharashtra'),(522, 'Manish Kapoor', 'Chandigarh', 'Chandigarh'),
(523, 'Riya Sinha', 'Kolkata', 'West Bengal'),(524, 'Harsh Vora', 'Vadodara', 'Gujarat'),
(525, 'Simran Kaur', 'Amritsar', 'Punjab');

SELECT * FROM customers;

INSERT INTO products
(product_id, product_name, category, unit_cost, selling_price)
VALUES
(101, 'Dell Inspiron 15', 'Electronics', 48000.00, 55000.00),
(102, 'HP Pavilion 14', 'Electronics', 45000.00, 52000.00),
(103, 'Logitech K380 Keyboard', 'Accessories', 2200.00, 2800.00),
(104, 'Logitech M185 Mouse', 'Accessories', 650.00, 900.00),
(105, 'Samsung 24 Inch Monitor', 'Electronics', 9500.00, 12000.00),
(106, 'TP-Link WiFi Router', 'Networking', 1800.00, 2500.00),
(107, 'Epson EcoTank Printer', 'Electronics', 14500.00, 18000.00),
(108, 'HP LaserJet Toner', 'Office Supplies', 4200.00, 5500.00),
(109, 'A4 Copier Paper Pack', 'Office Supplies', 280.00, 380.00),
(110, 'APC 600VA UPS', 'Electronics', 3200.00, 4200.00);


SELECT * FROM products;

INSERT INTO suppliers
(supplier_id, supplier_name, city, state, supplier_rating)
VALUES
(201, 'TechSource India', 'Mumbai', 'Maharashtra', 4.5),
(202, 'Digital Hub Pvt Ltd', 'Pune', 'Maharashtra', 4.2),
(203, 'ElectroMart Suppliers', 'Bengaluru', 'Karnataka', 4.7),
(204, 'OfficePro Distributors', 'Delhi', 'Delhi', 4.1),
(205, 'Prime IT Solutions', 'Hyderabad', 'Telangana', 4.6),
(206, 'SmartTech Distributors', 'Ahmedabad', 'Gujarat', 3.9),
(207, 'Reliable Office Supplies', 'Nashik', 'Maharashtra', 4.3),
(208, 'NextGen Electronics', 'Chennai', 'Tamil Nadu', 4.0);

SELECT * FROM suppliers;



INSERT INTO warehouses
(warehouse_id, warehouse_name, city, state, capacity)
VALUES
(301, 'Mumbai Central Warehouse', 'Mumbai', 'Maharashtra', 5000),
(302, 'Pune Distribution Center', 'Pune', 'Maharashtra', 4000),
(303, 'Bengaluru Warehouse', 'Bengaluru', 'Karnataka', 4500),
(304, 'Delhi Distribution Center', 'Delhi', 'Delhi', 6000);

SELECT * FROM warehouses;

INSERT INTO inventory
(inventory_id, product_id, warehouse_id, stock_quantity,
reserved_quantity, damaged_quantity, last_stock_update)
VALUES
(401, 101, 301, 25, 5, 1, '2026-09-15'),(402, 101, 302, 12, 2, 0, '2026-09-15'),
(403, 102, 301, 18, 3, 0, '2026-09-15'),(404, 102, 303, 30, 5, 1, '2026-09-16'),
(405, 103, 301, 85, 10, 2, '2026-09-16'),(406, 103, 302, 45, 5, 0, '2026-09-16'),
(407, 104, 302, 120, 15, 3, '2026-09-16'),(408, 104, 303, 75, 8, 1, '2026-09-17'),
(409, 105, 301, 22, 4, 0, '2026-09-17'),(410, 105, 304, 35, 6, 1, '2026-09-17'),
(411, 106, 302, 60, 8, 2, '2026-09-17'),(412, 106, 303, 25, 5, 0, '2026-09-18'),
(413, 107, 301, 14, 2, 0, '2026-09-18'),(414, 107, 304, 20, 3, 1, '2026-09-18'),
(415, 108, 302, 40, 7, 1, '2026-09-18'),(416, 108, 304, 28, 4, 0, '2026-09-18'),
(417, 109, 301, 180, 20, 5, '2026-09-19'),(418, 109, 303, 250, 30, 4, '2026-09-19'),
(419, 110, 302, 35, 5, 0, '2026-09-19'),(420, 110, 304, 18, 3, 1, '2026-09-19');

SELECT * FROM inventory;


INSERT INTO purchase_orders
(purchase_order_id, supplier_id, product_id, warehouse_id,
order_date, expected_date, received_date, quantity, unit_cost, status)
VALUES
(501, 201, 101, 301, '2026-01-05', '2026-01-12', '2026-01-11', 20, 48000, 'Received'),
(502, 202, 102, 302, '2026-01-08', '2026-01-16', '2026-01-18', 25, 45000, 'Received'),
(503, 203, 103, 301, '2026-01-12', '2026-01-17', '2026-01-17', 60, 2200, 'Received'),
(504, 204, 109, 304, '2026-01-15', '2026-01-19', '2026-01-20', 200, 280, 'Received'),
(505, 205, 105, 303, '2026-01-20', '2026-01-26', '2026-01-25', 30, 9500, 'Received'),

(506, 206, 106, 302, '2026-02-02', '2026-02-07', '2026-02-09', 50, 1800, 'Received'),
(507, 207, 108, 304, '2026-02-05', '2026-02-12', '2026-02-12', 35, 4200, 'Received'),
(508, 208, 107, 301, '2026-02-10', '2026-02-20', '2026-02-22', 15, 14500, 'Received'),
(509, 201, 110, 302, '2026-02-15', '2026-02-21', '2026-02-20', 30, 3200, 'Received'),
(510, 202, 104, 303, '2026-02-18', '2026-02-23', '2026-02-24', 100, 650, 'Received'),

(511, 203, 101, 304, '2026-03-03', '2026-03-10', '2026-03-09', 15, 48000, 'Received'),
(512, 204, 109, 301, '2026-03-07', '2026-03-11', '2026-03-11', 300, 280, 'Received'),
(513, 205, 102, 303, '2026-03-12', '2026-03-20', '2026-03-22', 20, 45000, 'Received'),
(514, 206, 106, 302, '2026-03-18', '2026-03-23', '2026-03-23', 45, 1800, 'Received'),
(515, 207, 108, 304, '2026-03-20', '2026-03-27', '2026-03-29', 30, 4200, 'Received'),

(516, 208, 105, 301, '2026-04-02', '2026-04-08', '2026-04-07', 25, 9500, 'Received'),
(517, 201, 103, 302, '2026-04-05', '2026-04-10', '2026-04-10', 80, 2200, 'Received'),
(518, 202, 104, 303, '2026-04-10', '2026-04-15', '2026-04-17', 120, 650, 'Received'),
(519, 203, 110, 304, '2026-04-15', '2026-04-21', '2026-04-20', 25, 3200, 'Received'),
(520, 204, 107, 301, '2026-04-20', '2026-04-30', NULL, 20, 14500, 'Pending'),

(521, 205, 101, 302, '2026-05-02', '2026-05-09', '2026-05-10', 18, 48000, 'Received'),
(522, 206, 105, 303, '2026-05-06', '2026-05-12', '2026-05-12', 35, 9500, 'Received'),
(523, 207, 109, 304, '2026-05-10', '2026-05-14', '2026-05-15', 250, 280, 'Received'),
(524, 208, 106, 301, '2026-05-15', '2026-05-20', NULL, 60, 1800, 'Pending'),
(525, 201, 102, 302, '2026-05-20', '2026-05-28', '2026-05-30', 22, 45000, 'Received');


SELECT * FROM purchase_orders;


INSERT INTO sales_orders
(sales_order_id, customer_id, product_id, warehouse_id,
order_date, quantity, unit_price, status)
VALUES
(701, 501, 101, 301, '2026-01-08', 2, 55000, 'Completed'),
(702, 502, 103, 302, '2026-01-12', 5, 2800, 'Completed'),
(703, 503, 105, 303, '2026-01-18', 3, 12000, 'Completed'),
(704, 504, 104, 301, '2026-01-22', 8, 900, 'Completed'),
(705, 505, 109, 304, '2026-01-25', 25, 380, 'Completed'),

(706, 506, 102, 302, '2026-02-03', 2, 52000, 'Completed'),
(707, 507, 106, 303, '2026-02-07', 10, 2500, 'Completed'),
(708, 508, 107, 301, '2026-02-12', 2, 18000, 'Completed'),
(709, 509, 108, 304, '2026-02-16', 5, 5500, 'Completed'),
(710, 510, 110, 302, '2026-02-21', 6, 4200, 'Completed'),

(711, 511, 103, 303, '2026-03-02', 7, 2800, 'Completed'),
(712, 512, 104, 301, '2026-03-06', 12, 900, 'Completed'),
(713, 513, 101, 304, '2026-03-10', 3, 55000, 'Completed'),
(714, 514, 105, 303, '2026-03-15', 4, 12000, 'Completed'),
(715, 515, 109, 301, '2026-03-20', 40, 380, 'Completed'),

(716, 516, 106, 302, '2026-04-01', 15, 2500, 'Completed'),
(717, 517, 107, 301, '2026-04-05', 3, 18000, 'Completed'),
(718, 518, 102, 303, '2026-04-10', 4, 52000, 'Completed'),
(719, 519, 103, 302, '2026-04-14', 10, 2800, 'Completed'),
(720, 520, 108, 304, '2026-04-18', 8, 5500, 'Completed'),

(721, 521, 110, 301, '2026-04-25', 7, 4200, 'Completed'),
(722, 522, 104, 303, '2026-05-02', 20, 900, 'Completed'),
(723, 523, 105, 304, '2026-05-06', 5, 12000, 'Completed'),
(724, 524, 101, 302, '2026-05-10', 2, 55000, 'Completed'),
(725, 525, 109, 301, '2026-05-14', 50, 380, 'Completed'),

(726, 501, 106, 303, '2026-05-18', 12, 2500, 'Completed'),
(727, 502, 103, 302, '2026-05-21', 6, 2800, 'Completed'),
(728, 503, 107, 301, '2026-05-24', 2, 18000, 'Completed'),
(729, 504, 102, 304, '2026-05-27', 3, 52000, 'Pending'),
(730, 505, 104, 301, '2026-05-29', 15, 900, 'Completed');


SELECT * FROM sales_orders;


-- Bussiness Insights

-- What is total sales reveune ?

SELECT SUM(quantity * unit_price) as Total_Sales_Revenue
FROM sales_orders
WHERE status = 'Completed';


-- What is total purchase cost?

SELECT SUM(quantity * unit_cost) as Total_Purchase_Cost
FROM purchase_orders
WHERE status = 'Received';

-- What is overall gross profit and profit margin?

SELECT
    SUM(s.quantity * (s.unit_price - p.unit_cost)) AS gross_profit,
    ROUND(SUM(s.quantity * (s.unit_price - p.unit_cost))/ SUM(s.quantity * s.unit_price) * 100,2
    ) AS profit_margin_percentage
FROM sales_orders s
JOIN products p
    ON s.product_id = p.product_id
WHERE s.status = 'Completed';



-- What is total inventory value ?
SELECT
    SUM( (stock_quantity - reserved_quantity - damaged_quantity) * p.unit_cost
    ) AS total_inventory_value
FROM inventory i
JOIN products p
    ON i.product_id = p.product_id;
    
    
-- Which category generates the highest revenue?
SELECT
    category,
    revenue,
    RANK() OVER (ORDER BY revenue DESC) AS category_rank
FROM (
    SELECT
p.category,
SUM(s.quantity * s.unit_price) AS revenue
FROM sales_orders s
JOIN products p
	ON s.product_id = p.product_id
WHERE s.status = 'Completed'
GROUP BY p.category
) AS category_sales;

-- 

SELECT p.purchase_order_id, p.product_id,pr.product_name,p.quantity
FROM purchase_orders AS p
JOIN products AS pr
ON p.product_id=pr.product_id
ORDER BY quantity DESC;

-- Which suppliers have the highest purchase volume?
SELECT s.supplier_name,sum(p.quantity  * p.unit_cost) AS Total_Amount
From suppliers AS s
join purchase_orders as p
on s.supplier_id = p.supplier_id
group by supplier_name
order by Total_Amount desc;


