--bai 1
select distinct(city)
from station
where id%2=0;

--bai 2
select count(city)-count(distinct city)
from station;

--bai 3
select
ceiling
(
avg(salary)-avg(replace(salary, '0',''))
)
from EMPLOYEES 

--bai 4
SELECT 
ROUND(
sum(item_count::decimal*order_occurrences)/sum(order_occurrences)
,1)
FROM items_per_order;

--bai 5
SELECT candidate_id 
FROM candidates
where skill in ('Python', 'Tableau', 'PostgreSQL')
group by candidate_id
having count(*) >2

--bai6
SELECT user_id, abs(max(extract(doy from post_date))- min(extract(doy from post_date)) ) 	 
FROM posts
where (extract(year from post_date)) =2021
group by user_id
having count(post_id)>1;

-- bai7
SELECT card_name, max(issued_amount) - min(issued_amount)
FROM monthly_cards_issued
group by card_name
order by max(issued_amount) - min(issued_amount) desc;

-- bai8
SELECT  manufacturer,  count(*), abs(sum(cogs-total_sales)) as total_loss
FROM pharmacy_sales
where cogs > total_sales	
group by manufacturer
order by sum(cogs-total_sales) desc;

-- bai9
select id , movie, description, rating 
from Cinema
where description not in ('boring') and id%2=1
order by id desc;

-- bai10
select teacher_id, count(distinct subject_id ) as cnt
from Teacher
group by teacher_id 

-- bai11
select user_id , count(follower_id ) as followers_count
from Followers
group by user_id 
order by user_id

-- bai12 
select class    
from Courses
group by class    
having count(class)>5
