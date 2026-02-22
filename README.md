# Walmart Sales Analysis using Advanced SQL

## 📊 Project Overview
This project performs comprehensive business analysis on Walmart sales data using MySQL.  
The objective is to extract meaningful insights related to sales performance, customer behavior, profitability, and transaction trends.

The analysis focuses on solving real-world business problems using SQL queries.

---

## 🎯 Objectives

- Identify top-performing branches
- Analyze monthly sales trends
- Find the most profitable product lines
- Segment customers based on spending behavior
- Detect sales anomalies
- Identify repeat customers
- Analyze payment method popularity
- Evaluate weekly sales trends

---

## 🛠️ Tools & Technologies

- MySQL
- SQL (CTEs, Window Functions, Aggregations)
- Date Functions
- Ranking Functions

---

## 🔎 Business Problems Solved

### 1️⃣ Top Branch by Sales Growth
Analyzed branch-level monthly sales performance using date conversion and aggregation techniques.

### 2️⃣ Most Profitable Product Line per Branch
Used CTEs and RANK() window function to determine the highest profit-generating product line in each branch.

### 3️⃣ Customer Segmentation
Segmented customers into High, Medium, and Low spenders based on total purchase value.

### 4️⃣ Sales Anomaly Detection
Identified unusually high or low product line sales using threshold-based comparison against average sales.

### 5️⃣ Most Popular Payment Method by City
Analyzed transaction data to determine preferred payment methods in different cities.

### 6️⃣ Monthly Sales Distribution by Gender
Evaluated gender-based purchasing trends on a monthly basis.

### 7️⃣ Best Product Line by Customer Type
Used ranking functions to determine which customer type prefers each product line the most.

### 8️⃣ Identifying Repeat Customers
Used LAG() window function and DATEDIFF() to identify customers making repeat purchases within 30 days.

### 9️⃣ Top 5 Customers by Sales Volume
Ranked customers based on total purchase amount.

### 🔟 Sales Trends by Day of Week
Analyzed weekly sales patterns to identify high-performing days.

---

## 📈 Key Insights

- Certain branches outperform others in monthly revenue.
- Specific product lines consistently generate higher profit margins.
- A small group of customers contributes significantly to total revenue.
- Payment method preferences vary across cities.
- Repeat purchase behavior highlights customer retention patterns.

---

## 💼 Business Impact

This analysis helps retail businesses:

- Optimize branch performance
- Target high-value customers
- Improve retention strategies
- Identify underperforming product lines
- Support data-driven decision making

---

## 📌 Conclusion

This project demonstrates the practical application of SQL for real-world business analytics.  
It highlights proficiency in aggregations, window functions, CTEs, and analytical thinking for solving business problems using structured data.
