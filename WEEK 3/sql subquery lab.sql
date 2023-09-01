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

SELECT film_id,title AS family_film
FROM film
where film_id IN (SELECT film_id
FROM film_category
WHERE category_id=(SELECT category_id
FROM category
WHERE name = 'family'));


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
                                    
                                    
                                    
## USING JOINS

SELECT first_name,last_name,email _id 
FROM customer 
JOIN address
USING(address_id)
JOIN city
USING(city_id)
JOIN country
USING (country_id)
WHERE country = 'Canada';

# 6 Determine which films were starred by the most prolific actor in the Sakila database.
SELECT title,actor_id
FROM film
JOIN film_actor
USING (film_id)
WHERE actor_id= (SELECT actor_id
				FROM film_actor
GROUP BY actor_id
ORDER BY COUNT(film_id) DESC
LIMIT 1 );

#7 

SELECT * FROM film
WHERE film_id IN (SELECT film_id 
                  from inventory
                  WHERE inventory









# 8

SELECT customer_id,sum(amount) as total_amount
FROM payment
GROUP BY customer_id
HAVING total_amount >   (SELECT AVG(total_pc)
                         FROM (SELECT SUM(amount) AS total_pc
                               FROM payment
							   GROUP BY customer_id) AS total)
ORDER BY total_amount DESC;


                       





