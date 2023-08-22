USE sakila ;
SHOW TABLES;

SELECT * FROM  sakila.actor;
SELECT * FROM  sakila.film;
SELECT * FROM  sakila.customer;

SELECT title 
FROM sakila.film ;

  # SELECT * FROM SAKILA.LANGUAGE
 
 SELECT name AS LANGUAGE
 FROM SAKILA.LANGUAGE ;
 
 
#  SELECT  * FROM SAKILA.STAFF
 SELECT first_name 
 FROM sakila.staff ;
 
 SELECT DISTINCT (release_year)
 FROM FILM ;
 
  # SELECT * FROM  STORE
  
  SELECT COUNT(store_id) AS NO_OF_STORE
  FROM store ;
  
  SELECT COUNT(manager_staff_id) AS NO_OF_EMPLOYEES
  FROM store ;
  
  
  SELECT DISTINCT (last_name )
  FROM ACTOR ;
  
  
 # SELECT *  FROM FILM
 SELECT title 
 FROM FILM
 limit 10;
 
 SELECT first_name,actor_id
 FROM ACTOR 
 WHERE first_name= "SCARLETT";
 

 SELECT  * FROM FILM
 WHERE title LIKE '%ARMAGEDDON%' AND  
length> 100;

SELECT COUNT(film_id) 
FROM film
WHERE special_features LIKE '%Behind the Scenes%';

#SELECT * FROM FILM;
