--- 1. Show all employees whose last name starts with 'Papa'
SELECT *
FROM Employee
WHERE last_name LIKE 'Papa%';

--- 2. Show a list of all products, sorted by their extensive description
SELECT prod_id, brief_desc, ext_desc, type_prod
FROM Product
ORDER BY ext_desc;

--- 3. Show id and brief description of all products sold at a price higher than 100 in 2021
SELECT prod_id, brief_desc
FROM Product
JOIN Sale_to_customer ON Product.prod_id = Sale_to_customer.Product_prod_id
WHERE Sale_to_customer.total_value > 100 AND Sale_to_customer.date_of_sale BETWEEN '2021-01-01' AND '2021-12-31';

--- 4. Calculate the total cost of all products on stock based on their current amount and purchase price
SELECT SUM(amount * purc_price) AS total_product_cost
FROM Product;

--- 5. Show id and name of all suppliers supplying products of type 'Electronics'
SELECT DISTINCT Supplier.supplier_id, Supplier.name
FROM Supplier
JOIN Purchase_from_supplier ON Supplier.supplier_id = Purchase_from_supplier.Supplier_supplier_id
JOIN Product ON Purchase_from_supplier.Product_prod_id = Product.prod_id
WHERE Product.type_prod = 'Electronics';

--- 6. Show id and full name of the customer who made the company the most money in purchases
SELECT Customer.customer_id, Customer.name
FROM Customer
JOIN Sale_to_customer ON Customer.customer_id = Sale_to_customer.Customer_customer_id
GROUP BY Customer.customer_id
ORDER BY SUM(Sale_to_customer.total_value) DESC
LIMIT 1;

--- 7. Show the name of the employee who made the least number of sales
SELECT Employee.first_name, Employee.last_name
FROM Employee
JOIN Sale_to_customer ON Employee.employee_id = Sale_to_customer.Employee_employee_id
GROUP BY Employee.employee_id, Employee.first_name, Employee.last_name
ORDER BY COUNT(*) ASC
LIMIT 1;

