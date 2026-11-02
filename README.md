# Duka Smart Electronics 

## 1. Project Overview

Duka Smart Electronics is a growing Kenyan electronics retailer operating across ten towns: Nairobi, Mombasa, Kisumu, Nakuru, Eldoret, Thika, Nyeri, Meru, Machakos and Kiambu.
The business has maintained transactional records since January 2025 but has not previously conducted a structured analysis of its retail data.
This project simulates the work of a Junior Data Analyst tasked with transforming the retailer's transactional data into meaningful business insights using PostgreSQL.
The analysis investigates customer purchasing behaviour, product performance, sales trends, profitability and customer inactivity to support evidence-based management decisions.

## 2. Business Problem

Management wants answers to five important business questions:

1. Who are the retailer's most valuable customers?
2. Which products generate the most revenue and profit?
3. Are sales growing over time?
4. Which customers have stopped purchasing?
5. What actions can management take to improve business performance?

The project uses SQL to investigate these questions and produce a management-oriented analysis.

## 3. Project Objectives

- Retrieve and explore customer and order records.
- Analyse customer spending and purchasing behaviour.
- Identify high-spending customers and customer segments.
- Evaluate product and category revenue.
- Calculate product category costs, profit and profit margins.
- Examine monthly sales performance and revenue growth.
- Identify customers whose latest completed orders are more than 90 days before the latest order date in the dataset.
- Develop reusable SQL reporting objects.
- Translate analytical findings into actionable recommendations.

## 4. Dataset and Database Structure

The project uses two primary relational tables:

| Table | Description |
|---|---|
| `customers` | Customer records, including customer identifiers, names, cities, segments and registration dates. |
| `orders` | Transactional records, including order identifiers, customer identifiers, products, categories, quantities, prices, discounts, costs, dates, payment methods and order statuses. |

## 5. Tools and Technologies

- PostgreSQL — relational database management and SQL analysis.
- DBeaver Community Edition — database connection, query execution and result inspection.
- GitHub — project documentation and version control.

## 6. Analytical Approach

The project is organised into six learning and analysis areas.

### Section A: SQL Fundamentals
- Retrieving records using SELECT.
- Filtering data using WHERE.
- Sorting records using ORDER BY.
- Removing duplicates using DISTINCT.
- Pattern matching using LIKE.
- Filtering ranges using BETWEEN.
- Limiting query results using LIMIT.

### Section B: Aggregation and Grouping
- Counting customers and orders.
- Calculating revenue and average order value.
- Identifying minimum and maximum product prices.
- Calculating revenue by category and customer city.
- Measuring product quantities sold.
- Applying GROUP BY and HAVING.

### Section C: Joins and Customer Analytics
- Combining customer and order records.
- Calculating customer spending.
- Identifying customers who have never ordered.
- Ranking high-spending customers.
- Analysing revenue by customer city and segment.
- Investigating purchasing preferences among VIP customers.

### Section D: Subqueries and Common Table Expressions
- Comparing customer spending against average spending.
- Identifying products priced above the overall average.
- Finding the highest-revenue months.
- Identifying customers purchasing across multiple categories.
- Calculating category revenue, cost, profit and profit margin.
- Investigating customer inactivity using order dates.

### Section E: Window Functions
- RANK() for customer ranking.
- ROW_NUMBER() for ordering transactions by recency.
- DENSE_RANK() for product ranking within categories.
- SUM() OVER() for cumulative monthly revenue.
- LAG() for month-to-month comparisons.
- NTILE(4) for customer spending groups.
- Window calculations for category revenue contribution.

### Section F: Advanced Business Intelligence
- Creating a monthly sales summary VIEW.
- Developing a PL/pgSQL customer revenue function.
- Segmenting customers using CASE WHEN.
- Producing a management report covering customers, products, profitability and monthly sales.

## 7. Key Business Calculations

**Revenue after discounts**

```sql
quantity * unit_price * (1 - discount / 100.0)
```

**Total cost**

```sql
quantity * cost_price
```

**Profit**

```sql
revenue - cost
```

**Profit margin**

```sql
(profit / NULLIF(revenue, 0)) * 100
```

**Month-over-month revenue growth**

```sql
((current_revenue - previous_revenue)
 / NULLIF(previous_revenue, 0)) * 100
```

## 8. Reusable SQL Objects

### Monthly Sales Summary View

`monthly_sales_summary` provides a reusable monthly reporting structure containing:

- Month
- Number of unique orders
- Revenue
- Cost
- Profit

### Customer Revenue Function

`customer_revenue(p_customer_id)` is a PostgreSQL PL/pgSQL function that calculates completed-order revenue for a supplied customer ID.

It uses COALESCE() to return zero when no matching completed-order revenue exists.

## 9. Project Deliverables

- `Retail_analytics_Queries.sql` — SQL solutions and analytical queries.
- `README.md` — Project overview, objectives, methodology and technical documentation.
- `insights.md` — Business findings, interpretations and recommendations.

## 10. Expected Business Value

The analysis provides a foundation for:

- Improving customer retention.
- Identifying valuable customer relationships.
- Prioritising profitable products and categories.
- Monitoring monthly sales performance.
- Investigating periods of declining revenue.
- Supporting data-driven inventory and sales decisions.

## 11. Limitations

- The analysis is based on the available historical dataset.
- Customer segmentation thresholds are illustrative and require validation against the actual customer revenue distribution.
- Historical sales performance does not guarantee future performance.
- Customer inactivity is assessed relative to the latest order date in the dataset, not the current calendar date.
- Revenue and profitability comparisons require consistent order-status filtering.

## 12. Conclusion

This project demonstrates the practical application of PostgreSQL in solving retail business problems.

It progresses from basic data retrieval and aggregation to advanced SQL techniques, reusable database objects and management reporting.

The overall objective is to demonstrate how SQL can transform transactional data into information that supports business analysis and management decision-making.