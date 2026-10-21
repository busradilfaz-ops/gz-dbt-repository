SELECT
	o.orders_id
	,o.date_date
	,ROUND(o.margin + sh.shipping_fee - (sh.logcost + sh.ship_cost),2) AS operational_margin
	,o.quantity
	,o.revenue
	,o.purchase_cost
	,o.margin
	,sh.shipping_fee
	,sh.logcost
	,sh.ship_cost
FROM {{ref("int_orders_margin")}} o
LEFT JOIN {{ref("stg_raw__ship")}} sh
	USING(orders_id)
ORDER BY orders_id desc





