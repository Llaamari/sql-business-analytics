-- Product category revenue trends over time
-- Business question:
-- Which product categories are growing or declining?

WITH category_monthly AS (
  SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    p.category,
    SUM(oi.quantity * oi.unit_price_eur) AS revenue
  FROM orders o
  JOIN order_items oi ON o.order_id = oi.order_id
  JOIN products p ON oi.product_id = p.product_id
  WHERE o.status = 'paid'
  GROUP BY 1, 2
)
SELECT
  month,
  category,
  revenue,
  revenue - LAG(revenue) OVER (
    PARTITION BY category
    ORDER BY month
  ) AS revenue_growth
FROM category_monthly
ORDER BY category, month;
