# 📊 Business Analytics SQL Project

A portfolio-ready **SQL analytics project** demonstrating data modeling, analytical querying and business insight generation using PostgreSQL.

This project simulates a real-world sales database and answers common business questions such as:
- How is revenue developing over time?
- Who are the most valuable customers?
- How well do customers return after their first purchase?
- Which products and channels perform best?

---

## 🛠️ Tech Stack
- **PostgreSQL 16**
- **Docker & Docker Compose**
- **Pure SQL**
  - CTEs
  - Window functions
  - Aggregations
  - Cohort & retention analysis

---

## 🗂️ Project Structure
```text
sql-business-analytics/
├── docker-compose.yml
├── schema/
│   └── 01_create_tables.sql
├── data/
│   └── 02_insert_sample_data.sql
├── queries/
│   ├── 01_monthly_revenue.sql
│   ├── 02_top_customers.sql
│   ├── 03_average_order_value.sql
│   ├── 04_customer_lifetime_value.sql
│   ├── 05_product_category_trends.sql
│   └── 06_customer_cohort_retention.sql
└── insights/
    └── business_insights.md
```

## 🧩 ER Diagram (Logical Data Model)
```text
customers
---------
customer_id (PK)
full_name
email
country
signup_date
is_active

products
--------
product_id (PK)
sku
product_name
category
unit_price_eur

orders
------
order_id (PK)
customer_id (FK → customers)
order_date
status
channel

order_items
-----------
order_id (FK → orders)
product_id (FK → products)
quantity
unit_price_eur
(PK: order_id + product_id)
```
**Relationships**
- One customer → many orders
- One order → many order items
- One product → many order items

This schema is optimized for **analytical queries**, not OLTP transactions.

## ▶️ How to Run Locally

**Prerequisites**
- Docker Desktop installed and running<br>
👉 https://www.docker.com/products/docker-desktop/

### 1️⃣ Clone the repository

```bash
git clone https://https://github.com/Llaamari/sql-business-analytics.git
cd sql-business-analytics
```

### 2️⃣ Start PostgreSQL with Docker

```bash
docker compose up -d
```
This will:
- start a PostgreSQL container
- automatically create tables
- insert sample data

### 3️⃣ Connect to the database

```bash
docker exec -it business_analytics_db psql -U analytics -d business_analytics
```

### 4️⃣ Verify setup

```sql
\dt
SELECT COUNT(*) FROM customers;
```

### 5️⃣ Run analytics queries

Example:
```sql
\i queries/06_customer_cohort_retention.sql
```

## 📈 Analytics Highlights

**Revenue & KPIs**
- Monthly revenue and growth (MoM)
- Average Order Value (AOV)
- Customer Lifetime Value (LTV)

**Customer Analytics**
- Top customers by revenue
- Cohort-based retention analysis
- Customer behavior over time

**Product Analytics**
- Category-level revenue trends
- Growth and decline detection

## 🧠 Business Insights

Key findings and recommendations are documented in:
```bash
insights/business_insights.md
```
The insights translate SQL results into **actionable business decisions**, such as:
- retention strategies
- channel optimization
- product portfolio prioritization

## 🚀 Why This Project

This project demonstrates:
- strong SQL fundamentals
- analytical thinking
- ability to connect data → insights → recommendations
- real-world workflow using Docker and PostgreSQL

It is designed to be **easy to run, easy to read, and easy to extend**.

## 🔮 Possible Extensions

- Retention rate visualization
- Larger synthetic dataset
- BI dashboard (Tableau / Power BI)
- Predictive customer segmentation

## 👤 Author

Laura<br>
Software Developer / Data Enthusiast