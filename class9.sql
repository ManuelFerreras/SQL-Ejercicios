# Ejercicio 1
SELECT country.country,count(city.city) as CantidadDeCiudades 
	from country 
    join city on country.country_id = city.country_id 
    group by country.country 
    order by country.country;

# Ejercicio 2
SELECT country.country,count(city.city) as CantidadDeCiudades 
	from country 
    join city on country.country_id = city.country_id 
	group by country.country 
    having count(city.city) >10
    order by country.country;

# Ejercicio 3
SELECT c.first_name as nombre,c.last_name as apellido, a.address as Direccion,
    (SELECT COUNT(*)
        FROM rental r
        WHERE c.customer_id = r.customer_id) as PeliculasRentadas,
    (SELECT SUM(p.amount)
        FROM payment p
        WHERE c.customer_id = p.customer_id) as DineroGastado
FROM customer c
JOIN address a on c.address_id = a.address_id
ORDER BY c.first_name;

# Ejercicio 4
SELECT cat.name , AVG(f.`length`) as PromedioPeliculas 
	FROM film f JOIN film_category fc ON fc.film_id = f.film_id JOIN category cat ON fc.category_id = cat.category_id
group by cat.name
order by AVG(f.`length`) DESC;


# Ejercicio 5
SELECT f.rating, COUNT(p.payment_id) as Ventas
	FROM film f
	JOIN inventory i ON i.film_id = f.film_id
	JOIN rental r ON r.inventory_id = i.inventory_id
	JOIN payment p ON p.rental_id = r.rental_id 
GROUP BY rating;