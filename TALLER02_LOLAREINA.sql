
'''En este taller encontraremos la elaboración de taller #02 SQL, detallando cada  código usado, donde estaremos 
       utilizando comandos para consulta, filtro, organizar, insertar, actualizar y eliminar.'''


###  DESARROLLO DE EL TALLER 02  POR: LOLA REINA

### 01 Nombre y apellidos de clientes
'Con el comando (USE) selecionaremos el archivo que deseamos, es como dar doble click sobre la carpeta que usaremos.'
'SELECT básicamente es el comando de colsulta, quien usa FROM para selecionar el (de) para especidicar las columnas o datosque necesitaremos consultar'
'En este caso estamos seleccionando la base de datos SAKILA , consultando el nombre y apellido de todos los clientes'
USE sakila;
SELECT first_name, last_name 
FROM customer; 

### 02 Películas con > duración a 120 mnts
' Aquí hablaremos de un filtro importante, WHERE, el cual nos ayuda a consultar un registro que cumplan con cierta condición.'
'length por otro lado se usa para contar la longitud de los caracteres.'
' En esta consulta vemos las películas que tienen mayor duración a 120 minutos.'
SELECT * FROM film 
WHERE length > 120;

### 03 Ordenar clientes por apellido en orden alfabetico A-Z) 
'ORDER BY, nos sirve para organizar los datos, bien sea de forma descendiente o ascendiente, en éste caso lo usaremos
       para un orden alfabético A-Z por apellido de manera ASCendentemente.'
SELECT * FROM customer 
ORDER BY last_name ASC;

#04 TOP 5 películas más largas (use LIMIT)
'LIMIT, este comando lo usamos para limitar la búsqueda en la cantidad de datos que deseemos, aquí vemos las 5 películas más largas.'
SELECT title, length 
FROM film 
ORDER BY length DESC 
limit 5;

#05 Cantidad pagada y fecha del pago con nombre y apellido del cliente
'Aquí vemos el comando INNER JOIN, este lo usamos para relacionar datos dispersos, como en este caso, (clientes y pagos), para ello
       usamos un conector lógico, el cual vemos que es -ON-, se usa específicamente dentro de un JOIN.'
       
SELECT c.first_name, c.last_name, p.amount, p.payment_date 
FROM payment p 
INNER JOIN customer c ON p.customer_id; 

#06 Películas alquiladas -JOIN entre rental- inventory-film-;
'Aquí usamos un JOIN entre tres tablas, también un AS, el cual sirve para crear un alias o
       nombre temporal para la ejecución de una consulta.'
       
SELECT f.title, 
       r.rental_date 
FROM rental AS r
INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id
INNER JOIN film AS f ON i.film_id = f.film_id;

#07 Nombre y Apellido de clientes sin pago (LEFT JOIN entre Payment - Customer, usando WHERE)
'Ahora  vemos un LEFT JOIN, Nos sirve para COMBINAR filas de tablas diferentes pero siempre obtener
       la información de la tabla principal (izq).'
SELECT first_name, last_name
FROM customer c
LEFT JOIN payment p ON c.customer_id = p.customer_id
WHERE p.payment_id IS NULL; 

#08 Listar los nombres de las películas y su duración de aquellos títulos que no tienen actores 
'En este comando vemos IS NULL, al final, con un WHERE previo, el cual nos ayuda a especificar la tabla priemro y el NULL nos índica la ausencia 
       de un valor especídico.' 
SELECT f.title, f.length
FROM film f 
LEFT JOIN film_actor fa ON f.film_id = fa.film_id
WHERE fa.actor_id IS NULL; 

#09 Insertar actor temporal
'INSERT, como su nombre lo dice, lo usamos para insertar un nuevo registro, en este caso un nuevo actor,
       teniendo en cuenta siempre nombrar los respectivos valores de la tabla(VALUES).'
INSERT INTO actor (first_name, last_name)
VALUES ('LOLA','REINA'); 
 
 
#10 Actualizar actor
'UPDATE, con este comando estaremos actualizando la inserción que se hizo previamente, cambiamos el primer nombre
       manteniendo el apellido, específicando la ubicación exacta con WHERE.'
UPDATE actor 
SET first_name = 'JAGODA'
WHERE actor_id = 201;

#11 Eliminar actor
'DELETE, nos ayuda a eliminar lo que deseemos, aquí realizamos la eliminación de la inserción previa, de nuevo
       con la ubicación exacta para evitar errores en la base de datos.'
DELETE FROM actor 
WHERE actor_id = 201; 

#12 TOP 5 clientes con mayor cantidad de dinero pagado al servicio de rentas
'Para realizar este punto, fue más elaborado que sólo usar dos o tres comandos.'
      '1.Realicé la consulta con SELECT y SUM para calcular el total de la columna amount, que está dentro de la tabla payment
       que fue apodad con una (p), seguido de un FROM customer, (tabla de clientes).
       2.Realicé un JOIN, para la unión  de la tabla de clientes con la pagos, para hallar la coincidencia o conexión
       entre ambas tablas, el pago que le corresponde a cada cliente.
       3.Usé el GROUP BY para agrupar datos por cliente y no de toda la tabla.
       4.ORDER BY, para ordenar de forma DESCendente los que más pagaron al principio de dicha lista.
       5.Finalicé con un LIMIT para mostrar solo los 5 primeros registros.'
       
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_pagado
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY total_pagado DESC
LIMIT 5; 

#13 TOP 5 películas más alquiladas (JOIN entre RENTAL - INVENTORY - FILM) 
 '1.Comenzamos  con la selección de el título de la película y la cantidad de veces que sale 
    en la tabla de alquiler(COUNT r.rental_id) y le puse el alias de total_aquileres.
  2.Conexión con el JOIN, de películas existentes en el inventario.
  3.Un nuevo Join pero ets vez conecto el inventario de registros de alquileres.
  4.Agrupé los resultados por película, para que el count sume los alquileres individualmente.
  5.ORDER BY (DESC) para ordena la lista de mayor a menor cantidad de alquileres
  6.Finalicé usando LIMIT Ppara que me mostrara solo los 5 primeros reslutados.'     
 SELECT f.title, COUNT(r.rental_id) AS total_alquileres
 FROM film f
 JOIN inventory i ON f.film_id = i.film_id 
 JOIN rental r ON i.inventory_id = r.inventory_id
 GROUP BY f.film_id
 ORDER BY total_alquileres DESC 
 LIMIT 5;
 
 



