--bai 1
select name 
from city
where countrycode ='USA' and population > 120000;

--bai 2
select * 
from city
where countrycode = 'JPN';

--bai 3

--bai 8
select name 
from Employee
order by name;

--bai 9
select product_id
from products
where low_fats ='Y' and recyclable='Y'

  --bai 10
select name
from Customer
where referee_id != 2 or referee_id is null

  --bai 11
select name, population, area
from world
where (area >= 3000000) or (population >= 25000000);

--bai 12 
select distinct author_id as id
from views
where author_id=viewer_id
order by id asc;

--bai 13
SELECT part, assembly_step
FROM parts_assembly
where finish_date is NULL;

--bai 14
SELECT * 
FROM lyft_drivers 
WHERE yearly_salary <= 30000 OR yearly_salary >= 70000;

--bai 15
select advertising_channel
from uber_advertising
where money_spent > 100000
