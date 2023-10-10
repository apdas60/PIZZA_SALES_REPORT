SELECT * FROM pizza.pizza_sales;
#1- Total Revinue?  ans=817860.049999993
select sum(total_price) as total_Ravinue from  pizza.pizza_sales;

#2-Avarage order values?
select sum(total_price)/count(distinct order_id ) avg_Order from pizza.pizza_sales;

#3-Total Pizza Sold?
 select sum(quantity) total_pizza_sold from pizza.pizza_sales;
 
 #4-Total Order?
 select count(distinct order_id) from  pizza.pizza_sales;
 
 #5- Average pizza per order?
 select cast(sum(quantity)/ count(distinct order_id) as decimal(10,2))  as avg_per_order from  pizza.pizza_sales;
 
 # FOR CHART
 #1. Daily Traind For Total Order?
 select dayname(order_date) order_day , count(distinct order_id) Total_order from pizza.pizza_sales
 group by dayname(order_date);
 
 select * from information_schema.columns
 where table_name= 'pizza_sales';
 
 update pizza.pizza_sales
 set order_date=str_to_date(order_date,"%d-%m-%Y");
 
 #2- Monthly Trend For Total Order?
 
 select monthname(order_date) as month_name, count(distinct order_id) total_order from  pizza.pizza_sales
 group by monthname(order_date)
 order by total_order desc;

#3-Percentage of sale by Pizza Catagory?

select pizza_category,sum(total_price) total_sale_cate, sum(total_price)*100/(select sum(total_price) from pizza.pizza_sales
where month(order_date)=1) PSP 
from  pizza.pizza_sales
where month(order_date)=1
group by pizza_category;

#4- Percentage Of sale of pizza size?

select pizza_size,cast(sum(total_price) as decimal(10,3)) total_sale_cate, cast(sum(total_price)*100/(select sum(total_price) from pizza.pizza_sales
where month(order_date)=1) as decimal(10,3)) PSP 
from  pizza.pizza_sales
group by pizza_size;
 
#5-Top 5 best saler by revenue.Total quantity and total order?

select * from  pizza.pizza_sales;
select pizza_name,cast(sum(total_price) as decimal(10,2)) total_revenue  from  pizza.pizza_sales
group by pizza_name
order by total_revenue desc
limit 5;

#6-Bottom 5 best saler by revenue.Total quantity and total order?

select pizza_name,cast(sum(total_price) as decimal(10,2)) total_revenue  from  pizza.pizza_sales
group by pizza_name
order by total_revenue asc
limit 5;

#7-Top 5 Pizza by Quantity
select * from pizza.pizza_sales;

select  pizza_name,sum(quantity) total_quantity from pizza.pizza_sales
group by pizza_name
order by total_quantity desc
limit 5;