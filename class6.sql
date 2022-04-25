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
FROM customers c
WHERE NOT EXISTS (SELECT * 
    FROM film_actor fa
    WHERE a.actor_id = fa.actor_id);

SELECT c.first_name, c.last_name
FROM customer c
WHERE EXISTS 
      (SELECT 1 FROM payment p 
       WHERE c.customer_id = p.customer_id);

select *
from 
  ( select *, 
           count(1) over (partition by p.customer_id) as occurs
    from payment p
  ) AS c
where occurs = 1 ;



# EJERCICIO 4 Find customers that rented more than one film



# EJERCICIO 5 List the actors that acted in 'BETRAYED REAR' or in 'CATCH AMISTAD'.



# EJERCICIO 6 List the actors that acted in 'BETRAYED REAR' but not in 'CATCH AMISTAD'.



# EJERCICIO 7 List the actors that acted in both 'BETRAYED REAR' and 'CATCH AMISTAD'.



# EJERCICIO 8 List all the actors that didn't work in 'BETRAYED REAR' or 'CATCH AMISTAD'.