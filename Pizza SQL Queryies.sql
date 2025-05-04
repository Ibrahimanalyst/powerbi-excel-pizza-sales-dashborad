select * from pizza_sales;


SELECT Sum(total_price) as Total_Revenue from pizza_sales;


Select (sum(total_price) / count(distinct order_id)) as Avarage_Order_Value from pizza_sales;


SELECT SUM(quantity) as Total_Pizza_Sold from pizza_sales;


SELECT count(distinct order_id) as Total_Orders from pizza_sales;


SELECT cast(SUM(quantity)  / 
COUNT(DISTINCT order_id) as decimal (10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales;



select dayname(order_date) from pizza_sales;


Select order_date,
STR_TO_DATE(order_date, '%d-%m-%Y') from pizza_sales;

update pizza_sales
set order_date = STR_TO_DATE(order_date, '%d-%m-%Y');

select dayname(order_date) as Order_Day, count(distinct order_id) as Total_Orders
from pizza_sales
group by dayname(order_date)
;


select extract(hour from order_time) as Order_Hours, count(distinct order_id)as Total_Orders
from pizza_sales
group by extract(hour from order_time)
order by Order_Hours;



##%of Sales by Pizza Category##

SELECT pizza_category, sum(total_price) as Total_Sales, sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as PCT
from pizza_sales
group by pizza_category;


##%of Sales by Pizza Category in January##

SELECT pizza_category, sum(total_price) as Total_Sales, sum(total_price) * 100 / (select sum(total_price) from pizza_sales where month(order_date) = 1) as PCT
from pizza_sales
where month(order_date) = 1
group by pizza_category;

##% of Sales by Pizza Size##

select pizza_size, cast(sum(total_price)as decimal (10,2)) as Total_Sales, cast(sum(total_price) * 100 / (Select sum(total_price) from pizza_sales where extract(quarter from order_date) = 1) as decimal (10,2)) as PCT
from pizza_sales
where extract(quarter from order_date) = 1
group by pizza_size
order by Total_Sales Desc
;

##Total Pizzas Sold by Pizza Category##

Select pizza_category, sum(quantity)
from pizza_sales
group by pizza_category;

##Top 5 Best Sellers by Total Pizzas Sold##

select pizza_name , count(quantity)
from pizza_sales
group by pizza_name
order by count(quantity) desc
limit 5
;

##Top 5 Worst Sellers by Total Pizzas Sold##

select pizza_name , count(quantity)
from pizza_sales
group by pizza_name
order by count(quantity) asc
limit 5
;
