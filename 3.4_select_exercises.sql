USE albums_db;

SHOW TABLES;

DESCRIBE albums;

SELECT * FROM albums WHERE artist = 'Pink Floyd';

SELECT release_date FROM albums WHERE name = 'Sgt. Pepper\'s Lonely Hearts Club Band' ;

SELECT genre FROM albums WHERE name = 'Nevermind' ;

SELECT name FROM albums WHERE release_date  BETWEEN 1990 and 1999;

SELECT name FROM albums WHERE  sales > 20;

SELECT name FROM albums WHERE genre = 'Rock' ;

-- because you would need to do (SELECT name FROM albums WHERE genre LIKE '%Rock%';) for that.

USE mysql;

SHOW TABLES;

DESCRIBE help_topic;

SELECT * FROM help_topic;

SELECT * FROM help_topic WHERE name LIKE '%SOMETHING%';

USE employees;

SHOW TABLES;

DESCRIBE salaries;

SELECT * FROM salaries;
-- it lists the employees salaries over time. The salary is an integer and not a dollar amount which would make it a string.

USE sakila;

SHOW TABLES;

DESCRIBE sales_by_store;

SELECT * FROM sales_by_store;

DESCRIBE payment;

SELECT * FROM payment;

-- the sakila database looks like a database for two movie rental stores

SELECT * FROM actor;

SELECT last_name FROM actor;

SELECT * FROM film;

SELECT title, description, rating, length FROM film where length > 180;


-- select the payment id, amount, and payment date columns from the payments
-- table for payments made on or after 05/27/2005.

SELECT payment_id, amount, payment_date FROM payment WHERE payment_date >= '2005-05-27';

-- Select the primary key, amount, and payment date columns from the payment
-- table for payments made on 05/27/2005.

SELECT payment_id, amount, payment_date FROM payment WHERE payment_date BETWEEN '2005-05-27' AND '2005-05-28';