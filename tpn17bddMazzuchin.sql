USE sakila;
/*1------------------------------------------------------------------------------------*/
SELECT * FROM address a
WHERE postal_code BETWEEN 1000 and 50000; /*72ms sin index, 12ms con index*/


SELECT *
FROM address a 
	INNER JOIN city c USING(city_id)
	INNER JOIN country c2 USING(country_id)
WHERE postal_code like '%13%'; /*12ms sin index, 10ms con index*/


CREATE INDEX postalCode ON address(postal_code);
show index from address;

DROP INDEX postalCode ON address;

/*2------------------------------------------------------------------------------------*/
SHOW INDEX FROM actor; /*actor tiene idx_actor_last_name, un index por lo que puede hacer la queries de manera mas rapida*/

SELECT a.first_name  FROM actor a
ORDER BY a.first_name DESC;/*15ms */

SELECT a2.last_name FROM actor a2
ORDER BY a2.last_name DESC;/*21ms */


/*3------------------------------------------------------------------------------------*/
SELECT f.description FROM film f
WHERE f.description LIKE '%Documentary%';/*15ms*/

show index from film;
CREATE FULLTEXT INDEX desc_index ON film(description);

SELECT f.description FROM film f 
WHERE MATCH(f.description) AGAINST('%Documentary%');/*8ms*/
/*Se usa el index = mas rapido*/



