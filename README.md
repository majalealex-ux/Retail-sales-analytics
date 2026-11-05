# Duka Smart Electronics – Retail Analytics Project
# Duka Smart Electronics 


## 1. Project Overview

Duka Smart Electronics is a growing Kenyan electronics retailer operating across ten towns: Nairobi, Mombasa, Kisumu, Nakuru, Eldoret, Thika, Nyeri, Meru, Machakos and Kiambu.

This project uses PostgreSQL to analyse the company's retail sales data and generate insights that can support business decision-making.

The analysis covers customer purchasing behaviour, product performance, category profitability, monthly sales trends, order cancellations and customer inactivity.

**Project category:** Data Analytics  
**Technology:** PostgreSQL  
**Database client:** DBeaver  
**Dataset:** 150 customers and 800 orders  
**Level:** Beginner to Advanced

## 2. Business Problem

As the business grows, management needs a clearer understanding of its sales performance, customer value and product profitability.

Without structured analysis, it may be difficult to identify high-value customers, recognise products contributing to revenue, investigate cancellations and identify customers whose purchasing activity has declined.

This project addresses these challenges through SQL-based analysis and business recommendations.

## 3. Project Objectives

The main objectives were to:

- Analyse customer purchasing behaviour and spending patterns.
- Segment customers based on completed-order revenue.
- Identify the highest-revenue products.
- Evaluate revenue, costs, profit and profit margins across product categories.
- Analyse monthly sales performance and revenue growth.
- Identify customers with declining purchasing activity.
- Measure the order cancellation rate.
- Apply advanced SQL techniques to answer business questions.
- Develop actionable recommendations for management.

## 4. Tools and Technologies

| Tool | Purpose |
|---|---|
| PostgreSQL | Database management and SQL analysis |
| DBeaver | SQL development and database interaction |
| GitHub | Project documentation and version control |
| Markdown | Project documentation and business insights |

## 5. Database Structure

The project uses a PostgreSQL database organised under the `retail_analytics` schema.

The analysis primarily uses two tables:

- **customers:** Contains customer information, including customer IDs, names, locations and customer segments.
- **orders:** Contains order information, including order dates, products, quantities, prices, costs, discounts and order statuses.

The tables are joined using `customer_id` to analyse customer-level purchasing behaviour.

## 6. Analysis and SQL Techniques

The project contains 46 SQL business questions covering different levels of SQL proficiency.

### A. Basic SQL Queries

- Data retrieval using `SELECT`.
- Filtering records using `WHERE`.
- Sorting results using `ORDER BY`.
- Pattern matching using `LIKE`.
- Range filtering using `BETWEEN`.
- Filtering specific order statuses and payment methods.

### B. Aggregations and Calculations

- `COUNT()`, `SUM()`, `AVG()`, `MIN()` and `MAX()`.
- Revenue and cost calculations.
- Profit and profit margin calculations.
- Grouping results using `GROUP BY`.
- Filtering aggregated results using `HAVING`.

### C. Joins and Customer Analysis

- `INNER JOIN` and `LEFT JOIN`.
- Customer spending analysis.
- Revenue by customer location.
- Customer purchasing frequency.
- Customer spending by segment.
- Identifying customers without matching order records.

### D. Subqueries and Common Table Expressions

- Common Table Expressions (CTEs).
- Scalar and correlated subqueries.
- Average spending comparisons.
- Product and customer performance analysis.
- Identifying potentially inactive customers.

### E. Window Functions

- `RANK()`.
- `ROW_NUMBER()`.
- `DENSE_RANK()`.
- `NTILE()`.
- `SUM() OVER()` for cumulative revenue.
- `LAG()` for month-over-month comparisons.
- Revenue contribution and category ranking.

### F. Database Objects and Business Reporting

- Creating a reusable monthly sales summary view.
- Developing a customer revenue function using PL/pgSQL.
- Customer segmentation.
- Preparing a management-oriented business report.

## 7. Business Metrics and Methodology

