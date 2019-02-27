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










