USE sakila;

SELECT title,special_features
FROM film 
WHERE rating = 'PG-13'
ORDER BY title
;

SELECT title,length as 'Largo en MINUTOS'
FROM film
ORDER BY length;

SELECT title, rental_rate, replacement_cost
FROM film
WHERE replacement_cost 
BETWEEN 20 AND 24
ORDER BY replacement_cost;

SELECT title,category.name ,rating
FROM film,category
WHERE special_features =  'Behind the Scenes'
ORDER BY title;

SELECT actor.first_name as 'NOMBRE',actor.last_name as 'APELLIDO'
FROM actor,film
WHERE film.title = 'ZOOLANDER FICTION';

SELECT country as 'NOMBRE PAIS', city as 'NOMBRE CIUDAD', address as 'DIRECCION'
FROM store 
JOIN address on store.address_id = address.address_id
JOIN city on address.city_id = city.city_id
JOIN country on city.country_id = country.country_id
WHERE store_id = 1;

SELECT f1.title, f2.title, f1.rating
FROM film f1, film f2
WHERE f1.rating = f2.rating AND f1.film_id <> f2.film_id
ORDER BY f1.title;

SELECT film.title as 'NOMBRE DE LA PELICULA'
FROM store
JOIN inventory on store.store_id = inventory.store_id
JOIN film on inventory.film_id = film.film_id
WHERE store.store_id = 2; 
