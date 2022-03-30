use sakila;
SELECT title, special_features from film f  where rating like 'PG-13';


SELECT title, `length` from film f order by `length`;


SELECT f.title, f.rating, c.name  from film f join film_category fc on f.film_id = fc.film_id 
JOIN category c on fc.category_id = c.category_id WHERE f.special_features LIKE 'Behind the Scenes';


SELECT f.title, a.first_name, a.last_name from actor a join film_actor fa ON a.actor_id = fa.actor_id 
join film f on fa.film_id = f.film_id WHERE title LIKE '%ZOOLANDER FICTION%';


SELECT s.store_id, a.address, c.city, co.country from store s join address a ON s.address_id = a.address_id 
join city c on a.city_id = c.city_id 
join country co on c.country_id = co.country_id where s.store_id = 1;


SELECT f1.title, f2.title, f1.rating join film f1, film f2 where f1.rating = f2.rating;


SELECT s.store_id, f.title, i.inventory_id, st.first_name, st.last_name from film f join inventory i ON f.film_id = i.film_id 
join store s on i.store_id = s.store_id 
join staff st ON s.store_id = st.store_id where s.store_id = 2; 



