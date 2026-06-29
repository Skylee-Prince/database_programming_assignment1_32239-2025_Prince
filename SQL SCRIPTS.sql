-- Customers Table
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100),
    city VARCHAR2(50)
);

-- Employees Table
CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    employee_name VARCHAR2(100),
    manager_id NUMBER
);

-- Products Table
CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100),
    price NUMBER(10,2)
);

-- Sales Table
CREATE TABLE sales (
    sale_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    employee_id NUMBER,
    product_id NUMBER,
    quantity NUMBER,
    sale_date DATE,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY(employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY(product_id) REFERENCES products(product_id)
);

[20:04, 6/26/2026] Skylee Prince: INSERT INTO customers VALUES (1,'John','Kigali');
INSERT INTO customers VALUES (2,'Mary','Musanze');
INSERT INTO customers VALUES (3,'David','Huye');
INSERT INTO customers VALUES (4,'Sarah','Rubavu');
[20:06, 6/26/2026] Skylee Prince: INSERT INTO employees VALUES (1,'Alice',NULL);
INSERT INTO employees VALUES (2,'Brian',1);
INSERT INTO employees VALUES (3,'Chris',1);
INSERT INTO employees VALUES (4,'Daniel',2);
[20:06, 6/26/2026] Skylee Prince: INSERT INTO products VALUES (1,'Laptop',1200);
INSERT INTO products VALUES (2,'Phone',800);
INSERT INTO products VALUES (3,'Tablet',600);
INSERT INTO products VALUES (4,'Printer',300);
[20:07, 6/26/2026] Skylee Prince: INSERT INTO sales VALUES (1,1,2,1,2,DATE '2026-06-01');
INSERT INTO sales VALUES (2,2,3,2,1,DATE '2026-06-03');
INSERT INTO sales VALUES (3,1,2,3,3,DATE '2026-06-05');
INSERT INTO sales VALUES (4,3,4,2,2,DATE '2026-06-08');
INSERT INTO sales VALUES (5,4,3,4,5,DATE '2026-06-10');
INSERT INTO sales VALUES (6,2,4,1,1,DATE '2026-06-15');

COMMIT;


--=======================================================================
-- PART A: CTEs
--=======================================================================

--1. SIMPLE CTE
-- Display customers who made purchases

WITH CustomerSales AS (
    SELECT customer_id, quantity
    FROM sales
)
SELECT *
FROM CustomerSales;

-- 2.MULTIPLY CTE
WITH CustomerOrders AS (
    SELECT customer_id,
           SUM(quantity) AS TotalQuantity
    FROM sales
    GROUP BY customer_id
),
CustomerDetails AS (
    SELECT customer_id,
           customer_name
    FROM customers
)
SELECT c.customer_name,
       o.TotalQuantity
FROM CustomerOrders o
JOIN CustomerDetails c
ON o.customer_id = c.customer_id;

-- 3. RESURSIVE CTE
-- Employee hierarchy using Oracle CONNECT BY

SELECT 
    employee_id,
    employee_name,
    manager_id,
    LEVEL AS hierarchy_level
FROM employees
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id;

-- 4. AGGREGATION CTE
WITH EmployeeSales AS (
    SELECT 
        employee_id,
        SUM(quantity) AS total_quantity_sold
    FROM sales
    GROUP BY employee_id
)
SELECT 
    e.employee_id,
    e.employee_name,
    es.total_quantity_sold
FROM EmployeeSales es
JOIN employees e
ON e.employee_id = es.employee_id;

-- 5.CTE COMBINED JOIN OPERATIONS
WITH SalesInfo AS (
    SELECT customer_id, product_id, quantity
    FROM sales
)
SELECT 
    c.customer_name,
    p.product_name,
    s.quantity
FROM SalesInfo s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id;

--=======================================================================
-- PART B: SQL WINDOW FUNCTIONS
--=======================================================================

-- 1. ROW_NUMBER
Ranking Function (Row number)


-- Assign unique row numbers to each sale based on quantity (highest first)

SELECT 
    employee_id,
    product_id,
    quantity,
    ROW_NUMBER() OVER (ORDER BY quantity DESC) AS row_num
FROM sales;

-- 2. RANK_SALES
-- Rank sales (ties share same rank, gaps allowed)

SELECT 
    employee_id,
    quantity,
    RANK() OVER (ORDER BY quantity DESC) AS rank_value
FROM sales;

-- 3. DENSE_RANK
-- Dense rank (no gaps in ranking)

SELECT 
    employee_id,
    quantity,
    DENSE_RANK() OVER (ORDER BY quantity DESC) AS dense_rank_value
FROM sales;

-- 4. PERCENT RANK
-- Shows relative position of each sale

SELECT 
    employee_id,
    quantity,
    PERCENT_RANK() OVER (ORDER BY quantity) AS percent_rank_value
FROM sales;

-- 5. SUM() OVER()
-- Running total of all quantities

SELECT 
    employee_id,
    quantity,
    SUM(quantity) OVER () AS total_sales
FROM sales;

-- 6. AVG( ) OVER( )
-- Average quantity across all sales

SELECT 
    employee_id,
    quantity,
    AVG(quantity) OVER () AS avg_sales
FROM sales;

-- 7. MIN( ) OVER( ) 
-- Minimum sale quantity in dataset

SELECT 
    employee_id,
    quantity,
    MIN(quantity) OVER () AS min_sales
FROM sales;

-- 8. MAX( ) OVER( )
-- Maximum sale quantity in dataset

SELECT 
    employee_id,
    quantity,
    MAX(quantity) OVER () AS max_sales
FROM sales;

-- 9. Navigation Functions LAG( ) 

-- Compare each sale with previous row

SELECT 
    employee_id,
    quantity,
    LAG(quantity) OVER (ORDER BY sale_id) AS prev_sale
FROM sales;

-- 10. LEAD( )
-- Compare each sale with next row

SELECT 
    employee_id,
    quantity,
    LEAD(quantity) OVER (ORDER BY sale_id) AS next_sale
FROM sales;

-- 11. NTILE( ) DISTRIBUTION FUNCTIONS
-- Split sales into 4 equal groups

SELECT 
    employee_id,
    quantity,
    NTILE(4) OVER (ORDER BY quantity DESC) AS quartile_group
FROM sales;

-- 12. CUME_DIST( )
-- Cumulative distribution of sales

SELECT 
    employee_id,
    quantity,
    CUME_DIST() OVER (ORDER BY quantity) AS cumulative_distribution
FROM sales;*

