-- bai 1
SELECT 
    COUNTRY.Continent, 
    FLOOR(AVG(CITY.Population)) AS average_population
FROM 
    CITY
INNER JOIN 
    COUNTRY ON CITY.CountryCode = COUNTRY.Code
GROUP BY 
    COUNTRY.Continent;

-- bai 2
SELECT round(count(texts.email_id)::decimal/count(DISTINCT emails.email_id),2)
FROM emails 
left join texts on texts.email_id=emails.email_id and texts.signup_action = 'Confirmed';

-- bai 3
with send_open
AS
(
select age_breakdown.age_bucket as age_bucket,
sum(CASE
  when activity_type = 'open' then time_spent 
  else 0 
end) time_spent_open,
sum(CASE 
  when activity_type = 'send' then time_spent 
  else 0
end) time_spent_send
from activities
JOIN age_breakdown on age_breakdown.user_id=activities.user_id
where activities.activity_type in ('open', 'send')
GROUP BY age_breakdown.age_bucket
)
select age_bucket,round((time_spent_open/(time_spent_open+time_spent_send)*100),2) as open_perc,
round((time_spent_send/(time_spent_open+time_spent_send)*100),2) as send_perc
from send_open

-- bai 4
With customer
AS
(
SELECT customer_contracts.customer_id as customer_id,
Sum(CASE
  WHEN product_name like 'Azure%' then 0 
  else 1
end) as total
FROM customer_contracts
LEFT JOIN products on products.product_id=customer_contracts.product_id
GROUP BY customer_contracts.customer_id
)
Select customer_id
from customer
Where total<1

-- bai 5
with manager
as
(
    select reports_to, count(reports_to) as reports_count, ceiling(avg(age)) as average_age
    from Employees
    group by reports_to 
)
select Employees.employee_id, Employees.name, manager.reports_count, manager.average_age
from Employees
join manager on Employees.employee_id =manager.reports_to

-- bai 6
select Products.product_name, sum(Orders.unit) as unit
from Orders
join Products on Products.product_id = Orders.product_id
where extract(month from order_date)=2 and extract(year from order_date)=2020
group by Products.product_id, Products.product_name, Products.product_category
having sum(Orders.unit)>=100

-- bai 7
SELECT pages.page_id
FROM pages
left join page_likes on pages.page_id=page_likes.page_id
where page_likes.user_id is null
order by pages.page_id
