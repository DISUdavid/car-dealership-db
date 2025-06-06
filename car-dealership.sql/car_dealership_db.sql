DROP DATABASE if EXISTS CarDealership;

CREATE DATABASE CarDealership;
USE CarDealership;

--TABLE 1
CREATE TABLE dealerships (
    dealership_id   INT NOT NULL AUTO_INCREMENT,
    name    VARCHAR(50),
    address  VARCHAR(50),
    phone    VARCHAR(12),
    PRIMARY KEY (dealership_id)
);

--TABLE 2
CREATE TABLE vehicles(
    vin   VARCHAR(20) NOT NULL,
    make  VARCHAR(30),
    model  VARCHAR(35),
    sold   VARCHAR(70),
    color   VARCHAR(15),
    price DECIMAL(10,2),
    year   INT,
    PRIMARY KEY (vin)
);

--TABLE 3
CREATE TABLE inventory (
    dealership_id INT ,
    vin VARCHAR(20),
    PRIMARY KEY (dealership_id,vin)
);

--TABLE 4
CREATE TABLE sales_contracts(
    sales_id INT NOT NULL AUTO_INCREMENT,
    credit   INT,
    customer_name  VARCHAR(50),
    vin  VARCHAR(20),
    sales_price   DECIMAL(10,2),
    dealership_name  VARCHAR(50),
    PRIMARY KEY (sales_id),
    FOREIGN KEY (vin) REFERENCES vehicles (vin)
);

--TABLE 5
CREATE TABLE lease_contracts(
    lease_id INT NOT NULL AUTO_INCREMENT,
    credit  INT,
    customer_name VARCHAR(50),
    vin VARCHAR(20),
    lease_price DECIMAL(10,2),
    dealership_name   VARCHAR(50),
    PRIMARY KEY (lease_id),
    FOREIGN KEY (vin) REFERENCES vehicles (vin)
);


INSERT INTO dealerships (name, address, phone) VALUES
('AutoMax', '123 Main St', '555-1234'),
('CarNation', '456 Elm St', '555-5678');

INSERT INTO vehicles (vin, make, model, sold, color, price, year) VALUES
('1HGCM82633A123456', 'Honda', 'Accord', 'No', 'Blue', 22000.00, 2023),
('2T3ZF4DVXBW123456', 'Toyota', 'RAV4', 'Yes', 'Red', 28000.00, 2022);

INSERT INTO inventory (dealership_id, vin) VALUES
(1, '1HGCM82633A123456'),
(2, '2T3ZF4DVXBW123456');

INSERT INTO sales_contracts (credit, customer_name, vin, sales_price, dealership_name) VALUES
(750, 'John Doe', '2T3ZF4DVXBW123456', 27000.00, 'CarNation');

INSERT INTO lease_contracts (credit, customer_name, vin, lease_price, dealership_name) VALUES
(720, 'Jane Smith', '1HGCM82633A123456', 350.00, 'AutoMax');

