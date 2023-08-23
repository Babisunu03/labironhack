# retrieve  store id and its address
USE sakila ;
SELECT  store_id,address 
FROM address
INNER JOIN  store
USING(address_id) ;

# retrieve all payments processed by each employee, with their amount
# columns : employees first name and amount of the payment

SELECT first_name,amount
FROM payment as p
inner join staff as s
using(staff_id);

# total payment by each staff members

SELECT first_name,SUM(amount) AS Total_amount
FROM payment as p
inner join staff as s
using(staff_id)
GROUP BY first_name
ORDER BY total_amount DESC ;

 
 # retrieve  the actor id and title of film in which actor starred
 # columns : actor_id,title
SELECT actor_id,title 
FROM FILM AS F
INNER JOIN FILM_ACTOR
USING (film_id) 
INNER JOIN actor
USING(actor_id);

SELECT first_name,last_name,title 
FROM FILM AS F
INNER JOIN FILM_ACTOR
USING (film_id) 
INNER JOIN actor
USING(actor_id)
WHERE title = 'ACE GOLDFINGER' ;

# RETRIEVE THE NUMBER OF ACTORS THAT STARRED IN EACH FILM
# COLUMNS : FILM_TITLE,COUNT OF ACTORS

SELECT title,count(actor_id) as number_of_actors
FROM FILM
INNER JOIN film_actor
USING(film_id)
GROUP BY title;
