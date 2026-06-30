SELECT DISTINCT order_status FROM fact_orders;

-- Q1: Revenue trend by year and month
select d.year,d.month,d.month_name,
round(sum(f.order_item_total)::numeric,2) as revenue,
count(distinct f.order_id) as total_orders
from fact_orders f
join dim_date d 
on f.order_date=d.date
where f.order_status!='Canceled'
group by d.year,d.month,d.month_name
order by d.year,d.month;

-- 2. Profit by category
select p.category_name,sum(f.order_profit_per_order) as total_profit,
count(f.order_id) as total_orders
from fact_orders f
join dim_products p on f.product_id = p.product_id
group by p.category_name
order by total_profit desc;

-- 3. Late delivery rate by shipping mode
select shipping_mode,count(*) as total_orders,
sum(late_delivery_risk) as late_orders
from fact_orders
group by shipping_mode
order by late_orders desc;

-- 4. Average profit by discount rate
select order_item_discount_rate,avg(order_item_profit_ratio) as avg_profit_ratio,
count(*) as total_orders
from fact_orders
group by order_item_discount_rate
order by order_item_discount_rate;

-- 5. Revenue and profit by customer segment
select c.customer_segment,sum(f.order_item_total) as revenue,
sum(f.order_profit_per_order) as profit
from fact_orders f
join dim_customers c on f.customer_id = c.customer_id
group by c.customer_segment
order by revenue desc;

-- 6. Profit by market/region
select l.market, l.order_region,
sum(f.order_profit_per_order) as total_profit
from fact_orders f
join dim_location l on f.location_id = l.location_id
group by l.market, l.order_region
order by total_profit desc;

-- 7. Order status breakdown (count by status)
select order_status,COUNT(*) AS total_orders
FROM fact_orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- 8. Year-over-year profit margin
select d.year,sum(f.order_profit_per_order) as total_profit,
sum(f.order_item_total) as total_revenue
from fact_orders f
join dim_date d on f.order_date = d.date
group by d.year
order by d.year;