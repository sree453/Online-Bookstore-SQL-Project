# Online-Bookstore-SQL-Project
SQL project for online book store management

📌 Project Overview

This project focuses on designing and implementing a relational database system for an online book store using PostgreSQL. The database was developed by importing structured data from CSV files and organizing it into relational tables.

The system manages information related to books, customers, and orders. The main objective of this project is to demonstrate practical knowledge of database management, data handling, and SQL-based analysis.

🛠️ Tools and Technologies Used

PostgreSQL

pgAdmin 4

SQL

CSV Files

GitHub (Version Control)

Windows OS

📂 Data Source

The dataset used in this project consists of three CSV files:

books.csv – Contains book details

customers.csv – Contains customer information

orders.csv – Contains order records

These files were used as the primary source for building the database.

🗄️ Database Structure

The database consists of the following tables:

Books – Stores book information

Customers – Stores customer details

Orders – Stores order transactions

Relationships were created using primary keys and foreign keys to ensure data consistency and integrity.

📥 Data Import Process (Using pgAdmin – GUI Method)

The CSV files were imported into PostgreSQL using the graphical interface provided by pgAdmin.

Steps Followed:

Opened pgAdmin 4 and connected to the PostgreSQL server

Selected the target database

Navigated to Schemas → public → Tables

Right-clicked on the required table

Selected Import/Export Data

Chose the corresponding CSV file

Set format as CSV

Enabled the Header option

Clicked Import to load the data

This approach ensures accurate and efficient data transfer without manual scripting.

📊 Query Execution and Data Analysis

After importing the data, SQL queries were executed using the pgAdmin Query Tool for analysis and reporting.

Basic Data Retrieval
SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM orders;


Used to verify and explore stored data.

Customer Purchase Analysis
SELECT c.name, b.title, o.order_date, o.quantity
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN books b ON o.book_id = b.book_id;


Used to analyze customer buying patterns.

Sales Summary
SELECT b.title, SUM(o.quantity) AS total_sold
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY b.title;


Used to identify best-selling books.

Revenue Analysis
SELECT SUM(b.price * o.quantity) AS total_revenue
FROM orders o
JOIN books b ON o.book_id = b.book_id;


Used to calculate overall revenue.

✅ Data Validation and Integrity

To maintain data accuracy and reliability:

Primary keys were applied

Foreign keys were implemented

NULL values were checked

Duplicate records were reviewed

These practices ensure high-quality and consistent data storage.

📈 Key Learnings

Through this project, I gained hands-on experience in:

Working with PostgreSQL databases

Importing CSV files using pgAdmin

Designing relational tables

Writing optimized SQL queries

Performing business-oriented data analysis

Maintaining database integrity

This project strengthened my practical understanding of database systems.

🚀 Future Enhancements

Possible improvements include:

Adding payment and delivery modules

Implementing stored procedures

Creating database views

Connecting with BI tools (Power BI / Tableau)

Developing frontend integration

👤 Author

Sreeja Theegala
Aspiring Data Analyst / Database Professional
