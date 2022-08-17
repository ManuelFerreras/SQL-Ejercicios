USE sakila;

CREATE INDEX addressIndex ON address(postal_code);

SELECT *									
FROM address								
WHERE postal_code between 5000 and 70000
AND district LIKE 'California';

SELECT a.address as 'Direccion', 			
	a.postal_code as 'Codigo Postal', 		
    a.district as 'Distrito',
	a.phone as 'Telefono', 	
	ci.city as 'Ciudad', 
	co.country as 'Pais'
FROM address a
	INNER JOIN city ci USING(city_id)
	INNER JOIN country co USING(country_id)
WHERE a.postal_code IN(
	SELECT postal_code
    FROM address
    WHERE district LIKE '%c'
    AND postal_code IN(
		SELECT postal_code
        FROM address
        WHERE postal_code BETWEEN 10000 and 70000
		)
	)
ORDER BY a.postal_code ASC;

DROP INDEX addressIndex ON address;

SELECT first_name
FROM actor;

SELECT last_name
FROM actor;

SHOW INDEX FROM actor;

SELECT description						
FROM film
WHERE description like '%Action%';

CREATE FULLTEXT INDEX film_description_index		
ON film(description);

SELECT description									
FROM film
WHERE MATCH(description) AGAINST('%Action%' IN NATURAL LANGUAGE MODE);