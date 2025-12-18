# 📈 Business Insights
*Business Analytics SQL Project*

## Project Overview
This analysis is based on a simulated sales database containing customer, order, product and revenue data.  
The goal is to extract **actionable business insights** using SQL analytics techniques such as CTEs, aggregations and window functions.

---

## 1️⃣ Revenue Development Over Time

**Finding**
- Monthly revenue shows variation across months.
- Growth is driven primarily by **paid orders**, while refunded and cancelled orders reduce net performance.

**Insight**
- Revenue volatility suggests opportunities to:
  - stabilize recurring purchases
  - improve refund/cancellation prevention

**Recommendation**
- Focus on customer retention strategies (email campaigns, loyalty incentives).
- Investigate causes behind refunded orders.

---

## 2️⃣ Top Customers Drive a Disproportionate Share of Revenue

**Finding**
- A small number of customers generate the majority of total revenue.
- High-value customers come from multiple countries, not a single market.

**Insight**
- Revenue concentration indicates a **Pareto effect (80/20)**.

**Recommendation**
- Identify high-LTV customers early.
- Offer premium support, personalized offers or loyalty programs to retain them.

---

## 3️⃣ Sales Channels Perform Differently

**Finding**
- Average Order Value (AOV) varies by channel.
- Some channels produce fewer but higher-value orders.

**Insight**
- Channels should not be evaluated only by volume, but by **order quality**.

**Recommendation**
- Allocate marketing budget based on AOV and revenue contribution, not just traffic.
- Upsell strategies may be more effective in high-AOV channels.

---

## 4️⃣ Customer Lifetime Value (LTV)

**Finding**
- Customers differ significantly in lifetime value.
- Signup date alone does not predict customer value.

**Insight**
- Early behavior is more important than acquisition timing.

**Recommendation**
- Track customer behavior shortly after signup.
- Use early purchase patterns to predict long-term value.

---

## 5️⃣ Product Category Trends

**Finding**
- Some product categories show consistent revenue growth.
- Others remain flat or decline month-over-month.

**Insight**
- Product performance varies strongly by category.

**Recommendation**
- Prioritize inventory and marketing for growing categories.
- Re-evaluate pricing or positioning for declining categories.

---

## 📌 Key Takeaways
- SQL analytics can reveal meaningful business insights even from relatively small datasets.
- Combining **technical SQL skills** with **business interpretation** creates real value.
- This project demonstrates end-to-end analytical thinking:  
  *from data modeling → querying → insights → recommendations.*

---

## 🛠️ Technical Highlights
- PostgreSQL
- CTEs and window functions
- Revenue and KPI calculations
- Business-oriented SQL queries