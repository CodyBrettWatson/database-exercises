USE employees;
SHOW TABLES;
DESCRIBE departments;
SELECT * FROM dept_manager;
SELECT * FROM departments;
SELECT * FROM current_dept_emp;
SELECT * FROM employees;
SELECT * FROM titles;
SELECT * FROM dept_emp;
SELECT * FROM salaries;
SELECT * FROM dept_emp_latest_date;

SELECT  departments.dept_name 'Department Name',
                concat(employees.first_name, ' ' ,employees.last_name) 'Department Manager'
    FROM departments
    JOIN dept_manager 
    ON departments.dept_no = dept_manager.dept_no
    JOIN employees
    ON dept_manager.emp_no = employees.emp_no
    WHERE dept_manager.to_date > now()
    ORDER BY departments.dept_name ASC;
    
SELECT  departments.dept_name 'Department Name',
                concat(employees.first_name, ' ' ,employees.last_name) 'Department Manager'
    FROM departments
    JOIN dept_manager 
		ON departments.dept_no = dept_manager.dept_no
    JOIN employees
		ON dept_manager.emp_no = employees.emp_no
    WHERE dept_manager.to_date > now() AND employees.gender LIKE '%F%'
    ORDER BY departments.dept_name ASC;
    
SELECT 
    titles.title 'Title', COUNT(departments.dept_name)
	FROM titles 
        JOIN employees 
			ON titles.emp_no = employees.emp_no
        JOIN dept_emp
			ON dept_emp.emp_no = employees.emp_no
		JOIN departments 
			ON departments.dept_no = dept_emp.dept_no
	WHERE departments.dept_name = 'Customer Service'
        AND titles.to_date > CURDATE() AND dept_emp.to_date > CURDATE()
	GROUP BY Title;
    
SELECT 
	departments.dept_name 'Department', concat(employees.first_name, ' ' ,employees.last_name), salaries.salary
	FROM salaries
    JOIN dept_manager
		ON salaries.emp_no = dept_manager.emp_no
	JOIN departments
		ON departments.dept_no = dept_manager.dept_no
	JOIN employees
		ON employees.emp_no = salaries.emp_no
	WHERE salaries.to_date > curdate()
		AND dept_manager.to_date > curdate();
        
SELECT 
	departments.dept_no, departments.dept_name, count(dept_emp.emp_no)
	FROM departments
    JOIN dept_emp
		ON departments.dept_no = dept_emp.dept_no
	WHERE dept_emp.to_date > curdate()
    GROUP BY departments.dept_no;
    
SELECT
	departments.dept_name 'dept_name', avg(salaries.salary) 'average_salary'
    FROM departments
    JOIN dept_emp
		ON departments.dept_no = dept_emp.dept_no
	JOIN salaries
		ON dept_emp.emp_no = salaries.emp_no
	WHERE dept_emp.to_date > curdate() AND salaries.to_date > curdate()
    GROUP BY dept_name DESC
    LIMIT 1;
    
SELECT
	employees.first_name, employees.last_name
    FROM employees
    JOIN dept_emp
		ON employees.emp_no = dept_emp.emp_no
	JOIN departments
		ON dept_emp.dept_no = departments.dept_no
	JOIN salaries
		ON employees.emp_no = salaries.emp_no
	WHERE dept_emp.to_date > curdate() 
		AND salaries.to_date > curdate() 
		AND departments.dept_name = 'Marketing'
    ORDER BY salaries.salary DESC
    LIMIT 1;
    
SELECT
	employees.first_name, employees.last_name, salaries.salary, departments.dept_name
    FROM employees
	JOIN salaries
		ON employees.emp_no = salaries.emp_no
	JOIN dept_manager
		ON dept_manager.emp_no = employees.emp_no
	JOIN departments
		ON dept_manager.dept_no = departments.dept_no
	WHERE salaries.to_date > curdate() AND dept_manager.to_date > curdate()
    ORDER BY salaries.salary DESC
    LIMIT 1;
    
    
    
-- #########!BONUS!10!BONUS!############ --
    
    
SELECT
	concat(employees.first_name, employees.last_name), 
    departments.dept_name, 
    (SELECT concat(employees.first_name, employees.last_name)
		FROM employees
        JOIN dept_manager
			ON employees.emp_no = dept_manager.emp_no
		WHERE dept_manager.to_date > curdate())
	FROM employees
    JOIN dept_emp
		ON employees.emp_no = dept_emp.emp_no
	JOIN departments
		ON departments.dept_no = dept_emp.dept_no
	WHERE dept_emp.to_date > curdate();
    
    
    

SELECT concat(employees.first_name, employees.last_name),
(SELECT departments.dept_name,
		(SELECT 
			concat(employees.first_name,' ' ,employees.last_name)
			FROM employees
				JOIN dept_manager
					ON employees.emp_no = dept_manager.emp_no
			WHERE dept_manager.to_date > curdate())
		FROM departments
			JOIN dept_emp
				ON departments.dept_no = dept_emp.dept_no
			JOIN employees
				ON employees.emp_no = dept_emp.emp_no
		WHERE dept_emp.to_date > curdate())
    FROM employees
		JOIN dept_emp
			ON employees.emp_no = dept_emp.emp_no
    WHERE dept_emp.to_date > curdate();






SELECT 
	CONCAT(e.first_name, e.last_name) as 'Employee Name', 
    d.dept_name as 'Department Name', 
    CONCAT(m.first_name, m.last_name) as 'Manager Name'
	FROM employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    JOIN departments d ON de.dept_no = d.dept_no
    JOIN dept_manager dm ON d.dept_no = dm.dept_no
    JOIN employees m ON dm.emp_no = m.emp_no
    WHERE de.to_date > curdate() AND dm.to_date > curdate();
    