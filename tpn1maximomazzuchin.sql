CREATE database imdb;
use imdb;
CREATE table film(
	film_id INT PRIMARY KEY AUTO_INCREMENT, 
	title VARCHAR(50), 
	description VARCHAR(50), 
	release_year DATE
);

CREATE table actor(
	actor_id INT PRIMARY KEY AUTO_INCREMENT, 
	first_name VARCHAR(50), 
	last_name VARCHAR(50)
);


CREATE table film_actor(
	actor_id INT,
	film_id INT
);

alter table film_actor add FOREIGN KEY (actor_id) references actor(actor_id);
alter table film_actor add FOREIGN KEY (film_id) references film(film_id);

insert into actor(actor_id,first_name,last_name) values (10,"chris","evans");
insert into actor(actor_id,first_name,last_name) values (11,"Ryan","Reynolds");
insert into actor(actor_id,first_name,last_name) values (12,"Tom","Hanks");

insert into film(film_id ,title , description, release_year) values (10,"Vengaodres","Matan a thanos", '2005/05/05');
insert into film(film_id ,title , description, release_year) values (11,"Los 8 mas odiados","Mueren todos en una cabaña", '1997/09/09');
insert into film(film_id ,title , description, release_year) values (12,"Batman","Enigma persigue a batman", '2016/04/04');

insert into film_actor (actor_id, film_id) values (10,12);
insert into film_actor (actor_id, film_id) values (11,10);
insert into film_actor (actor_id, film_id) values (12,11);

select * FROM  film f;
select * from actor a;
select * from film_actor;

