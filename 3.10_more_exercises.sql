USE world;
SHOW TABLES;
SELECT * FROM countrylanguage;
SELECT * FROM city;
SELECT * FROM country;


DESCRIBE city;
SELECT countrycode FROM city WHERE name = 'santa monica';

SELECT city.Name, countrylanguage.Language
	FROM city
    JOIN countrylanguage
    ON city.countrycode = countrylanguage.countrycode
    WHERE name = 'Santa Monica';


SELECT count(name), region
	FROM country 
	GROUP BY region;

SELECT sum(population), region
	FROM country 
	GROUP BY region;
    
SELECT sum(population), continent
	FROM country 
	GROUP BY continent;
    
SELECT avg(lifeexpectancy)
	FROM country;

SELECT avg(lifeexpectancy), continent
	FROM country
    GROUP BY continent;

SELECT avg(lifeexpectancy), region
	FROM country
    GROUP BY region;
    
SELECT localname, name
	FROM country
    WHERE localname != name;
    
SELECT count(name)
	FROM country
    WHERE lifeexpectancy < x();
    
-- SELECT city.name as city, country.name as state
-- 		FROM city
--     JOIN country
--     ON city.countrycode = country.code
--     WHERE city.name LIKE '%x%';
    
SELECT city.name as city, country.region as region
	FROM city
    JOIN country
    ON city.countrycode = country.code
    WHERE city.name LIKE '%x%';
    
SELECT city.name as city, country.name as country
	FROM city
    JOIN country
    ON city.countrycode = country.code
    WHERE city.name LIKE '%x%';
    
SELECT city.name as city, country.name as state, country.lifeexpectancy as life_expectancy
	FROM city
    JOIN country
    ON city.countrycode = country.code
    WHERE city.name LIKE '%santa%';
    
USE sakila;
SHOW TABLES;
SELECT * FROM actor;


SELECT lower(first_name), lower(last_name) 
	FROM actor;

SELECT actor_id, first_name, last_name
	FROM actor
    WHERE first_name LIKE '%joe%';
    
SELECT last_name, first_name
	FROM actor
    WHERE last_name LIKE '%gen%';
    
SELECT last_name, first_name
	FROM actor
    WHERE last_name LIKE '%li%'
    ORDER BY last_name, first_name;
    
USE world;
SHOW TABLES;
DESCRIBE country;
SELECT code FROM country;

SELECT code, name 
	FROM country
    WHERE code IN ('AFG', 'BGD', 'CHN');
    
USE sakila;
SELECT count(last_name), last_name
	FROM actor
    GROUP BY last_name;
    
SELECT count(last_name), last_name
	FROM actor
    GROUP BY last_name
    HAVING count(*)>1;
    

SELECT name
FROM sys.databases
WHERE CASE
WHEN state_desc = 'ONLINE' THEN OBJECT_ID( QUOTENAME( name ) + '.[dbo].[address]','U' )
END IS NOT NULL;