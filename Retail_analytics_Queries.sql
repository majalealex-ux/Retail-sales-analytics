--Section A — SQL fundamentals
-- Q1 Retrieve all customer records

select * from customers;

--Q2 Display customer names, cities, and segments.
select customer_name, city,customer_segment
from customers c ;

--Q3 Find customers living in Nairobi.
select customer_name, city
from customers c 
where city ='Nairobi';

--Q4 Find customers registered after January 1, 2025.
select customer_name, registration_date
from customers c 
where c.registration_date > '2025-01-01';

--Q5 Display all unique customer cities.
select distinct(city)
from customers c ;

--Q6 Retrieve the 10 most recent orders
select order_date, product_name
from orders
order by order_date desc
limit 10;

--Q7 Find orders with unit prices above KSh 10,000

select order_id,product_name,unit_price
from orders
where unit_price > '10000';

--Q8 Find customers whose names start with A.

select customer_name
from customers
where customer_name like'A%';

--Q9 Retrieve orders with quantities between 2 and 5.

select order_id, product_name,quantity
from orders
where quantity between 2 and 5;

--Q10 Retrieve orders with quantities between 2 and 5.
select order_id,payment_method
from orders
where payment_method ='M-Pesa';

-- Section B — Aggregation and grouping
--Q11 Count all customers.

select count(*)
from customers;

--Q12 Count all orders
select count(*)
from orders;

--Q13 Calculate completed-order revenue.

select sum(quantity * unit_price * (1 - discount / 100)) as revenue, order_status
from orders
where order_status = 'Completed'
group by order_status ;

--Q14 Calculate the average completed-order value.

select avg(quantity * unit_price * (1 - discount / 100)) as revenue, order_status
from orders
where order_status = 'Completed'
group by order_status ;

--Q15 Find the highest and lowest product prices.

select  max(unit_price) as highest_price,min(unit_price)as lowest_price
from orders;

--Q16 Calculate revenue by product category.

select sum(quantity * unit_price * (1 - discount / 100)) as revenue,product_category
from orders
group by product_category;

--Q17 Count customers by city.
select count(*) as customer_count, city 
from customers
group by city;

--Q18 Calculate quantity sold by product.
select product_name, sum(quantity) as total_quantity
from orders
group by product_name;

--Q19 Find categories generating more than KSh 100,000 in revenue.
select * from orders;
select product_category, sum(quantity * unit_price * (1 - discount / 100)) as revenue
from orders
group by product_category
having sum(quantity * unit_price * (1 - discount / 100)) > '100000';

--Q20 Calculate the percentage of cancelled orders.

select count(order_status)/count(*)* 100.0 as percentage_of_Cancelled_orders
from orders
where order_status ='Cancelled';

-- Section C — Joins and customer analytics
--Q21 Display orders with customer names and cities.

select customer_name, city,order_id
from retail_analytics.customers c2
full outer join retail_analytics.orders o2 on o2.customer_id =c2.customer_id;

--Q22 Calculate total spending by customer
select c.customer_name, sum(o.quantity * o.unit_price * (1 - o.discount / 100)) as total_spending
from customers c
join orders o on c.customer_id =o.customer_id
group by c.customer_name;

--Q23 Identify customers who have never ordered.

select c.customer_name
from customers c
left join orders o on c.customer_id =o.customer_id
where o.customer_id is null;

--Q24 Find the 10 highest-spending customers.

select c.customer_name, sum(o.quantity * o.unit_price * (1 - o.discount / 100)) as Customer_spending
from customers c
join orders o on c.customer_id =o.customer_id
group by c.customer_name
order by sum(o.quantity * o.unit_price * (1 - o.discount / 100)) desc 
limit 10;

--Q25 Calculate revenue by customer city.
select c.city, sum(o.quantity * o.unit_price * (1 - o.discount / 100)) as Total_revenue
from customers c
join orders o on c.customer_id =o.customer_id
group by c.city;

--Q26 Identify customers with more than five orders.

select c.customer_name, count(order_id) as order_count
from customers c
join orders o on c.customer_id =o.customer_id
group by c.customer_name
having count(order_id) >'5';

--Q27 Calculate average customer spending by segment.
select customer_segment, sum(o.quantity * o.unit_price * (1 - o.discount / 100)) as customer_spending
from customers c
join orders o on c.customer_id =o.customer_id
group by c.customer_segment;

-- Q28 Identify the most popular category among VIP customers.
select * from customers;
select c.customer_segment,o.product_category,COUNT(*) as purchase_count
from customers c
join orders o on c.customer_id = o.customer_id
where c.customer_segment = 'VIP'
group by c.customer_segment,o.product_category
order by purchase_count desc
limit 1;

-- Section D — Subqueries and CTEs
-- Q29 Find customers spending above the average total spending per purchasing customer.
select * from CUSTOMERS;
select * from retail_analytics.orders o2 ;

