WITH order_per_day AS(
select 
date_date,
COUNT(DISTINCT orders_id) as nb_transactions,
ROUND(SUM(revenue),0) AS revenue,
round(sum(operational_margin),0) as operational_margin,
round(sum(purchase_cost),0) as purchase_cost,
round(sum(shipping_fee),0) as shipping_fee,
round(sum(ship_cost),0) as ship_cost,
ROUND(SUM(logcost),0) AS log_cost,
round(sum(quantity),0) as quantity
from {{ ref('int_orders_operational') }}
group by date_date
order by date_date desc
)
select 
*,
round( revenue / NULLIF(nb_transactions, 0)) as avg_basket
 from order_per_day
 order by date_date desc
