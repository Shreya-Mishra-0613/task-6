SELECT
    strftime('%Y-%m', o.order_purchase_timestamp) AS month,
    COUNT(DISTINCT oi.order_id) AS order_volume,
    ROUND(SUM(oi.price), 2) AS monthly_revenue
FROM
    olist_orders_dataset o
JOIN
    olist_order_items_dataset oi
    ON o.order_id = oi.order_id
GROUP BY
    month
ORDER BY
    month ASC;
