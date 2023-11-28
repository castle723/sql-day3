--1. List all customers who live in Texas (use JOINs)
select customer.first_name, customer.last_name, customer.email, district
from customer
full join address
on customer.address_id = address.address_id
where district = 'texas';
--2. Get all payments above $6.99 with the Customer's Full Name
select customer.first_name, customer.last_name, amount
from customer 
full join payment
on customer.customer_id = payment.customer_id 
where amount > 6.99;
--3. Show all customers names who have made payments over $175(use subqueries)
select *
from customer
where customer_id in(
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
);
--4. List all customers that live in Nepal (use the city table)
select customer.first_name, customer.last_name, customer.email, country
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
full join country
on city.country_id = country.country_id
where country = 'nepal';

--5. Which staff member had the most transactions?
select count(sale_id), sales.staff_id
from sales
full join staff 
on staff.staff_id = sales.staff_id
group by sales.staff_id;
--6. How many movies of each rating are there?
select count(movie_id), rating 
from movie_info_tf 
group by rating;
--I dont really understand the wording of this question, only one table in this db has a rating, and its both empty and the question itself doesnt need to be joined with anything else
--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select *
from customer
where customer_id in(
	select customer_id
	from payment
	where amount > 6.99
	group by customer_id
	having count(payment_id) = 1
);
--8. How many free rentals did our stores give away
select amount, count(amount)
from payment
where amount = 0
group by amount;

