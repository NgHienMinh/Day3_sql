-- bai 1


-- bai 2
With total_spend
AS(
SELECT category, product, sum(spend) as total_spend
FROM product_spend
where extract(year from transaction_date) = 2022
group by category, product
), 
rank_spend
AS(
select  category, product, total_spend,
(RANK() OVER(PARTITION BY  category order by total_spend DESC)) as rank_spend
from total_spend
)
select  category, product, total_spend
from rank_spend
where rank_spend <3

-- bai 3
with call
AS(
SELECT policy_holder_id
FROM callers
group by policy_holder_id
having count(policy_holder_id) >= 3
)
select count(*)
from call

-- bai 4
SELECT pages.page_id
FROM pages
left join page_likes on pages.page_id=page_likes.page_id
where page_likes.user_id is null
order by pages.page_id

-- bai 5


-- bai 6
with approved
as(
    select TO_CHAR(trans_date, 'YYYY-MM') as month, country, count(state) as approved_count  , sum(amount) as approved_total_amount
    from Transactions
    where state='approved'
    group by TO_CHAR(trans_date, 'YYYY-MM'), country
),
total
as(
    select TO_CHAR(trans_date, 'YYYY-MM') as month, country, sum(amount) as trans_total_amount, count(trans_date) as trans_count 
    from Transactions
    group by TO_CHAR(trans_date, 'YYYY-MM'), country
)
select approved.month, approved.country, total.trans_count,approved.approved_count,total.trans_total_amount, approved.approved_total_amount
from  approved
join total on total.month=approved.month and total.country = approved.country

-- bai 7
with rank
as(
    select product_id, quantity, price, year
    ,row_number() over(partition by product_id order by year asc) as rank_year
    from Sales
)
select product_id, year as first_year, quantity, price
from rank
where rank_year=1

-- bai 8


-- bai 9
with employ
as(
    select employee_id
    from Employees
)
select employee_id
from Employees
where salary < 30000 and manager_id not in (select employee_id from employ)

-- bai 10


-- bai 11


-- bai 12


