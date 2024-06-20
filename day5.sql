--bai 1


--bai 2
select count(city)-count(distinct city)
from station;

--bai 3

--bai 4
SELECT 
ROUND(
sum(item_count::decimal*order_occurrences)/sum(order_occurrences)
,1)
FROM items_per_order;

--bai 5
