USE coffee_company;

CREATE TABLE COFFEE_SHOP (shop_id INT NOT NULL AUTO_INCREMENT, shop_name VARCHAR(50), city VARCHAR(50), state CHAR(2), PRIMARY KEY(shop_id));
CREATE TABLE EMPLOYEE (employee_id INT NOT NULL AUTO_INCREMENT, first_name VARCHAR(30), last_name VARCHAR(30), hire_date DATE, job_title VARCHAR(30), shop_id INT NOT NULL, PRIMARY KEY (employee_id), FOREIGN KEY (shop_id) REFERENCES COFFEE_SHOP(shop_id));
CREATE TABLE SUPPLIER(supplier_id INT NOT NULL AUTO_INCREMENT, company_name VARCHAR(50), country VARCHAR(30), sales_contact_name VARCHAR(60), email VARCHAR(50) NOT NULL, PRIMARY KEY (supplier_id));
CREATE TABLE COFFEE(coffee_id INT NOT NULL AUTO_INCREMENT, shop_id INT, supplier_id INT, coffee_name VARCHAR(30), price_per_pound NUMERIC(5,2), PRIMARY KEY (coffee_id), FOREIGN KEY (shop_id) REFERENCES COFFEE_SHOP (shop_id), FOREIGN KEY (supplier_id) REFERENCES SUPPLIER (supplier_id));

INSERT INTO COFFEE_SHOP(shop_name, city, state)
VALUES("Dave's Coffee", "Falls Church", "VA"),
	("A Cup of Martha", "Austin", "TX"),
    ("Friends Cafe", "Brooklyn", "NY");   

INSERT INTO EMPLOYEE(first_name, last_name, hire_date, job_title, shop_id)
VALUES("Ross", "Geller", '2022-04-18', "Manager", 3),
	("Sam", "Evans", "2022-04-25", "Supervisor", 2),
    ("Robert", "Downey", "2022-04-25", "Barista", 1);
    
INSERT INTO SUPPLIER(company_name, country, sales_contact_name, email)
VALUES("Pepe's Cocoa", "Columbia", "Juan Suarez", "jsuarez@pepescocoa.com"),
	("Keureg", "United States", "Lisa Simpson", "lsimpson@keureg.com"),
    ("Michael's Coffee", "United States", "Michael Bolton", "mbolton@michaelcoffee.com");
    
INSERT INTO COFFEE(shop_id, supplier_id, coffee_name, price_per_pound)
VALUES(1, 3, "Capaccino", 26.99),
	(3, 1, "Columbian", 54.99),
    (2, 2, "Dark Latte", 19.99);
    
CREATE VIEW employee_view AS ( SELECT employee_id, CONCAT( 'first_name', ' ', 'last_name' ) AS full_name, hire_date, job_title, shop_id FROM EMPLOYEE); 
SELECT * FROM employee_view;

CREATE INDEX coffee_index ON COFFEE (coffee_name);
SELECT * FROM COFFEE;

SELECT * FROM SUPPLIER WHERE supplier_id > 1;

SELECT
  COFFEE_SHOP.shop_name AS "Shop Name",
  COFFEE_SHOP.city AS "City",
  COFFEE_SHOP.state AS "State", 
  SUPPLIER.company_name AS "Supplier",
  COFFEE.coffee_name AS "Coffee Name",
  COFFEE.price_per_pound AS "Price /lb"
FROM COFFEE_SHOP
JOIN COFFEE
  ON COFFEE_SHOP.shop_id = COFFEE.shop_id
JOIN SUPPLIER
  ON COFFEE.supplier_id = SUPPLIER.supplier_id;