with customer_spending as (select o2.customer_id,c.customer_name,
sum(o2.quantity * o2.unit_price * (1 - o2.discount / 100.0)) as total_spending
from retail_analytics.orders o2
join retail_analytics.customers c  on c.customer_id = o2.customer_id
group by o2.customer_id, c.customer_name),
average_spending as (select avg(total_spending) AS avg_spending
from customer_spending)
select cs.customer_id,cs.customer_name,cs.total_spending
from customer_spending cs
cross join average_spending av
where cs.total_spending > av.avg_spending
order by cs.total_spending desc;

--Q30 Find products priced above the overall average unit price.
select * from retail_analytics.orders o ;
select distinct(product_name),unit_price
from retail_analytics.orders o 
where unit_price > (select avg(unit_price)
from retail_analytics.orders o2 )
order by unit_price desc;

with average_price as (select avg(unit_price) as overall_avg
from retail_analytics.orders O)
select distinct(product_name),unit_price
from retail_analytics.orders o 
where unit_price > (select overall_avg from average_price)
order by unit_price desc;

--Q31 Use a CTE to identify the three highest-revenue months.

with revenue_month as (select extract(year from order_date) as order_year, extract(month from order_date) as order_month,
sum(quantity * unit_price * (1 - discount / 100.0)) as total_revenue
from retail_analytics.orders
group by extract(year from order_date),extract(month from order_date))
select *
from revenue_month
order by total_revenue desc
limit 3;

--Q32 Find customers purchasing from at least three categories.

select c.customer_id,c.customer_name,COUNT(distinct o.product_category) AS categories_count
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id,c.customer_name
having COUNT(distinct o.product_category) >= 3
order by categories_count desc;

select c.customer_id,c.customer_name
from customers c
where c.customer_id IN (select o.customer_id
from orders o
group by o.customer_id
having COUNT(distinct o.product_category) >= 3);

with customer_categories as (select customer_id,COUNT(distinct product_category) as categories_count
from orders
group by customer_id)
select c.customer_id,c.customer_name,cc.categories_count
from customers c
join customer_categories cc on c.customer_id = cc.customer_id
where cc.categories_count >= 3
order by cc.categories_count desc;

--Q33 Use a CTE to calculate category revenue, cost, profit, and profit margin.

with category_metrics as (select product_category,
sum(quantity * unit_price * (1 - discount / 100.0))as total_revenue,
sum(quantity * cost_price)as total_cost
from orders
group by product_category),
category_profit as (select product_category,total_revenue,total_cost,total_revenue - total_cost as profit
from category_metrics)
select product_category,total_revenue,total_cost,profit,round((profit / NULLIF(total_revenue, 0)) * 100,2) as profit_margin 
from category_profit
order by total_revenue desc;

--Q34 Find customers whose latest completed order is more than 90 days before the latest order date in the dataset.

with completed_order_date as(select o.customer_id, max(order_date) as latest_completed_date
from orders o 
where o.order_status ='Completed'
group by o.customer_id),
latest_date as (select  max(order_date) as latest_data_date
from orders o )
select c.customer_name,c.customer_id, cod.latest_completed_date - ld.latest_data_date as date_diff
from customers c 
join completed_order_date cod
on c.customer_id = cod.customer_id
cross join latest_date ld
where ld.latest_data_date - cod.latest_completed_date > 90;


with customer_latest_completed as (select customer_id,max(order_date) as latest_completed_date
from orders
where order_status = 'Completed'
group by customer_id),
dataset_latest_date as (select max(order_date) as latest_dataset_date
from orders)
select c.customer_name,c.customer_id,clc.latest_completed_date,dld.latest_dataset_date,dld.latest_dataset_date - clc.latest_completed_date as date_difference
from customers c
join customer_latest_completed clc
on c.customer_id = clc.customer_id
cross join dataset_latest_date dld
where dld.latest_dataset_date - clc.latest_completed_date > 90;

--Section E — Window functions
--Q35 Rank customers by spending using RANK()

select * from customers;
select * from orders;

select c.customer_name,sum(o.quantity * o.unit_price * (1 - o.discount / 100.0)) as spending,RANK()over(order by c.customer_name) as spending_rank
from customers c 
join orders o on c.customer_id = o.customer_id 
group by c.customer_name ;

--Q36 Number each customer's orders by recency using ROW_NUMBER()

select c.customer_name,o.order_date,row_number()over(order by order_date desc) as recent
from customers c 
join orders o on c.customer_id = o.customer_id 
group by c.customer_name,o.order_date ;

--Q37 Rank products within categories using DENSE_RANK().

select product_name,product_category,
DENSE_RANK() over(partition by product_category
order by SUM(quantity * unit_price * (1 - discount / 100.0)) desc) as within_category
from orders o
group by product_name, product_category;

--Q38 Calculate cumulative monthly revenue.

with monthly_revenue as (select date_trunc('month', order_date) AS month,
sum(quantity * unit_price * (1 - discount / 100.0)) as revenue
from orders
group by date_trunc('month', order_date))
select month,revenue as monthly_revenue,
sum(revenue)over (order by month rows between unbounded preceding and current row) as cumulative_revenue
from monthly_revenue
order by month;

