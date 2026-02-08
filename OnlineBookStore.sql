--Create tables
	Drop table if exists Books;
	create table Books(
	Book_id serial primary key,
	Title varchar(100),
	Author varchar(100),
	Genre varchar(50),
	Published_year int,
	price numeric(10,2),
	Stock int
	);
	Drop table if exists Customers;

	create table Customers(
	Customer_id serial primary key,
	name varchar(100),
	email varchar(100),
	phone varchar(10),
	City varchar(50),
	Country varchar(150)
	);

	DROP TABLE IF EXISTS ORDERS;

CREATE TABLE ORDERS (
	ORDER_ID SERIAL PRIMARY KEY,
	CUSTOMER_ID INT REFERENCES CUSTOMERS (CUSTOMER_ID),
	BOOK_ID INT REFERENCES BOOKS (BOOK_ID),
	ORDER_DATE DATE,
	QUANTITY INT,
	TOTAL_AMOUNT NUMERIC(10, 2)
);

SELECT *FROM BOOKS;

SELECT *FROM CUSTOMERS;

SELECT *FROM ORDERS;

--Importing data into Customers Table,Books table and orders table
--Retrieve all books in the "Fiction" genre
SELECT *FROM BOOKS 
WHERE GENRE = 'Fiction';

--Find books published after the year 1950
SELECT *FROMBOOKS
WHERE
	PUBLISHED_YEAR > 1950;

--List all customers from the canada
SELECT *FROM CUSTOMERS
WHERE
	COUNTRY = 'Canada';

--Show orders placed in November 2023
SELECT *FROM ORDERS
WHERE
	ORDER_DATE BETWEEN '2023-11-01' AND '2023-11-30';

--Retrieve the total stock of books available
SELECT
	SUM(STOCK) AS TOTAL_STOCK
FROM BOOKS;

--Find the details of the most expensive book
SELECT
	MAX(PRICE) AS MAXIMUM_PRICE
FROM
	BOOKS;

--Show all customers who ordered more than 1 quantity
SELECT *FROM ORDERS
WHERE
	QUANTITY > 1;

--Retrieve all oders where the total amount exceeds $20
SELECT *FROM ORDERS
WHERE
	TOTAL_AMOUNT > 20;

--List all the genres available in the books table
SELECT DISTINCT GENRE FROM BOOKS;

--Find the book with the lowest stock
SELECT *FROM BOOKS
ORDER BY STOCK
LIMIT 1;

--Calculate the total revenue generated from all orders
SELECT
	SUM(TOTAL_AMOUNT) AS TOTAL_REVENUE
FROM
	ORDERS;

--Advance Topics
--Retrieve the total number of books sold from each genre
SELECT
	B.GENRE,
	SUM(O.QUANTITY) AS TOTAL_BOOKS_SOLD
FROM
	ORDERS O
	JOIN BOOKS B ON O.BOOK_ID = B.BOOK_ID
GROUP BY
	B.GENRE;

--Find the average price of books in the fantasy
SELECT
	ROUND(AVG(PRICE), 2) AS AVERAGE_PRICE
FROM
	BOOKS
WHERE
	GENRE = 'Fantasy';

--List customers who have placed atleast 2 orders
SELECT
	O.CUSTOMER_ID,
	C.NAME,
	COUNT(O.ORDER_ID) AS ORDERCOUNT
FROM
	ORDERS O
	JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY
	O.CUSTOMER_ID,
	C.NAME
HAVING
	COUNT(O.ORDER_ID) >= 2;

--Find the most frequently ordered book
SELECT
	O.BOOK_ID,
	B.TITLE,
	COUNT(O.ORDER_ID) AS ORDERCOUNT
FROM
	ORDERS O
	JOIN BOOKS B ON O.BOOK_ID = B.BOOK_ID
GROUP BY
	O.BOOK_ID,
	B.TITLE
ORDER BY
	ORDERCOUNT DESC
LIMIT 1;

--Show the top 3 most expensive books of Fantasy
SELECT TITLE,PRICE FROM BOOKS
WHERE
	GENRE = 'Fantasy'
ORDER BY
	PRICE DESC
LIMIT 3;

--Retrieve the total quantity of books sold by each author
SELECT
	*
FROM
	BOOKS;

SELECT
	*
FROM
	ORDERS;

SELECT
	B.AUTHOR,
	SUM(O.QUANTITY) AS TOTALBOOKS_SOLD
FROM
	BOOKS B
	JOIN ORDERS O ON B.BOOK_ID = O.BOOK_ID
GROUP BY
	B.AUTHOR;

--List the cities where customers who spent over $30 are located
SELECT DISTINCT
	C.CITY,
	TOTAL_AMOUNT
FROM
	CUSTOMERS C
	JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE
	TOTAL_AMOUNT >= 30;

--Find the customer who spent the most on orders
SELECT
	C.CUSTOMER_ID,
	C.NAME,
	SUM(O.TOTAL_AMOUNT) AS TOTALAMOUNTSPENT
FROM
	CUSTOMERS C
	JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY
	C.CUSTOMER_ID,
	C.NAME
ORDER BY
	TOTALAMOUNTSPENT DESC
LIMIT
	1;

--Caclulate the stock remainig after fulfilling all orders
SELECT
	B.BOOK_ID,
	B.TITLE,
	B.STOCK,
	COALESCE(SUM(QUANTITY), 0),
	B.STOCK - COALESCE(SUM(O.QUANTITY), 0) AS REMAINING_QUANTITY
FROM
	BOOKS B
	LEFT JOIN ORDERS O ON B.BOOK_ID = O.BOOK_ID
GROUP BY
	B.BOOK_ID
ORDER BY
	B.BOOK_ID;