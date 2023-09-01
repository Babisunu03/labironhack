use sakila;
create temporary table bank.loan_and_account
select l.loan_id,l.account_id,a.district_id,l.amount,l.payments,a.frequency
from bank.loan as l
join bank.acount a
on l.account_id = a.account_id ;
SELECT * FROM bank.loan_and_account ;

CREATE VIEW family_movies AS
SELECT title,language_id
FROM film
WHERE language_id = 1 ; 


CREATE  VIEW total_pc AS
SELECT SUM(AMOUNT) AS total_pc
from payment
group by customer_id
having avg(amount);

SELECT customer_id,sum(amount) as total_amount
from payment
group by customer_id
having total_amount> (select avg(total_pc)
                      from total_pc);



