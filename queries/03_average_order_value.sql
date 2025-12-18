-- Average Order Value by sales channel
-- Business question:
-- Which channel produces the highest-value orders?

WITH order_totals AS (
  SELECT
    o.order_id,
    o.channel,
    SUM(oi.quantity * oi.unit_price_eur) AS order_value
  FROM orders o
  JOIN order_items oi ON o.order_id = oi.order_id
  WHERE o.status = 'paid'
  GROUP BY o.order_id, o.channel
)
SELECT
  channel,
  ROUND(AVG(order_value), 2) AS average_order_value
FROM order_totals
GROUP BY channel
ORDER BY average_order_value DESC;
