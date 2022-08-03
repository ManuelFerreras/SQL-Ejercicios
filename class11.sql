USE sakila;

# Ejercicio 1
SELECT *
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
WHERE i.film_id IS NULL;

# Ejercicio 2  
SELECT f.title , i.inventory_id
from film f
join inventory i using(film_id)
left join rental r using(inventory_id)
where  r.inventory_id IS NULL;

# Ejercicio 3 
SELECT CONCAT(c.first_name, ' ',c.last_name) AS 'Nombre', c.store_id, f.title, r.rental_date,r.return_date
from rental r 
inner join customer c using(customer_id)
inner join inventory i ON r.inventory_id = i.inventory_id
inner join film f ON i.film_id = f.film_id
ORDER BY c.store_id,c.last_name;

# Ejercicio 4
SELECT st.store_id, 
	sum(p.amount), 
	concat(s.first_name,' ',s.last_name) as 'NOMBRE', 
	concat(co.country,', ',ci.city) as 'PAIS Y CIUDAD'
FROM store st
	INNER JOIN staff s ON st.manager_staff_id = s.staff_id
	INNER JOIN payment p ON s.staff_id = p.staff_id
	INNER JOIN address a ON st.address_id = a.address_id
	INNER JOIN city ci ON a.city_id = ci.city_id
	INNER JOIN country co ON ci.country_id = co.country_id
GROUP BY st.store_id;
    
# Ejercicio 5
SELECT a.* , count( fa.film_id) AS 'APARICIONES'
FROM actor a
	RIGHT JOIN film_actor fa USING(actor_id)
GROUP BY actor_id
ORDER BY 'APARICIONES' DESC
LIMIT 1;
	

