-- Using the example from the lesson, re-create the employees_with_departments table.
-- 		Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
-- 		Update the table so that full name column contains the correct data
-- 		Remove the first_name and last_name columns from the table.
-- 		What is another way you could have ended up with this same table?

USE ada_675;

CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

SELECT * FROM employees_with_departments;

ALTER TABLE employees_with_departments ADD full_name 
	VARCHAR(30);
    
UPDATE employees_with_departments SET full_name = concat(first_name,' ', last_name);
    

DESCRIBE employees_with_departments;

ALTER TABLE employees_with_departments
	DROP first_name, DROP last_name;


-- Create a temporary table based on the payments table from the sakila database.
-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing 
-- the number of cents of the payment. For example, 1.99 should become 199.

USE sakila;
SHOW TABLES;
DESCRIBE payment;

USE ada_675;

CREATE TEMPORARY TABLE sakila_DB_payments AS
SELECT amount
FROM sakila.payment
LIMIT 100;	

SELECT * FROM sakila_DB_payments;
DESCRIBE sakila_DB_payments;

ALTER TABLE sakila_DB_payments ADD int_payment INT(7);

UPDATE sakila_DB_payments 
	SET int_payment = amount * 100;
    SELECT * FROM sakila_DB_payments;

ALTER TABLE sakila_DB_payments DROP amount;


-- Find out how the average pay in each department compares to the overall average pay. In order to make 
-- the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best 
-- department to work for? The worst?

USE employees;
SHOW TABLES;
DESCRIBE departments;
SELECT * FROM departments;
SELECT * FROM salaries;
SELECT * FROM dept_emp;

USE ada_675;

CREATE TEMPORARY TABLE z_score AS
	SELECT s.emp_no, s.salary, de.dept_no, d.dept_name
    FROM employees.salaries s
    JOIN employees.dept_emp de
    ON s.emp_no = de.emp_no
    JOIN employees.departments d
    ON d.dept_no = de.dept_no
    WHERE s.to_date > now();

SELECT * FROM z_score;

ALTER TABLE z_score ADD mean decimal(7,5);
ALTER TABLE z_score ADD stan decimal(7,5);
ALTER TABLE z_score DROP mean;
ALTER TABLE z_score ADD mean decimal (7,2);
ALTER TABLE z_score DROP stan;
ALTER TABLE z_score ADD stan decimal (14,4);
ALTER TABLE z_score DROP mean;
ALTER TABLE z_score ADD mean decimal (14,4);
ALTER TABLE z_score ADD z decimal (14,4);

UPDATE z_score SET mean = (SELECT avg(salary) FROM employees.salaries);
UPDATE z_score SET stan = (SELECT stddev(salary) FROM employees.salaries);
UPDATE z_score SET z = (salary - mean)/stan;

SELECT avg(z), dept_name
FROM z_score
GROUP BY dept_name;
    
SELECT avg(z) FROM z_score;


CREATE TEMPORARY TABLE d_avg_z AS
	SELECT z.dept_name, z.z
    FROM z_score z;
    
SELECT * FROM d_avg_z;

	SELECT AVG(z) 
	FROM d_avg_z 
    GROUP BY dept_name;