--Q39 Compare monthly revenue using LAG().

with monthly_revenue as (select date_trunc('month', order_date) AS month,
sum(quantity * unit_price * (1 - discount / 100.0)) as revenue
from orders
group by date_trunc('month', order_date))
select month,revenue as monthly_revenue, lag(revenue)over(order by month)as previous_monthly_revenue
from monthly_revenue ;



--Q40 Calculate month-over-month revenue growth (%).

with monthly_revenue as (select DATE_TRUNC('month', order_date) AS month,
SUM(quantity * unit_price * (1 - discount / 100.0))as revenue
from orders
group by DATE_TRUNC('month', order_date)),
revenue_comparison as (select month,revenue,lag(revenue) over (order by month) as previous_revenue
from monthly_revenue)
select month,revenue,previous_revenue,
round(((revenue - previous_revenue)/ NULLIF(previous_revenue, 0)) * 100,2) as growth_percentage
from revenue_comparison
order by month;

--Q41 Divide customers into four spending groups using NTILE(4).

select * from customers c ;
select c.customer_name ,c.customer_id,SUM(quantity * unit_price * (1 - discount / 100.0))as revenue, 
ntile(4)over(order by SUM(quantity * unit_price * (1 - discount / 100.0))) as spending_group
from customers c 
join orders o on o.customer_id = c.customer_id 
group by c.customer_id;

--Q42 Calculate each category's share of total revenue using window functions

select distinct(product_category),SUM(quantity * unit_price * (1 - discount / 100.0)) over(partition by product_category)
from orders o ;


with category_revenue as (select distinct product_category,
SUM(quantity * unit_price * (1 - discount / 100.0))
over (partition by product_category) AS category_total
from orders)
select product_category,category_total,
ROUND(category_total /NULLIF(SUM(category_total) OVER (), 0) * 100,2) as revenue_share_percentage
from category_revenue
order by revenue_share_percentage desc;

--Section F — Advanced business intelligence
--Q44	Create a monthly_sales_summary view (month, orders, revenue, cost, profit), then select from it.
create or replace view monthly_sales_summary as
select
DATE_TRUNC('month', order_date) AS month,
COUNT(DISTINCT order_id) AS orders,
SUM(quantity * unit_price * (1 - discount / 100.0))as revenue,
SUM(quantity * cost_price) as cost,
SUM(quantity * unit_price * (1 - discount / 100.0)) - SUM(quantity * cost_price) as profit
from orders
group by DATE_TRUNC('month', order_date);

select * from monthly_sales_summary
order by month;

--Q45 Create a PL/pgSQL function that returns completed-order revenue for a supplied customer ID — show it for one customer and for an ID that does not exist (it must return 0).


CREATE OR REPLACE FUNCTION customer_revenue(p_customer_id INT)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE
    v_revenue NUMERIC;
BEGIN

    SELECT
        COALESCE(
            SUM(quantity * unit_price * (1 - discount / 100.0)),
            0
        )
    INTO v_revenue

    FROM orders

    WHERE customer_id = p_customer_id
      AND order_status = 'Completed';

    RETURN v_revenue;
END;
$$;

select customer_id, customer_name
from customers
limit 5;

select  customer_revenue(9);

--Segment customers into High, Medium and Low Value, and explain why you chose your thresholds.

select c.customer_name, SUM(quantity * unit_price * (1 - discount / 100.0)) AS total_revenue
from customers c
join orders o on c.customer_id = o.customer_id
where o.order_status = 'Completed'
group by c.customer_id, c.customer_name;

with customer_revenue as (select c.customer_id,c.customer_name,sum(quantity * unit_price * (1 - discount / 100.0)) AS total_revenue
from customers c
join orders o on c.customer_id = o.customer_id
where o.order_status = 'Completed'
group by c.customer_id, c.customer_name)
select customer_name,total_revenue,
case when total_revenue >= 200000 then 'High Value'
when total_revenue >= 50000 then 'Medium Value'
else 'Low Value'
end as customer_segment
from customer_revenue
order by total_revenue desc;

--Produce a management report: top five customers, top five products, the most profitable category, and the lowest-revenue month.
select c.customer_name,SUM(quantity * unit_price * (1 - discount / 100.0)) as total_revenue
from customers c
join orders o on c.customer_id = o.customer_id
where o.order_status = 'Completed'
group by c.customer_id, c.customer_name
order by total_revenue desc
limit 5;

select o.product_name,SUM(quantity * unit_price * (1 - discount / 100.0)) AS total_revenue
from orders o
group by o.product_name
order by total_revenue desc
limit 5;

select product_category,
sum((quantity * unit_price * (1 - discount / 100.0))- (quantity * cost_price)) as total_profit
from orders
where order_status = 'Completed'
group by product_category
order by total_profit desc
limit 1;

select month,revenue
from monthly_sales_summary
order by revenue asc 
limit 1;
