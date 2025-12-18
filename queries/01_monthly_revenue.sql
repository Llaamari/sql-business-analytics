-- Monthly revenue and month-over-month growth
-- Business question:
-- How is revenue developing over time?

WITH monthly_revenue AS (
  SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(oi.quantity * oi.unit_price_eur) AS revenue
  FROM orders o
  JOIN order_items oi ON o.order_id = oi.order_id
  WHERE o.status = 'paid'
  GROUP BY 1
)
SELECT
  month,
  revenue,
  revenue - LAG(revenue) OVER (ORDER BY month) AS revenue_growth
FROM monthly_revenue
ORDER BY month;
