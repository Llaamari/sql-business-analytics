-- Top customers by total revenue
-- Business question:
-- Who are our most valuable customers?

SELECT
  c.customer_id,
  c.full_name,
  c.country,
  SUM(oi.quantity * oi.unit_price_eur) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'paid'
GROUP BY c.customer_id, c.full_name, c.country
ORDER BY total_revenue DESC
LIMIT 10;
