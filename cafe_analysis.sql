CREATE DATABASE CAFE;
USE CAFE;
CREATE TABLE sales(	Transaction_ID varchar(50),Item varchar(50),Quantity float,Price_Per_Unit float,Total_Spent float,Payment_Method varchar(50),Location varchar(50),Transaction_Date datetime)
select * from sales limit 10 ;
select Item , sum(Quantity) from sales group by Item limit 5;
select sum(Total_Spent) as avg_revenue from sales ;
SELECT 
    DATE_FORMAT(Transaction_Date, '%Y-%b') AS Month, 
    SUM(Total_Spent) AS Monthly_Revenue,
    COUNT(Transaction_ID) AS Number_of_Sales
FROM sales
WHERE Transaction_Date IS NOT NULL 
GROUP BY Month
ORDER BY Number_of_Sales DESC ;
select distinct Payment_Method,count(Transaction_ID) as mostly_used from sales where Transaction_ID !='UNKNOWN' group by Payment_Method order by mostly_used desc;
select Location,count(Item) as count from sales group by location order by count desc ;
select  Item , count(Quantity) as most_quantity from sales group by Item order by most_quantity desc ;
select distinct Location , count(Item)  from sales group by Location order by count(Item) desc; 
select Item,sum(Total_spent) as revenue from sales group by Item order by revenue desc;
select Item from sales where Location = 'In-store';
select Location ,count(Total_spent)as rev_fromloc from sales group by Location order by rev_fromloc desc;
select distinct Item, max( Price_Per_Unit) as costlyitem from sales group by Item  order by costlyitem desc;
select  Payment_Method, max(Location) as paymentonloc from sales group by Payment_Method order by paymentonloc desc;
