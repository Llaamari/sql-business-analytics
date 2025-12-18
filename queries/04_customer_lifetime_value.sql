-- Customer Lifetime Value (LTV)
-- Business question:
-- How much revenue does each customer generate over their lifetime?

SELECT
  c.customer_id,
  c.full_name,
  c.signup_date,
  SUM(oi.quantity * oi.unit_price_eur) AS lifetime_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'paid'
GROUP BY c.customer_id, c.full_name, c.signup_date
ORDER BY lifetime_value DESC;
