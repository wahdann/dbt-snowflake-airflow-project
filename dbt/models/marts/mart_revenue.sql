SELECT
O.order_date,
O.order_id,
SUM(total_price) AS total_price
FROM {{ ref('dim_orders') }} O
LEFT JOIN {{ ref('fct_order_items') }} OI
ON O.order_id = OI.order_id
GROUP BY 1, 2