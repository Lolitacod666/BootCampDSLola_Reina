
###  DESARROLLO DE EL TALLER 02  POR: LOLA REINA

### 01 Nombre y apellidos de clientes

USE sakila;
SELECT first_name, last_name 
FROM customer; 

### 02 Películas con > duración a 120 mnts

SELECT * FROM film 
WHERE length > 120;

### 03 Ordenar clientes por apellido en orden alfabetico A-Z) 

SELECT * FROM customer 
ORDER BY last_name ASC;

#04 TOP 5 películas más largas (use LIMIT)

SELECT title, length 
FROM film 
ORDER BY length DESC 
limit 5;

#05 Cantidad pagada y fecha del pago con nombre y apellido del cliente

SELECT c.first_name, c.last_name, p.amount, p.payment_date 
FROM payment p 
INNER JOIN customer c ON p.customer_id; 

#06 Películas alquiladas -JOIN entre rental- inventory-film-;

SELECT f.title, 
       r.rental_date 
FROM rental AS r
INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id
INNER JOIN film AS f ON i.film_id = f.film_id;

#07 Nombre y Apellido de clientes sin pago (LEFT JOIN entre Payment - Customer, usando WHERE)

SELECT first_name, last_name
FROM customer c
LEFT JOIN payment p ON c.customer_id = p.customer_id
WHERE p.payment_id IS NULL; 

#08 Listar los nombres de las películas y su duración de aquellos títulos que no tienen actores 

SELECT f.title, f.length
FROM film f 
LEFT JOIN film_actor fa ON f.film_id = fa.film_id
WHERE fa.actor_id IS NULL; 

#09 Insertar actor temporal

INSERT INTO actor (first_name, last_name)
VALUES ('LOLA','REINA'); 
 
 
#10 Actualizar actor

UPDATE actor 
SET first_name = 'JAGODA'
WHERE actor_id = 201;

#11 Eliminar actor

DELETE FROM actor 
WHERE actor_id = 201; 

#12 TOP 5 clientes con mayor cantidad de dinero pagado al servicio de rentas

SELECT c.first_name, c.last_name, SUM(p.amount) AS total_pagado
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY total_pagado DESC
LIMIT 5; 

#13 TOP 5 películas más alquiladas (JOIN entre RENTAL - INVENTORY - FILM) 

 SELECT f.title, COUNT(r.rental_id) AS total_alquileres
 FROM film f
 JOIN inventory i ON f.film_id = i.film_id 
 JOIN rental r ON i.inventory_id = r.inventory_id
 GROUP BY f.film_id
 ORDER BY total_alquileres DESC 
 LIMIT 5;
 
 



