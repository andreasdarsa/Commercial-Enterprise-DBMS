CREATE TABLE Product (
  prod_id INTEGER   NOT NULL ,
  type_prod VARCHAR(20)    ,
  purc_price INTEGER    ,
  sale_price INTEGER    ,
  brief_desc VARCHAR(40)    ,
  ext_desc VARCHAR(100)    ,
  amount INTEGER      ,
PRIMARY KEY(prod_id));




CREATE TABLE Supplier (
  supplier_id INTEGER   NOT NULL ,
  name VARCHAR(20)    ,
  phone_num INTEGER    ,
  city VARCHAR(20)    ,
  region VARCHAR(20)    ,
  street_name VARCHAR(20)    ,
  street_num INTEGER      ,
PRIMARY KEY(supplier_id));




CREATE TABLE Customer (
  customer_id INTEGER   NOT NULL ,
  name VARCHAR(10)    ,
  phone_num INTEGER    ,
  city VARCHAR(10)    ,
  region VARCHAR(20)    ,
  postal_code INTEGER    ,
  street_name VARCHAR(20)    ,
  street_num INTEGER      ,
PRIMARY KEY(customer_id));




CREATE TABLE Employee (
  employee_id INTEGER   NOT NULL ,
  first_name VARCHAR(10)    ,
  last_name VARCHAR(10)    ,
  city VARCHAR(20)    ,
  region VARCHAR(20)    ,
  postal_code INTEGER    ,
  street_name VARCHAR(20)    ,
  street_num INTEGER    ,
  phone_num INTEGER    ,
  tax_reg_num INTEGER    ,
  identity_num VARCHAR(10)      ,
PRIMARY KEY(employee_id));




CREATE TABLE Purchase_from_supplier (
  Product_prod_id INTEGER   NOT NULL ,
  Supplier_supplier_id INTEGER   NOT NULL ,
  amount INTEGER    ,
  unit_price INTEGER    ,
  total_cost INTEGER      ,
PRIMARY KEY(Product_prod_id, Supplier_supplier_id)    ,
  FOREIGN KEY(Product_prod_id)
    REFERENCES Product(prod_id),
  FOREIGN KEY(Supplier_supplier_id)
    REFERENCES Supplier(supplier_id));


CREATE INDEX Product_has_Supplier_FKIndex1 ON Purchase_from_supplier (Product_prod_id);
CREATE INDEX Product_has_Supplier_FKIndex2 ON Purchase_from_supplier (Supplier_supplier_id);


CREATE INDEX IFK_Rel_01 ON Purchase_from_supplier (Product_prod_id);
CREATE INDEX IFK_Rel_02 ON Purchase_from_supplier (Supplier_supplier_id);


CREATE TABLE Sale_to_customer (
  Product_prod_id INTEGER   NOT NULL ,
  Customer_customer_id INTEGER   NOT NULL ,
  Employee_employee_id INTEGER   NOT NULL ,
  unit_price FLOAT    ,
  date_of_sale DATE    ,
  amount INTEGER    ,
  total_value FLOAT      ,
PRIMARY KEY(Product_prod_id, Customer_customer_id, Employee_employee_id)      ,
  FOREIGN KEY(Product_prod_id)
    REFERENCES Product(prod_id),
  FOREIGN KEY(Customer_customer_id)
    REFERENCES Customer(customer_id),
  FOREIGN KEY(Employee_employee_id)
    REFERENCES Employee(employee_id));


CREATE INDEX Product_has_Customer_FKIndex1 ON Sale_to_customer (Product_prod_id);
CREATE INDEX Product_has_Customer_FKIndex2 ON Sale_to_customer (Customer_customer_id);
CREATE INDEX Sale_to_customer_FKIndex3 ON Sale_to_customer (Employee_employee_id);


CREATE INDEX IFK_Rel_03 ON Sale_to_customer (Product_prod_id);
CREATE INDEX IFK_Rel_04 ON Sale_to_customer (Customer_customer_id);
CREATE INDEX IFK_Rel_05 ON Sale_to_customer (Employee_employee_id);

INSERT INTO Employee(employee_id, first_name, last_name, city, region, postal_code, street_name, street_num, phone_num, tax_reg_num, identity_num) VALUES
(1, 'John', 'Papadopoulos', 'Athens', 'Attica', 10558, 'Main St', 10, 2101234567, 123456789, 'ID12345'),
(2, 'Maria', 'Papageorgiou', 'Thessaloniki', 'Central Macedonia', 54621, 'Second St', 20, 2310123456, 987654321, 'ID54321'),
(3, 'Kostas', 'Nikolaou', 'Patras', 'Western Greece', 26221, 'Third St', 30, 2610123456, 192837465, 'ID67890');

INSERT INTO Product(prod_id, type_prod, purc_price, sale_price, brief_desc, ext_desc, amount) VALUES
(1, 'Electronics', 80, 120, 'Smartphone', 'A high-end smartphone with a large display and powerful processor.', 50),
(2, 'Furniture', 150, 250, 'Office Chair', 'Ergonomic office chair with adjustable height and lumbar support.', 20),
(3, 'Electronics', 200, 300, 'Laptop', 'Lightweight laptop with long battery life and high performance.', 15);

INSERT INTO Supplier(supplier_id, name, phone_num, city, region, street_name, street_num) VALUES
(1, 'Tech Supplies Co.', 2109876543, 'Athens', 'Attica', 'Supplier St', 5),
(2, 'Office Furnishings Ltd.', 2310987654, 'Thessaloniki', 'Central Macedonia', 'Furniture Ave', 15);

INSERT INTO Customer(customer_id, name, phone_num, city, region, postal_code, street_name, street_num) VALUES
(1, 'Alice', 2105551234, 'Athens', 'Attica', 10558, 'Customer St', 12),
(2, 'Bob', 2310554321, 'Thessaloniki', 'Central Macedonia', 54621, 'Buyer Ave', 22);

INSERT INTO Purchase_from_supplier(Product_prod_id, Supplier_supplier_id, amount, unit_price, total_cost) VALUES
(1, 1, 50, 80, 4000),
(2, 2, 20, 150, 3000),
(3, 1, 15, 200, 3000);

INSERT INTO Sale_to_customer(Product_prod_id, Customer_customer_id, Employee_employee_id, unit_price, date_of_sale, amount, total_value) VALUES
(1, 1, 1, 120, '2021-03-15', 2, 240),
(2, 2, 2, 250, '2021-06-20', 1, 250),
(3, 1, 3, 300, '2021-11-05', 1, 300);
