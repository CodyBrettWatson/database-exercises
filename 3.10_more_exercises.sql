USE world;
SHOW TABLES;
SELECT * FROM countrylanguage;
SELECT * FROM city;
SELECT * FROM country;


DESCRIBE city;
SELECT countrycode FROM city WHERE name = 'santa monica';

SELECT city.Name, countrylanguage.Language
	FROM city
    INNER JOIN countrylanguage
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
--     INNER JOIN country
--     ON city.countrycode = country.code
--     WHERE city.name LIKE '%x%';
    
SELECT city.name as city, country.region as region
	FROM city
    INNER JOIN country
    ON city.countrycode = country.code
    WHERE city.name LIKE '%x%';
    
SELECT city.name as city, country.name as country
	FROM city
    INNER JOIN country
    ON city.countrycode = country.code
    WHERE city.name LIKE '%x%';
    
SELECT city.name as city, country.name as state, country.lifeexpectancy as life_expectancy
	FROM city
    INNER JOIN country
    ON city.countrycode = country.code
    WHERE city.name LIKE '%santa%';