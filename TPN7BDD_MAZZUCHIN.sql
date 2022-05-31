USE sakila;

SELECT title, rating FROM film f
WHERE `length`=(SELECT MIN(`length`) FROM film f2);


SELECT title FROM film f
WHERE 1=(SELECT COUNT(*) FROM film f2 
WHERE `length`=(SELECT MIN(`length`) FROM film f3));


SELECT ALL c.customer_id,c.first_name,c.last_name,a.address,
	(SELECT MIN(amount)
		FROM payment p
		WHERE c.customer_id = p.customer_id)
	AS lowest_payment
FROM customer c JOIN address a  ON c.address_id = a.address_id;


SELECT ALL c.customer_id,c.first_name,c.last_name,
	(SELECT CONCAT( 
	(SELECT MIN(amount)
		FROM payment p
		WHERE c.customer_id = p.customer_id), " / ",
	(SELECT MAX(amount)
		FROM payment p
		WHERE c.customer_id = p.customer_id)
	))AS lowest_highest_paymemt
FROM customer c;