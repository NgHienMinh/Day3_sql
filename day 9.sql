-- bai 1
SELECT 
SUM(CASE when device_type='laptop' then 1 end) laptop_views,
sum(CASE when device_type='phone' then 1 when device_type='tablet' then 1 end)  mobile_views
FROM viewership;

-- bai 2
select *, 
case
    when (x+y>z and x+z>y and z+y>x) then 'Yes'
    else 'No'
end triangle 
from Triangle

-- bai 3
SELECT 
(SUM(
  CASE
  when call_category ='n/a' then 1
  when call_category is NULL then 1
  else 0 end))::FLOAT/count(*)*100
FROM callers;

-- bai 4
select name 
from Customer
where referee_id not in ('2') or referee_id is null

-- bai 5
