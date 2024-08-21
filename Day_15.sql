-- bai 1
SELECT extract(year from transaction_date), product_id, spend as curr_year_spend,
lag(spend) over(PARTITION BY product_id) as prev_year_spend,
round((spend-lag(spend) over(PARTITION BY product_id))/lag(spend) over(PARTITION BY product_id)*100,2)as yoy_rate
FROM user_transactions
order by product_id,extract(year from transaction_date)

-- bai 2
with rank_month
as(
SELECT issue_month, issue_year,card_name,issued_amount,
row_number() OVER(PARTITION BY card_name order by MAKE_DATE(issue_year, issue_month, 1)) as rank_month
FROM monthly_cards_issued
)
select card_name, issued_amount
from rank_month
where rank_month=1
order by issued_amount DESC

-- bai 3
with rank_time
AS(
SELECT user_id, spend, transaction_date,
row_number() OVER(PARTITION BY user_id order by transaction_date) as rank_time
FROM transactions
)
select user_id, spend, transaction_date
from rank_time
where rank_time = 3

-- bai 4
