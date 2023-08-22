USE sakila ;
SELECT * FROM FILM;

 SELECT  MIN(length) AS MIN_DURATION,
 MAX(length) AS MAX_DURATION FROM film ;
 
 SELECT
    FLOOR(AVG(length) / 60) AS average_hours,
    ROUND((AVG(length) % 60), 0) AS average_minutes
FROM
    film;
    
     SELECT * FROM rental ;
    SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS OPERATING_DATES
FROM rental;
 
 
 SELECT
    rental_id,
    rental_date,
    MONTHNAME(rental_date) AS rental_month,
    DAYNAME(rental_date) AS rental_weekday
FROM rental
LIMIT 20;

SELECT
    rental_id,
    rental_date,
    IF(DAYNAME(rental_date) IN ('Saturday', 'Sunday'), 'weekend', 'workday') AS DAY_TYPE
FROM rental;

# 3 
SELECT *,
CASE date_format(rental_date,'%D') IN ('SATURDAY','SUNDAY') THEN 'WEEKEND' ELSE 'WORKDAY' END AS day_type
FROM sakila.rental
GROUP BY rental_id
LIMIT 20 ;




 





