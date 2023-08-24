USE sakila;

# 1.Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
SELECT COUNT(film_id) AS number_of_copies
FROM inventory 
WHERE film_id IN ( SELECT film_id
				  FROM film
                  WHERE  title = "Hunchback Impossible");


#2 List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT title
FROM film
WHERE length > ( SELECT avg(length) 
				 FROM film);
                 
#3 Use a subquery to display all actors who appear in the film "Alone Trip".
SELECT first_name,last_name
FROM actor
WHERE actor_id IN ( SELECT actor_id 
                   FROM film_actor
				   WHERE film_id = ( SELECT film_id
                                     FROM film
                                     WHERE title = "Alone Trip"));
                                     
# 4 Sales have been lagging among young families, and you want to target family movies for a promotion. 
# Identify all movies categorized as family films.
SELECT TITLE
FROM film
JOIN category
USING(category_id)
JOIN film_category
USING (film_id)
WHERE name = 'family';
select title
from film
where film_id = (select film_id
from film_category
where category_id = (select category_id
from category
where name= 'family'));


#5 Retrieve the name and email of customers from Canada using both subqueries and joins.
 #To use joins, you will need to identify the relevant tables and their primary and foreign keys.
SELECT first_name,last_name,email _id 
FROM customer 
WHERE address_id IN (SELECT address_id 
FROM address
WHERE city_id in (SELECT city_id
				 FROM city
				 WHERE country_id =(SELECT country_id
									FROM COUNTRY
									WHERE country = 'Canada')));
                                    
# USING JOINS

SELECT first_name,last_name,email _id 
FROM customer 
JOIN address
USING(address_id)
JOIN city
USING(city_id)
JOIN country
USING (country_id)
WHERE country = 'Canada';

# 6 




