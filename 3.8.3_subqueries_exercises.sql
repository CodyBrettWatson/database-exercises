-- 1. Find all the employees with the same hire date as employee 101010 using a sub-query. 69 Rows.

SELECT emp_no, hire_date
	FROM employees
    WHERE hire_date =
			(SELECT hire_date 
				FROM employees 
                WHERE emp_no = '101010');
                
-- Find all the titles held by all employees with the first name Aamod. 314 total titles, 6 unique titles.

SELECT titles.title 
	FROM titles 
    JOIN employees 
		ON titles.emp_no = employees.emp_no
        WHERE employees.first_name IN
			(SELECT employees.first_name 
				FROM employees 
                WHERE employees.first_name = 'Aamod');
                
SELECT DISTINCT titles.title 
	FROM titles 
    JOIN employees 
		ON titles.emp_no = employees.emp_no
        WHERE employees.first_name IN
			(SELECT employees.first_name 
				FROM employees 
                WHERE employees.first_name = 'Aamod');
                
-- 3. How many people in the employees table are no longer working for the company?

SELECT count(*) FROM dept_emp WHERE to_date NOT IN
(SELECT dept_emp.emp_no, dept_emp.to_date
	FROM dept_emp
    WHERE to_date > current_date());
    
    
SELECT COUNT(*) FROM employees WHERE emp_no NOT IN
	(SELECT emp_no FROM dept_emp WHERE to_date > curdate());
    
    
    
-- 4. Find all the current department managers that are female.
    
    
SELECT  departments.dept_name 'Department Name',
                concat(employees.first_name, ' ' ,employees.last_name) 'Department Manager'
    FROM departments
    JOIN dept_manager 
		ON departments.dept_no = dept_manager.dept_no
    JOIN employees
		ON dept_manager.emp_no = employees.emp_no
    WHERE employees.gender IN
		(SELECT employees.gender FROM employees WHERE dept_manager.to_date > now() AND employees.gender LIKE '%F%');
        
SELECT first_name, last_name
	FROM employees
    WHERE gender = 'F'
		AND emp_no IN (
			SELECT emp_no FROM dept_manager WHERE to_date > curdate()
		);
        
-- 5. Find all the employees that currently have a higher than average salary. 154543 rows in total. Here is what the first 5 rows will look like:

SELECT CONCAT(e.first_name, e.last_name), s.salary
	FROM employees e
    JOIN salaries s
		ON e.emp_no = s.emp_no
	WHERE s.to_date > current_date() AND s.salary >
    (SELECT avg(salary) FROM salaries);


-- How many current salaries are within 1 standard deviation of the highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this? 78 salaries

USE employees;

SELECT ((
SELECT count(*) FROM salaries WHERE salary IN (
SELECT salary FROM salaries WHERE to_date > curdate() AND salary >
	(SELECT  max(salary)- stddev(salary)FROM salaries)))/ count(salary))*1000
    FROM salaries;

-- Find all the department names that currently have female managers.


-- Find all the department names that currently have female managers.

SELECT dept_name
FROM departments
WHERE dept_no IN (
	SELECT dept_no
    FROM dept_manager
    WHERE emp_no IN (
		SELECT emp_no
        FROM employees
        WHERE gender = 'F'
	) AND to_date > NOW()
);	


-- Find the first and last name of the employee with the highest salary.


SELECT first_name, last_name
FROM employees 
WHERE emp_no = (
	SELECT emp_no FROM salaries ORDER BY salary DESC
	LIMIT 1
);

-- Find the department name that the employee with the highest salary works in.






