
# 📊 Task 6 – Sales Trend Analysis Using Aggregations

---

## ✅ Objective

Analyze **monthly revenue** and **order volume** using SQL aggregation techniques on e-commerce data.

---

## 🛠 Tools Used

- **SQLite** (via DB Browser for SQLite)
- **SQL** (SQLite dialect)
- **Olist Public Dataset** from Kaggle

---

## 📁 Dataset Information

**Files Used:**

- `olist_orders_dataset.csv` – contains `order_id`, `order_purchase_timestamp`
- `olist_order_items_dataset.csv` – contains `order_id`, `product_id`, `price`

**Imported Tables:**

- `olist_orders_dataset`
- `olist_order_items_dataset`

---

## 📌 SQL Query Used

```sql
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
```

---

## 📈 Sample Output

```text
| Month   | Order Volume | Monthly Revenue |
|---------|---------------|------------------|
| 2016-09 | 5             | 223.44           |
| 2016-10 | 24            | 1814.77          |
| 2016-11 | 85            | 6466.16          |
| 2016-12 | 171           | 12355.53         |
| ...     | ...           | ...              |
| 2018-08 | 367           | 27771.57         |
```

📂 **Full results saved in**: `result.csv`

---

## 📤 Deliverables

- `task6_sales_trend.sql` – SQL query file
- `result.csv` – Exported results
- `README.md` – This file
- `e-commerce data.db` - Dataset used

---

## 📚 Key Learnings

- Joined datasets using foreign key (`order_id`)
- Used `strftime()` to extract month and year
- Applied aggregate functions:
  - `SUM(price)` → total revenue
  - `COUNT(DISTINCT order_id)` → order volume
- Grouped and sorted data to observe monthly trends
