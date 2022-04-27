USE sakila;



SELECT first_name, last_name FROM actor a WHERE EXISTS 
(SELECT * FROM actor a2 WHERE a.last_name = a2.last_name AND a.actor_id != a2.actor_id)
ORDER BY last_name;



SELECT first_name, last_name FROM actor a WHERE NOT EXISTS
(SELECT * FROM film_actor fa WHERE a.actor_id != fa.actor_id);



SELECT * FROM customer c WHERE 
1=(SELECT COUNT(*)FROM rental r WHERE c.customer_id = r.customer_id);



SELECT *, (SELECT COUNT(*) FROM rental r WHERE c.customer_id = r.customer_id) FROM customer c WHERE 
1<(SELECT COUNT(*) FROM rental r WHERE c.customer_id = r.customer_id);



SELECT first_name, last_name FROM actor a WHERE a.actor_id IN 
(SELECT actor_id FROM film_actor fa WHERE fa.film_id IN 
(SELECT f.film_id FROM film f WHERE f.title LIKE 'BETRAYED REAR' OR f.title LIKE 'CATCH AMISTAD'));



SELECT first_name, last_name
FROM actor a WHERE a.actor_id IN 
(SELECT actor_id FROM film_actor fa WHERE fa.film_id IN 
(SELECT f.film_id FROM film f WHERE f.title LIKE 'BETRAYED REAR' AND f.title NOT LIKE 'CATCH AMISTAD'));



SELECT first_name, last_name FROM actor a WHERE a.actor_id IN 
(SELECT actor_id FROM film_actor fa WHERE fa.film_id IN 
(SELECT f.film_id FROM film f WHERE f.title LIKE 'BETRAYED REAR' AND f.title LIKE 'CATCH AMISTAD'));





SELECT first_name, last_name FROM actor a WHERE a.actor_id IN 
(SELECT actor_id FROM film_actor fa WHERE fa.film_id IN 
(SELECT f.film_id FROM film f WHERE f.title NOT LIKE 'BETRAYED REAR' AND f.title NOT LIKE 'CATCH AMISTAD'));