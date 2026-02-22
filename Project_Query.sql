use project;
select * from walmartsales;

-- 1. Identifying the Top Branch by Sales growth rate
select Branch, round(sum(Total), 2) as Total_Sales, 
monthname(str_to_date(Date, '%d-%m-%y')) as Month from walmartsales
group by Branch, Month 
order by Total_Sales desc ;

ALTER TABLE walmartsales 
CHANGE COLUMN `Product line` `Product_Line` 
VARCHAR(255);
ALTER TABLE walmartsales 
CHANGE COLUMN `gross income` `Gross_Income` 
VARCHAR(255);
ALTER TABLE walmartsales 
CHANGE COLUMN `Invoice Id` `Invoice_Id` 
VARCHAR(255);
 ALTER TABLE walmartsales 
CHANGE COLUMN `Customer type` `Customer_Type` 
VARCHAR(255);
ALTER TABLE walmartsales 
CHANGE COLUMN `Unit price` `Unit_Price` DOUBLE(10,2),
CHANGE COLUMN `Tax 5%` `Tax_5_percent` DOUBLE(10,10),
CHANGE COLUMN `gross margin percentage` `gross_margin_percentage` DOUBLE(15,15),
CHANGE COLUMN `Customer ID` `Customer_Id` INT(10);
alter table walmartsales modify column 
Gross_Income double;

-- 2. Finding the most profitable product line for each branch
with cte as 
(select Branch, Product_Line,
round((sum(Gross_Income)), 2) as Profit,
 rank()
 over (partition by Branch order by sum(Gross_Income) desc) as ranking
 from walmartsales 
 group by Branch, Product_Line)
 select * from cte where ranking = 1;






 -- 3. Analyzing customer segmentation based on spending
 select Customer_Id, round(sum(Total), 2) as Total_Purchase , 
 (case when sum(Total) >= 25000 then 'High Spender'
 when sum(Total) >20000 then 'Medium Spender'
 else 'Low Spender' end) as Spender_Category from walmartsales 
 group by Customer_Id
 order by Total_Purchase Desc;
 
 -- 4. Detecting Anomalies in Sales transactions
 with cte as (select Product_Line, 
 avg(Total) as Average from walmartsales
group by Product_Line)
select w.Invoice_Id, w.Product_Line,
round(w.Total, 2) as Transaction_Amount,
round(c.Average, 2) as Average, 
(case when w.Total > 1.5 *c.Average then 'High Anomaly'
when w.Total < 0.5*c.Average then 'Low Anomaly'
else 'Normal' end) as Anomaly_Type
from walmartsales as w join cte as c 
on w.Product_Line = c.Product_Line 
where
w.Total > 1.5*c.Average or 
w.Total < 0.5*c.Average order by w.Product_Line,
Transaction_Amount Desc;

-- 5. Most Popular Payment Method by City
with cte as (select City, Payment, 
count(Invoice_Id) as Order_Count
 from walmartsales group by City, Payment order by city)
select *,  dense_rank() over(partition by city
order by Order_Count desc) as ranking from cte;

-- 6.Monthly Sales distribution by gender
select monthname(str_to_date(Date, '%d-%m-%y')) as Month,
 gender, round(sum(Total),2) as Total_sales
from walmartsales group by Month , gender, 
gender order by month, Total_sales desc;
 
 -- 7. Best product line by Customer type
 select Product_Line, Customer_Type, 
 round(sum(Total), 2) as Total_Sales,
 count(Invoice_Id) as Order_count 
 from walmartsales group by Product_Line,
 Customer_Type 
 order by Product_Line, 
 Total_Sales Desc, Order_count Desc;
 
 -- 8. Identifying Repeat Customers
with customer_purchases as (
select Customer_Id, Invoice_Id, 
str_to_date(Date, '%d-%m-%y') as purchase_date
from walmartsales),
 purchase_diff as (select *, lag(purchase_date)
over(partition by Customer_Id order by purchase_date)
as prev_purchase from customer_purchases)
select Customer_Id, Invoice_id, purchase_date,
prev_purchase, datediff(purchase_date, prev_purchase) as days_between,
(case when datediff(purchase_date, prev_purchase) <= 30 
then 'Repeat Purchase'
else 'First Purchase / Not Repeat' end) as purchase_type
from purchase_diff where prev_purchase is not null
order by Customer_Id, purchase_date;

-- 9. Finding top 5 customrs by sales volume
with cte as (select Customer_Id, 
round(sum(Total), 2) as Total_Sales, 
dense_rank() over(order by round(sum(Total), 2) desc) 
as Ranking from walmartsales
group by Customer_Id )
select * from cte where ranking <=5;

-- 10. Analyzing sales trends by day of the week
select Dayname(str_to_date(Date, '%d-%m-%y')) as
Day_Of_Week, 
round(sum(Total),2) as Total_Sales from walmartsales
group by Day_Of_Week
order by Total_Sales Desc;