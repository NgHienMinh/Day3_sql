-- bai 1
select name
from STUDENTS 
where marks > 75
order by right(name,3), id

-- bai 2
select user_id, INITCAP(name) as name  
from Users

--bai 3
SELECT manufacturer, ('$'||cast(round(sum(total_sales)/1000000) as text )||' million')
FROM pharmacy_sales
GROUP BY manufacturer
order by sum(total_sales) desc;

--bai 4
SELECT extract(month from submit_date) as mth, product_id, round(avg(stars),2) as avg_stars
FROM reviews
GROUP BY extract(month from submit_date), product_id
order by extract(month from submit_date);

-- bai 5
SELECT sender_id, count(*) as message_count 
FROM messages
where extract(month from sent_date) = 8 and extract(year from sent_date) = 2022
group by sender_id
order by count(*) desc
limit 2;

-- bai 6
select tweet_id 
from Tweets
where length(content)>15

-- bai 7
select activity_date as day, count(distinct user_id) as active_users
from Activity
WHERE (activity_date > '2019-06-27' AND activity_date <= '2019-07-27')
group by activity_date 

-- bai 8
select count(id)
from employees
where(joining_date => '2022-01-01' and joining_date <= '2022-07-31');

-- bai 9
select position('a' in first_name)
from worker
where first_name = 'Amitah';

-- bai 10
select substring(title,length(winery)+1,5) 
from winemag_p2
where country='Macedonia';