The project uses the following calculations:

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
revenue - total_cost
```

**Profit margin**

```sql
(profit / NULLIF(revenue, 0)) * 100
```

For realised sales and customer revenue analysis, the project uses orders with the status `Completed`. Order cancellation analysis uses all recorded orders so that cancelled orders remain part of the denominator.

Customer inactivity is measured by comparing a customer's latest completed order date with the latest order date in the dataset. A customer is classified as potentially inactive when the difference exceeds 90 days.

Customer segmentation uses the following initial revenue thresholds:

| Segment | Completed-Order Revenue |
|---|---|
| High Value | KSh 200,000 and above |
| Medium Value | KSh 50,000 to below KSh 200,000 |
| Low Value | Below KSh 50,000 |

These thresholds are initial business rules and may require adjustment based on actual customer revenue distributions.

## 8. Key Business Findings

The corrected analysis produced the following findings:

### Customer Analytics

- Brian Chebet was the highest-spending customer, with completed-order revenue of KSh 848,118.75.
- The five highest-spending customers were identified through completed-order revenue analysis.
- Customer segmentation classified 132 customers: 39 High Value, 53 Medium Value and 40 Low Value.
- 47 customers met the project's 90-day inactivity condition.

### Product Performance

The five highest-revenue products based on completed orders were:

| Rank | Product | Revenue (KSh) |
|---:|---|---:|
| 1 | iPhone 13 | 3,766,458.15 |
| 2 | HP 250 G9 Laptop | 2,510,510.15 |
| 3 | Hotpoint Refrigerator | 2,386,956.60 |
| 4 | Lenovo IdeaPad 3 | 2,032,875.00 |
| 5 | Samsung 55in Smart TV | 1,831,977.10 |

### Category Profitability

- Accessories recorded the highest profit margin at **42.39%**.
- Mobile Phones generated the highest total profit at **KSh 728,760.65**.
- Category profitability analysis highlighted differences between total profit and profit margin.

### Order Cancellations

- 90 of the 800 recorded orders were cancelled.
- The overall cancellation rate was **11.25%**.

## 9. Key Recommendations

Based on the analysis, the following actions are recommended:

1. **Customer retention:** Develop targeted retention initiatives for high-value customers and re-engagement campaigns for potentially inactive customers.
2. **Customer growth:** Encourage medium-value customers to increase their purchasing activity through relevant offers and loyalty initiatives.
3. **Product management:** Monitor demand for high-revenue products and consider product-level profitability when planning stock replenishment.
4. **Profitability:** Investigate the factors contributing to the high Accessories profit margin and evaluate opportunities to grow this category.
5. **Order fulfilment:** Investigate cancellation patterns to identify possible issues involving stock availability, payments and delivery.
6. **Performance monitoring:** Regularly monitor revenue, profit margins, customer segments and cancellation rates to support informed decisions.

## 10. Project Deliverables

The project includes:

- PostgreSQL SQL scripts containing the business questions and analysis.
- `README.md` – project overview, methodology, tools and key findings.
- `insights.md` – detailed business insights and management recommendations.
- Monthly sales summary view.
- Customer revenue function.

## 11. Limitations

- The analysis is based on the available dataset and may not capture all factors affecting business performance.
- Customer inactivity is measured relative to the latest date in the dataset rather than the actual current date.
- The 90-day inactivity measure is an analytical classification and does not necessarily mean a customer has permanently stopped purchasing.
- Customers without completed orders are excluded from the completed-order customer segmentation and the inactivity query.
- Customer segment thresholds were selected for the exercise and should be reviewed before being used as permanent business rules.
- Cancellation analysis identifies the cancellation rate but does not independently establish the causes of cancellations.

## 12. Conclusion

The Duka Smart Electronics Retail Analytics Project demonstrates the application of PostgreSQL to practical retail business problems.

By combining data retrieval, aggregations, joins, CTEs, subqueries, window functions and database objects, the project transforms raw transaction data into structured business information.

The findings provide management with a basis for evaluating customer value, product performance, profitability and order cancellations.

The project also demonstrates how SQL can support evidence-based decision-making and the development of actionable business recommendations.
This project demonstrates the practical application of PostgreSQL in solving retail business problems.
It progresses from basic data retrieval and aggregation to advanced SQL techniques, reusable database objects and management reporting.
