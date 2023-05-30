--1) How many actors are there with the last name 'Walhberg'?
select first_name, last_name
from actor
where last_name = 'Walhberg';

--2) How many payments were made between 3.99 and 5.99?
select count(amount)
from payment
where amount between 3.99 and 5.99;

--3. What films have exactly 7 copies? (search in inventory)
select f.title, count(i.film_id) as film_count
from film f
join inventory i on i.film_id = f.film_id
group by f.title
having count (i.film_id) = 7;

--4. How many customers have the first name ‘Willie’?
select count(first_name)
from customer 
where first_name = 'Willie';

--5. What store employee (get the id) sold the most rentals (use the rental table)?
select count(staff_id), staff_id
from rental
group by staff_id
order by count(distinct rental_id) desc;

--6. How many unique district names are there?
select count(distinct district)
from address;

--7. What film has the most actors in it? (use film_actor table and get film_id)
select film_id, count(distinct actor_id)
from film_actor
group by film_id
order by count(distinct actor_id) desc;

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select count (*)
from customer
where store_id = 1 and last_name like '&es';

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
select amount, count(*)
from payment
where customer_id between 380 and 430
group by amount
having count(*) > 250;

--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?
select count(distinct rating) as number_of_rating_categories
from film;

select rating, count(*) as movie_count
from film group by rating
order by movie_count desc
limit 1;
