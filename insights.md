# Duka Smart Electronics 
## 1. Executive Summary
This report presents the findings of a retail analytics project conducted for Duka Smart Electronics, a Kenyan electronics retailer operating across ten towns.
Using PostgreSQL, the analysis investigates customer spending, product performance, category profitability, monthly revenue trends and customer inactivity.
The purpose is to help management understand business performance and identify opportunities for improved customer retention, revenue generation and profitability.

## 2. Customer Analytics

### 2.1 Customer Spending

Customer spending was calculated by aggregating transaction revenue after discounts.
The analysis also identified the ten highest-spending customers.

**Findings**

- Top-spending customer: Brian Chebet
- Total spending: KSh 848118.75
- Top five customers: 
customer | Total_revenue
------ | --------
Brian Chebet|	848118.75
Peter Ndungu|	790229.50
Lucy Njoroge|	767880.80
Nancy Korir|	702545.75
Purity Ochieng|	698921.60

### 2.2 Customer Segmentation

Customers were classified into three groups using completed-order revenue.

| Segment | Revenue threshold |
|---|---|
| High Value | KSh 200,000 and above |
| Medium Value | KSh 50,000 to below KSh 200,000 |
| Low Value | Below KSh 50,000 |

These thresholds were selected as initial business classification rules for the exercise. They should be reviewed against the actual revenue distribution before being adopted as permanent management policy.

**Findings**

- High-value customers: 39
- Medium-value customers: 54
- Low-value customers: 40

**Business interpretation**

Customer segmentation provides management with a structured way to understand customer value and allocate retention efforts.
High-value customers may require stronger retention strategies, while medium-value customers may offer opportunities for increased spending.

**Recommendations**

- Develop retention initiatives for high-value customers.
- Introduce targeted offers to encourage medium-value customers to increase purchasing activity.
- Investigate the purchasing patterns of low-value customers.
- Monitor changes in customer segments over time.


## 3. Product Performance Analysis

### 3.1 Top Five Products by Revenue

Products were ranked according to total revenue after discounts.

| Rank | Product | Revenue |
|---|---|---:|
| 1 | iPhone 13 | KSh 4931945.20 |
| 2 | HP 250 G9 Laptop | 3313747.40 |
| 3 | Lenovo IdeaPad 3| KSh 2711475.0 |
| 4 | Hotpoint Refrigerator | KSh 2642701.95 |
| 5 | Samsung 55in Smart TV  | KSh 2467969.15 |

**Business interpretation**

The top five products identify products generating the highest sales revenue.

**Recommendations**

- Monitor demand for top-performing products.
- Evaluate product-level profit margins.
- Review discount strategies.
- Consider demand when planning stock replenishment.

## 4. Category Revenue and Profitability

### 4.1 Category Profitability

Profit was calculated by subtracting product costs from revenue after discounts.

The analysis ranked categories according to total profit.

**Findings**

- Most profitable category: Mobile Phones
- Total profit: KSh 728760.65

## 5. Conclusion

The Duka Smart Electronics Retail Analytics Project demonstrates how PostgreSQL can be used to investigate business performance and answer practical management questions.
Through customer analytics, product analysis, profitability calculations, window functions and reusable SQL objects, the project establishes a foundation for evidence-based decision-making.
The analysis highlights the importance of looking beyond total sales revenue to understand customer value, profitability and purchasing behaviour.
