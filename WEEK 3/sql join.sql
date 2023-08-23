USE sakila ;

#1
SELECT name,count(category_id)
FROM film_category
inner join category
USING (category_id)
GROUP BY name ;

#2
SELECT store_id,city,country
FROM store
INNER JOIN address
USING (address_id)
INNER JOIN city
USING(city_id)
INNER JOIN country
USING (country_id)
GROUP BY store_id ;

#3 TO FIND THE TOTAL REVENUE

SELECT store_id,SUM(amount) AS TOTAL_REVENUE
FROM staff
INNER JOIN store
USING(store_id)
INNER JOIN payment
USING(staff_id)
GROUP BY store_id
ORDER BY TOTAL_REVENUE  ;

#4 AVG RUNNING TIME FOR EACH CATEGORY

SELECT name, category_id,avg(length) as average_running_time
FROM film_category
INNER JOIN film
USING (film_id)
INNER JOIN category 
USING(category_id) 
GROUP BY category_id
ORDER BY NAME ;

#5 FILM CATEGORY WITH LONGEST RUNNING TIME

SELECT category_id,(avg(length)) as longest_average_running_time
FROM film_category
INNER JOIN film
USING (film_id)
INNER JOIN category 
USING(category_id) 
GROUP BY category_id
ORDER BY longest_average_running_time DESC ;

#6 Display the top 10 most frequently rented movies in descending order.

SELECT title AS frequently_rented_movies ,
COUNT(*) AS Number_of_films
FROM film
JOIN inventory
USING(film_id)
JOIN rental
USING(INVENTORY_ID)
GROUP BY title
ORDER BY number_of_films DESC 
LIMIT 10 ;


#7 Determine if "Academy Dinosaur" can be rented from Store 1.

SELECT title,store_id
FROM film
JOIN inventory
USING (film_id)
JOIN store
USING (store_id)
WHERE title = "Academy Dinosaur" AND store_id = 1 ;

#8 Provide a list of all distinct film titles, along with their availability status in the inventory. Include a column indicating whether each ti

SELECT
   distinct(title) AS film_title,
    CASE
        WHEN inventory_id IS NULL THEN 'NOT Available'
        ELSE 'Available'
    END AS availability_status
FROM
    film 
  JOIN inventory
USING(film_id)
ORDER BY
    film_title;










