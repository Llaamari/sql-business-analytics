-- Customer Cohort & Retention Analysis
-- Business question:
-- How well do customers return after their first purchase?

WITH first_purchase AS (
  SELECT
    customer_id,
    DATE_TRUNC('month', MIN(order_date)) AS cohort_month
  FROM orders
  WHERE status = 'paid'
  GROUP BY customer_id
),

customer_activity AS (
  SELECT
    o.customer_id,
    DATE_TRUNC('month', o.order_date) AS activity_month
  FROM orders o
  WHERE o.status = 'paid'
),

cohort_activity AS (
  SELECT
    fp.cohort_month,
    ca.customer_id,
    ca.activity_month,
    (
      EXTRACT(YEAR FROM ca.activity_month) - EXTRACT(YEAR FROM fp.cohort_month)
    ) * 12 +
    (
      EXTRACT(MONTH FROM ca.activity_month) - EXTRACT(MONTH FROM fp.cohort_month)
    ) AS month_number
  FROM first_purchase fp
  JOIN customer_activity ca
    ON fp.customer_id = ca.customer_id
)

SELECT
  cohort_month,
  month_number,
  COUNT(DISTINCT customer_id) AS active_customers
FROM cohort_activity
GROUP BY cohort_month, month_number
ORDER BY cohort_month, month_number;
