SELECT
oi.id AS item_id,
c.id AS customer_id,
oi.order_id,
p.id,
oi.quantity,
oi.unit_price,
(oi.quantity * oi.unit_price) AS total_price 
FROM {{ source('raw_data', 'order_items') }} as oi 
join {{ source('raw_data', 'orders') }} as o 
on oi.order_id=o.id
join {{ source('raw_data', 'customers') }} as c 
on o.customer_id=c.id 
join {{ source('raw_data', 'products') }} as p  
on oi.product_id=p.id