# Duka Smart Electronics
## Retail Analytics – Business Insights Report

## 1. Executive Summary

This report presents the findings of a retail analytics project conducted for Duka Smart Electronics, a Kenyan electronics retailer operating across ten towns.

Using PostgreSQL, the analysis investigates customer spending, customer segmentation, product performance, category profitability, order cancellations and customer inactivity.

The analysis produced three important findings:

- Accessories recorded the highest profit margin at **42.39%**.
- The overall order cancellation rate was **11.25%**, representing 90 cancelled orders out of 800.
- **47 customers** had not placed a completed order within the 90-day inactivity threshold used in the analysis.

These findings provide management with opportunities to improve profitability, investigate order cancellations and strengthen customer retention.

## 2. Customer Analytics

### 2.1 Customer Spending

Customer spending was calculated by aggregating completed-order revenue after discounts. The analysis also identified the highest-spending customers.

**Findings**

The five highest-spending customers were:

| Rank | Customer | Total Revenue (KSh) |
|---:|---|---:|
| 1 | Brian Chebet | 848,118.75 |
| 2 | Peter Ndungu | 790,229.50 |
| 3 | Lucy Njoroge | 767,880.80 |
| 4 | Nancy Korir | 702,545.75 |
| 5 | Purity Ochieng | 698,921.60 |

Brian Chebet was the highest-spending customer, with completed-order revenue of KSh 848,118.75.

**Business Interpretation**

High-spending customers represent an important source of business revenue. Understanding their purchasing behaviour can help management develop strategies to maintain customer loyalty and encourage repeat purchases.

**Recommendations**

- Develop targeted retention initiatives for high-spending customers.
- Monitor purchasing frequency and changes in customer spending.
- Introduce loyalty incentives that encourage repeat purchases.
- Avoid relying exclusively on a small group of high-spending customers for revenue generation.

### 2.2 Customer Segmentation

Customers were classified into three groups using completed-order revenue.

| Segment | Revenue Threshold |
|---|---|
| High Value | KSh 200,000 and above |
| Medium Value | KSh 50,000 to below KSh 200,000 |
| Low Value | Below KSh 50,000 |

These thresholds were selected as initial business classification rules for the exercise. They should be reviewed against the actual revenue distribution before being adopted as permanent management policy.

**Findings**

| Customer Segment | Number of Customers |
|---|---:|
| High Value | 39 |
| Medium Value | 53 |
| Low Value | 40 |
| **Total classified** | **132** |

The segmentation analysis classified 132 customers with at least one completed order. The remaining 18 customers were not included in the segmentation results because the query only considered customers with completed orders.

**Business Interpretation**

Customer segmentation provides management with a structured way to understand customer value and allocate retention efforts.

High-value customers may require stronger retention strategies, while medium-value customers may offer opportunities for increased spending. Low-value customers may require further investigation to understand their purchasing frequency and potential for growth.

**Recommendations**

- Develop retention initiatives for high-value customers.
- Introduce targeted offers to encourage medium-value customers to increase purchasing activity.
- Investigate the purchasing patterns of low-value customers.
- Review customers without completed orders to understand whether they represent lost sales opportunities.
- Monitor changes in customer segments over time.

### 2.3 Customer Inactivity

Customer inactivity was assessed by comparing each customer's latest completed order date against the latest order date in the dataset.

Customers whose latest completed order was more than 90 days before the dataset's latest order date were classified as potentially inactive.

**Finding**

The analysis identified **47 customers** whose last completed order was more than 90 days before the latest dataset order date.

**Business Interpretation**

A group of customers has not made a recent completed purchase. This may indicate declining purchasing activity and potential customer attrition.

The finding provides an opportunity for management to investigate customer engagement and identify customers who may benefit from reactivation initiatives.

**Recommendations**

- Introduce targeted re-engagement campaigns for potentially inactive customers.
- Investigate previous purchasing behaviour to understand why customers may have stopped buying.
- Offer relevant promotions to encourage repeat purchases.
- Monitor customer inactivity regularly.

*Note: The inactivity query excludes customers who have never placed a completed order. Therefore, the figure of 47 represents customers meeting the specified inactivity condition among customers with at least one completed order.*

