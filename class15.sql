USE sakila;

#Ejercicio 1
CREATE OR REPLACE VIEW list_of_costumers AS
	SELECT c.customer_id, CONCAT(c.first_name,'',c.last_name) as 'Full Name', a.phone as 'Telefono', a.address as 'Direccion 1', a.address2 as 'Direccion 2', a.postal_code as 'ZIP CODE', ci.city as 'Ciudad', co.country as 'Pais', c.active as 'Activo', c.store_id as 'N° Tienda'
	FROM customer c JOIN address a on c.address_id = a.address_id JOIN city ci on a.city_id = ci.city_id JOIN country co on ci.country_id = co.country_id;
    
#Ejercicio 2    
CREATE  
OR REPLACE VIEW
film_details AS
	SELECT f.film_id, f.title, f.description, c.name, f.length, f.rating, f.replacement_cost, group_concat( concat(a.first_name,' ',a.last_name)) AS 'Actores'
	FROM film f  INNER JOIN filcm_category USING(film_id) INNER JOIN category c USING(category_id) INNER JOIN film_actor USING(film_id) INNER JOIN actor a USING(actor_id) GROUP BY f.film_id, c.name;
    
#Ejercicio 3
CREATE OR REPLACE VIEW sales_by_film_category AS
	SELECT c.name as 'Categoria', count(r.rental_id) as 'Rentas Totales' FROM film JOIN film_category USING (film_id) JOIN category c USING (category_id) JOIN inventory USING (film_id) JOIN rental r USING (inventory_id) group by c.name;
    
#Ejercicio 4
CREATE OR REPLACE VIEW actor_information AS
	SELECT a.actor_id, a.first_name as 'Nombre', a.last_name as 'Apellido', count(film_id) as 'Peliculas que Participo'
	FROM actor a JOIN film_actor USING (actor_id) JOIN film USING (film_id) GROUP BY a.actor_id ORDER BY a.actor_id;
    
#Ejercicio 5
SELECT VIEW_DEFINITION
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_NAME = 'actor_info';
    
   
select											
    `a`.`actor_id` AS `actor_id`,
    `a`.`first_name` AS `first_name`,
    `a`.`last_name` AS `last_name`,
    group_concat(								
        distinct concat(						
            `c`.`name`,							
            ': ', (								
                select							
                    group_concat(
                        `f`.`title`
                        order by
                            `f`.`title` ASC separator ', '
                    )
                from ( (
                            `sakila`.`film` `f`
                            join `sakila`.`film_category` `fc` on( (`f`.`film_id` = `fc`.`film_id`)
                            )
                        )
                        join `sakila`.`film_actor` `fa` on( (`f`.`film_id` = `fa`.`film_id`)
                        )
                    )
                where ( (
                            `fc`.`category_id` = `c`.`category_id`
                        )
                        and (
                            `fa`.`actor_id` = `a`.`actor_id`
                        )
                    )
            )
        )
        order by
            `c`.`name` ASC separator '; '
    ) AS `film_info`
from ( ( (														
                `sakila`.`actor` `a`							
                left join `sakila`.`film_actor` `fa` on( (		
                        `a`.`actor_id` = `fa`.`actor_id`
                    )
                )
            )
            left join `sakila`.`film_category` `fc` on( (
                    `fa`.`film_id` = `fc`.`film_id`
                )
            )
        )
        left join `sakila`.`category` `c` on( (
                `fc`.`category_id` = `c`.`category_id`
            )
        )
    )
group by
    `a`.`actor_id`,
    `a`.`first_name`,
    `a`.`last_name`;

