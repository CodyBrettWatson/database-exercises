USE employees;
SHOW TABLES;
SELECT * FROM employees;
SELECT * FROM salaries;



SELECT concat(first_name, ' ', last_name) AS full_name 
	FROM employees 
	WHERE last_name 
    LIKE 'E%' 
    ORDER BY emp_no DESC;

SELECT upper(concat(first_name, ' ', last_name)) AS full_name 
	FROM employees 
	WHERE last_name 
    LIKE 'E%' 
    ORDER BY emp_no DESC;
    
SELECT datediff(curdate(), hire_date) FROM employees 
	WHERE (hire_date LIKE '199%') AND (birth_date LIKE '%-12-25') 
    ORDER BY birth_date ASC, hire_date DESC;
    
SELECT min(salary) FROM salaries;
SELECT max(salary) FROM salaries;

SELECT * FROM employees;


SELECT lower(concat(
	left(first_name, 1), 
    left(last_name, 4), 
    "_", 
    substr(birth_date, 6, 2), 
    substr(birth_date,3,2))) as username,
    first_name, last_name, birth_date
    FROM employees;