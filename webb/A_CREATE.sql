DROP DATABASE IF EXISTS fwwebb;
CREATE DATABASE IF NOT EXISTS fwwebb;

USE fwwebb;


CREATE TABLE IF NOT EXISTS orders (
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    customer_id INT
);

CREATE TABLE IF NOT EXISTS order_detail(
	order_id INT,
	item_id INT,
	qty INT,
	unit_cost FLOAT(2),
	unit_price FLOAT(2)
);

CREATE TABLE IF NOT EXISTS item_master (
	item_id INT AUTO_INCREMENT PRIMARY KEY,
	item_category VARCHAR(1),
	item_description VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS customer  (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
	customer_name VARCHAR(255),
	customer_type VARCHAR(55)
);

INSERT INTO orders VALUES 
	(1234, '2016-02-01', 533),
	(1235, '2016-03-02', 655),
	(1236, '2016-03-03', 533),
	(1237, '2016-04-15', 567);

INSERT INTO order_detail VALUES 
	(1234,366,3,20.13,35.15),
	(1234,386,1,8.26,15.26),
    (1235,7778,2,938.00,1588.55),
	(1236,586,1,9.12,15.20);

INSERT INTO item_master VALUES 
	(366, 'c', '1/2 inch copper 90 degree elbow'),
	(7778, 'f', '3/4 inch copper tubing 20 feet'),
	(386, 'c', 'Delta Faucet'),
	(586, 'a', 'Water Heater');
    
INSERT INTO customer VALUES
	(533,'Jack\'s Plumbing', 'plumbing'),
    (655,'Joe\'s Mechanical', 'MEC'),
    (534,'AirTemp HVAC', 'AC');