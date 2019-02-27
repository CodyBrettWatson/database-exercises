USE employees;
SHOW TABLES;
DESCRIBE titles;
SELECT * FROM titles;

SELECT DISTINCT title
	FROM titles;
    
SELECT DISTINCT last_name FROM employees 
	WHERE (last_name LIKE 'E%') AND (last_name LIKE '%e')
    GROUP BY last_name;

SELECT DISTINCT last_name, first_name FROM employees 
	WHERE (last_name LIKE 'E%') AND (last_name LIKE '%e')
    GROUP BY last_name, first_name;
    
SELECT DISTINCT last_name FROM employees 
	WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';
    
SELECT DISTINCT last_name, count(last_name) 
	FROM employees 
	WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
    GROUP BY  last_name;
    
SELECT count(gender), gender FROM employees 
	WHERE first_name 
    IN ('Irena', 'Vidya', 'Maya') 
    GROUP BY gender;
    
SELECT lower(concat(
	left(first_name, 1), 
    left(last_name, 4), 
    "_", 
    substr(birth_date, 6, 2), 
    substr(birth_date,3,2))) as username,
	count(*)
    FROM employees
    GROUP BY username
    HAVING count(*) >1;
    
SELECT count(*) FROM (SELECT lower(concat(
	left(first_name, 1), 
    left(last_name, 4), 
    "_", 
    substr(birth_date, 6, 2), 
    substr(birth_date,3,2))) as username,
	count(*)
    FROM employees
    GROUP BY username
    HAVING count(*) >1) as Duplicate_Count;
    
SELECT sum(count) FROM (SELECT lower(concat(
	left(first_name, 1), 
    left(last_name, 4), 
    "_", 
    substr(birth_date, 6, 2), 
    substr(birth_date,3,2))) as username,
	count(*) as count
    FROM employees
    GROUP BY username
    HAVING count(*) >1) as Duplicate_Count;
    
    
-- Which (across all employees) name is the most common, the least common? Find this for both first name, last name, and the combination of the two.
    
SELECT last_name as MostLast, count(last_name) as Occurence_M
	FROM employees
    GROUP BY last_name
    ORDER BY Occurence_M DESC
    LIMIT 1;
    
SELECT last_name as LeastLast, count(last_name) as Occurence_L
	FROM employees
    GROUP BY last_name
    ORDER BY Occurence_L ASC
    LIMIT 1;
    
SELECT first_name as MostFirst, count(first_name) as Occurence_M
	FROM employees
    GROUP BY first_name
    ORDER BY Occurence_M DESC
    LIMIT 1;
    
SELECT first_name as LeastFrist, count(first_name) as Occurence_L
	FROM employees
    GROUP BY first_name
    ORDER BY Occurence_L ASC
    LIMIT 1;
    
SELECT first_name, last_name, COUNT(*)
	FROM employees
    GROUP BY first_name, last_name
    ORDER BY COUNT(*) DESC;









