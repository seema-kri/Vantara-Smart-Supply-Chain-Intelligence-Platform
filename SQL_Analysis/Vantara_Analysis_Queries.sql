
--Q1. Rank customers by total lifetime sales — who spend most?

SELECT customer_id, SUM(sales) AS total_sales,
       RANK() OVER (ORDER BY SUM(sales) DESC) AS rev_rank
FROM fact_orders
GROUP BY customer_id;

--Q2. Show running total of sales month by month — track cumulative growth.

SELECT d.year, d.month, SUM(f.sales) AS monthly_sales,
       SUM(SUM(f.sales)) OVER (ORDER BY d.year, d.month) AS running_sales
FROM fact_orders f
JOIN dim_date d ON f.order_date = d.date
GROUP BY d.year, d.month
ORDER BY d.year, d.month;

--Q3. Find month-over-month sales growth % — where sales rose/fell.

WITH monthly AS (
  SELECT d.year, d.month, SUM(f.sales) AS monthly_sales
  FROM fact_orders f
  JOIN dim_date d ON f.order_date = d.date
  GROUP BY d.year, d.month
)
SELECT year, month, monthly_sales,
       LAG(monthly_sales) OVER (ORDER BY year, month) AS prev_month_sales,
       ROUND((monthly_sales - LAG(monthly_sales) OVER (ORDER BY year, month))
             / NULLIF(LAG(monthly_sales) OVER (ORDER BY year, month),0) * 100, 2) AS growth_pct
FROM monthly
ORDER BY year, month;

--Q4. Top 5 most profitable product categories per customer segment.

WITH cat_profit AS (
  SELECT c.customer_segment, p.category_name,
         SUM(f.order_profit_per_order) AS total_profit
  FROM fact_orders f
  JOIN dim_customers c ON f.customer_id = c.customer_id
  JOIN dim_products p ON f.product_id = p.product_id
  GROUP BY c.customer_segment, p.category_name
),
ranked AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY customer_segment ORDER BY total_profit DESC) AS rn
  FROM cat_profit
)
SELECT * FROM ranked WHERE rn <= 5;

--Q5. Number each customer's orders in sequence — find repeat customers.

SELECT customer_id, order_id, order_date,
       ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS order_seq
FROM (SELECT DISTINCT customer_id, order_id, order_date FROM fact_orders) t;

--Q6. Rank states by total sales, show each state's % share of total revenue.

SELECT l.order_state, SUM(f.sales) AS state_sales,
       RANK() OVER (ORDER BY SUM(f.sales) DESC) AS state_rank,
       ROUND(SUM(f.sales) / SUM(SUM(f.sales)) OVER () * 100, 2) AS pct_of_total
FROM fact_orders f
JOIN dim_location l ON f.location_id = l.location_id
GROUP BY l.order_state
ORDER BY state_rank;

--Q7. Find 3-month moving average of fulfilment time — smooth out spikes.

WITH monthly_fulfil AS (
  SELECT d.year, d.month, AVG(f.fulfilment_time_days) AS avg_days
  FROM fact_orders f
  JOIN dim_date d ON f.order_date = d.date
  GROUP BY d.year, d.month
)
SELECT year, month, avg_days,
       AVG(avg_days) OVER (ORDER BY year, month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg_3m
FROM monthly_fulfil
ORDER BY year, month;

--Q8. Split customers into 4 value tiers (quartiles) by total spend.

SELECT customer_id, SUM(sales) AS clv,
       NTILE(4) OVER (ORDER BY SUM(sales) DESC) AS clv_quartile
FROM fact_orders
GROUP BY customer_id;

--Q9. For each customer, find days gap between consecutive orders.

WITH orders AS (
  SELECT DISTINCT customer_id, order_id, order_date FROM fact_orders
)
SELECT customer_id, order_id, order_date,
       order_date - LAG(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS days_since_last_order
FROM orders;

--Q10. Show delivery status breakdown with % share of total orders.

SELECT delivery_status, COUNT(*) AS cnt,
       ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS pct_share
FROM fact_orders
GROUP BY delivery_status;
