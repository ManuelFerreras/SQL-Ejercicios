USE sakila;



# EJERCICIO 1 List all the actors that share the last name. Show them in order.
SELECT a1.actor_id, a1.last_name
FROM actor a1 , actor a2
WHERE a1.last_name = a2.last_name AND a1.actor_id <> a2.actor_id
ORDER BY a1.last_name;



# EJERCICIO 2 Find actors that dont work in any film.
SELECT a.first_name, a.last_name
FROM actor a
WHERE NOT EXISTS (SELECT * 
    FROM film_actor fa
    WHERE a.actor_id = fa.actor_id);



# EJERCICIO 3 Find customers that rented only one film.
SELECT c.first_name, c.last_name
FROM customer c 
WHERE 1 = (SELECT COUNT(*) FROM rental r WHERE c.customer_id = r.customer_id);



# EJERCICIO 4 Find customers that rented more than one film
SELECT c.first_name, c.last_name
FROM customer c 
WHERE 1 < (SELECT COUNT(*) FROM rental r WHERE c.customer_id = r.customer_id);



# EJERCICIO 5 List the actors that acted in 'BETRAYED REAR' or in 'CATCH AMISTAD'.
SELECT a.first_name, a.last_name
FROM actor a
WHERE actor_id IN (SELECT actor_id FROM film_actor fa WHERE fa.film_id IN (SELECT f.film_id FROM film f WHERE f.title LIKE "BETRAYED REAR" OR f.title LIKE "CATCH AMISTAD"));



# EJERCICIO 6 List the actors that acted in 'BETRAYED REAR' but not in 'CATCH AMISTAD'.
SELECT a.first_name, a.last_name
FROM actor a
WHERE actor_id IN (
  SELECT actor_id 
  FROM film_actor fa 
  WHERE fa.film_id IN (
    SELECT f1.film_id 
    FROM film f1 
    WHERE f1.title 
    LIKE 'BETRAYED REAR' 
    AND f1.film_id NOT IN (
      SELECT f2.film_id 
      FROM film f2 
      WHERE f2.title 
      LIKE 'CATCH AMISTAD')));




# EJERCICIO 7 List the actors that acted in both 'BETRAYED REAR' and 'CATCH AMISTAD'.
SELECT a.first_name, a.last_name
FROM actor a
WHERE actor_id IN (
  SELECT actor_id 
  FROM film_actor fa 
  WHERE fa.film_id IN (
    SELECT f1.film_id 
    FROM film f1 
    WHERE f1.title 
    LIKE 'BETRAYED REAR' 
    AND f1.film_id IN (
      SELECT f2.film_id 
      FROM film f2 
      WHERE f2.title 
      LIKE 'CATCH AMISTAD')));



# EJERCICIO 8 List all the actors that didnt work in 'BETRAYED REAR' or 'CATCH AMISTAD'.
SELECT a.first_name, a.last_name
FROM actor a
WHERE actor_id NOT IN (
  SELECT actor_id 
  FROM film_actor fa 
  WHERE fa.film_id IN (
    SELECT f1.film_id 
    FROM film f1 
    WHERE f1.title 
    LIKE 'BETRAYED REAR' 
    OR f1.film_id IN (
      SELECT f2.film_id 
      FROM film f2 
      WHERE f2.title 
      LIKE 'CATCH AMISTAD')));