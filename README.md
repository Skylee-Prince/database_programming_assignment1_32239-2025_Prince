BUSINESS PROBELMS

Businesses often struggle to efficiently track customer purchases, employee performance, and product sales in a single system. Without a structured database, it becomes difficult to analyze sales trends, monitor which employees are generating the most sales, and understand customer buying behavior.

This database system is designed to solve these problems by organizing data into Customers, Employees, Products, and Sales tables. It allows the business to track every sale transaction, identify best-selling products, evaluate employee performance, and analyze customer purchasing patterns.

DATABASE SCHEMA

The database consists of four main tables that work together to manage sales transactions:

1. CUSTOMERS

Stores information about customers.

* customer_id (PK) – Unique ID for each customer
* customer_name – Name of the customer
* city – Location of the customer

⸻

2. EMPLOYEES

Stores employee details.

* employee_id (PK) – Unique ID for each employee
* employee_name – Name of the employee
* manager_id – ID of the employee’s manager

⸻

3. PRODUCTS

Stores product information.

* product_id (PK) – Unique ID for each product
* product_name – Name of the product
* price – Price of the product

⸻

4. SALES

Stores all sales transactions.

* sale_id (PK) – Unique ID for each sale
* customer_id (FK) – Links to CUSTOMERS
* employee_id (FK) – Links to EMPLOYEES
* product_id (FK) – Links to PRODUCTS
* quantity – Number of items sold
* sale_date – Date of the sale

⸻

Relationships

* One customer → many sales
* One employee → many sales
* One product → many sales

CTEs BUSINESS VALUE

Simple CTE: This helps the university quickly identify high-performing students for scholarships or awards.

Multiple CTE: Allows management to compare student performance across departments.

Recursive CTE: Shows the organizational structure of departments.

CTE with Aggregation: Helps administrators know which departments have the highest enrollment.

CTE with JOIN: Provides a report of which courses each student is taking.

WINDOWS FUNCTIONS IMPLEMENTATION

Ranking Functions: used to assign an order or position to each row based on a value (like highest to lowest).

Aggregation Functions: Used to calculate summary values across rows while keeping all rows.

Navigation Functions: Used to compare values between rows (previous or next row).

Distribution Functions: Used to show how data is spread across a dataset or split into groups.


📊 ANALYSIS SECTION

🔵 1. Descriptive Analysis (What happened?)

This analysis focuses on summarizing historical sales data from the system.

* The database shows which products have been sold, how many units were purchased, and which customers made purchases.
* It also shows which employees processed the most sales transactions.
* Sales records indicate overall business activity across different dates, customers, and products.

In simple terms:
It tells what has already happened in the business.

⸻

🔵 2. Diagnostic Analysis (Why did it happen?)

This analysis explains the reasons behind the sales patterns observed.

* High sales of certain products may be due to customer demand or competitive pricing.
* Employees with higher sales may have better customer service skills or handle more active customers.
* Certain customers may purchase more frequently because of location, loyalty, or product preference.
* Seasonal changes in sale_date may influence sales increases or decreases.

In simple terms:
It explains why sales happened the way they did.

⸻

🔵 3. Prescriptive Analysis (What should be done?)

This analysis provides recommendations based on the data.

* The business should promote best-selling products to increase revenue further.
* Employees with lower sales performance may need training or support.
* Customer purchase patterns can be used to create targeted marketing campaigns.
* Stock levels should be adjusted based on frequently sold products to avoid shortages.
* Sales trends over time should be used to plan promotions during peak periods.

In simple terms:
It suggests what actions the business should take next.


Findings
This section summarizes the key insights discovered from analyzing the database using queries, relationships, and expected reporting outputs.

⸻

🔵 1. Sales Depend on Products and Customers

* Sales records show that each transaction is directly linked to a customer and a product.
* Products that are frequently purchased contribute more to overall business activity.
* Customers who appear repeatedly in the SALES table are likely loyal or frequent buyers.

⸻

🔵 2. Employees Impact Sales Performance

* Employees are connected to sales transactions, meaning their performance can be measured using the number of sales they process.
* Some employees handle more transactions than others, showing differences in productivity or workload distribution.

⸻

🔵 3. Products Have Different Levels of Demand

* Some products appear more often in the SALES table than others.
* This indicates varying demand levels, which can help identify best-selling products.

⸻

🔵 4. Customer Behavior Patterns Can Be Identified

* Customers from certain cities may appear more frequently in sales records.
* This helps identify geographic areas with higher demand.

⸻

🔵 5. Sales Data Supports Business Decision-Making

* The SALES table acts as a central source for analyzing business performance.
* It enables tracking of revenue drivers, employee efficiency, and product popularity.

⸻

🎯 Simple Summary

The analysis shows that:

* Customers drive demand
* Products determine revenue
* Employees influence sales performance
* Sales data can guide business decisions and improve efficiency

📚 REFERENCES

* Lecture notes and class materials on SQL, Common Table Expressions (CTEs), and Window Functions.
* Oracle / MySQL SQL documentation:
    * https://dev.mysql.com/doc/
    * https://docs.oracle.com/en/database/
* Database design and ER diagram concepts from database systems coursework.
* dbdiagram.io used for ER diagram creation: https://dbdiagram.io

⸻

📌 ACADEMIC INTEGRITY STATEMENT

This assignment is my original work. I have used only authorized course materials, lectures, and documented SQL references to complete it. All SQL queries, analysis, and design decisions were developed independently to demonstrate my understanding of relational database design, CTEs, and window functions. No unauthorized copying or plagiarism has been involved in the preparation of this work.
