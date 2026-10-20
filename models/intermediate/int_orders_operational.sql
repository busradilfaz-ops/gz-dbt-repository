select 
o.orders_id,
o.date_date,
round(sum(o.margin+ coalesce(sh.shipping_fee, 0)- coalesce(sh.logcost, 0)- coalesce(sh.ship_cost, 0)),2) as operational_margin
from {{ ref('stg_raw__ship')}} sh
left join {{ ref ('int_orders_margin')}} o
using(orders_id)
group by o.orders_id, o.date_date
order by o.orders_id desc





