HomeWork 1.1:

CREATE DATABASE Bank;
USE Bank;
CREATE TABLE Customers(
	customer_id INT auto_increment,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	contact_detail VARCHAR(20)
	PRIMARY KEY (coustomer_id),
	);
CREATE TABLE Account(
	account_number VARCHAR(50) NOT NULL,
	balance INT NOT NULL,
	customer_id INT,
	PRIMARY KEY (account_number),
	FOREIGN KEY (customer_id) REFERENCES Customer (customer_id),
	);
CREATE TABLE Transactions(
	transaction_id INT auto_increment,
	account_number VARCHAR(50) NOT NULL,
	amount INT,
	date VARCHAR(10),
	PRIMARY KEY (transaction_id),
	FOREIGN KEY (account_number) REFERENCES Account (account_number),
	);


HomeWork 1.2:

CREATE DATABASE Restaurant;
USE Restaurant;
CREATE TABLE Menu(
	menu_id INT auto_increment,
	item_name VARCHAR(50),
	price INT,
	PRIMARY KEY(menu_id)
	);
CREATE TABLE Customers(
	customer_id INT auto_increment,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	contact_number VARCHAR(50),
	PRIMARY KEY(customer_id),
	);
CREATE TABLE Tables(
	table_id INT auto_increment,
	capacity INT,
	PRIMARY KEY(table_id)
	);
CREATE TABLE Orders(
	order_id INT auto_increment,
	custoumer_id INT,
	table_id INT,
	order_time TIMESTAMP,
	PRIMARY KEY (order_id),
	FOREIGN KEY(customer_id) REFERENCES Customers(customer_id),
	FOREIGN KEY(table_id) REFERENCES Tables(table_id),
	);
INSERT INTO Menu (item_name,price)
VALUES
('pizza',250),
('berger',130),
('hot dog',170)
;
INSERT INTO Customers (first_name,last_name,contact_number)
VALUES
('ali','yousefei','09170001122'),
('pejman','javid','09381112244')
;
INSERT INTO Tables (capacity)
VALUES
(2),(4),(4),(6)
;
INSERT INTO Orders (customer_id,table_id)
VALUES
(2,4),(1,2)
;