## 3. Product Performance Analysis

### 3.1 Top Five Products by Revenue

Products were ranked according to revenue after discounts, using completed orders only.

**Findings**

| Rank | Product | Revenue (KSh) |
|---:|---|---:|
| 1 | iPhone 13 | 3,766,458.15 |
| 2 | HP 250 G9 Laptop | 2,510,510.15 |
| 3 | Hotpoint Refrigerator | 2,386,956.60 |
| 4 | Lenovo IdeaPad 3 | 2,032,875.00 |
| 5 | Samsung 55in Smart TV | 1,831,977.10 |

The iPhone 13 generated the highest revenue among the five products, followed by the HP 250 G9 Laptop.

**Business Interpretation**

The top five products identify items that contribute significantly to completed-order sales.

However, high revenue does not necessarily mean high profitability. Product costs and discount levels should also be considered when evaluating product performance.

**Recommendations**

- Monitor demand for top-performing products.
- Evaluate product-level profit margins alongside revenue.
- Review discount strategies to avoid unnecessary reductions in profitability.
- Consider demand patterns when planning stock replenishment.

## 4. Category Revenue and Profitability

### 4.1 Category Profitability

Profit was calculated by subtracting product costs from revenue after discounts.

Profit margin was calculated as profit divided by revenue, multiplied by 100.

**Findings**

The corrected analysis produced the following results for completed orders:

| Product Category | Revenue (KSh) | Profit (KSh) | Profit Margin |
|---|---:|---:|---:|
| Accessories | 1,077,496.10 | 456,746.10 | 42.39% |
| Home Appliances | 4,024,234.05 | 458,034.05 | 11.38% |
| Computing | 6,596,221.70 | 700,021.70 | 10.61% |
| Mobile Phones | 6,942,060.65 | 728,760.65 | 10.50% |
| Electronics | 5,515,359.20 | 547,359.20 | 9.92% |

Mobile Phones generated the highest total profit at KSh 728,760.65, while Accessories recorded the highest profit margin at 42.39%.

**Business Interpretation**

The results demonstrate the difference between total profit and profit margin.

Mobile Phones generated the largest total profit, reflecting its substantial revenue contribution. Accessories, despite generating lower total revenue, achieved a considerably higher profit margin than the other categories.

Accessories therefore represents an important category for profitability, while Mobile Phones remains a major contributor to total profit.

**Recommendations**

- Maintain adequate stock levels for profitable, high-demand categories.
- Investigate the factors contributing to the high Accessories profit margin.
- Explore opportunities to increase Accessories sales without compromising margins.
- Review the pricing and cost structures of categories with lower profit margins.
- Evaluate both total profit and profit margin when making product investment decisions.

### 4.2 Order Cancellations

Order cancellations were assessed by comparing the number of cancelled orders against all recorded orders.

**Findings**

| Metric | Result |
|---|---:|
| Total Orders | 800 |
| Cancelled Orders | 90 |
| Cancellation Rate | 11.25% |

**Business Interpretation**

The analysis identified an order cancellation rate of 11.25%. This means that approximately one in every nine recorded orders was cancelled.

A high cancellation rate may indicate potential issues involving product availability, payment processing, delivery arrangements or customer purchasing decisions. Further investigation is required to establish the actual causes.

**Recommendations**

- Investigate cancellation patterns by product category and location.
- Review stock availability and order fulfilment processes.
- Examine payment and delivery-related cancellation issues.
- Monitor cancellation rates regularly to assess the effectiveness of corrective measures.

## 5. Conclusion

The Duka Smart Electronics Retail Analytics Project demonstrates how PostgreSQL can be used to investigate business performance and answer practical management questions.

Through customer analytics, product performance analysis, profitability calculations, window functions, customer inactivity assessment and order cancellation analysis, the project establishes a foundation for evidence-based decision-making.

The findings highlight three important management priorities: improving customer retention, investigating order cancellations and making informed product profitability decisions.

In particular, the high profit margin recorded by Accessories presents an opportunity for further business evaluation, while the cancellation and inactivity findings indicate areas requiring management attention.

Overall, the analysis demonstrates the importance of looking beyond total sales revenue to understand customer value, profitability and purchasing behaviour.