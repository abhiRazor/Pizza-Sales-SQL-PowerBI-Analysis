
--Total Revenue is 817860.05--

select sum(total_price) as Total_revenue from pizza_sales;

--Average order value is 38.30--

select sum(total_price)/ count(distinct(order_id)) as Average_orderValue from pizza_sales;

--Total Pizzas Sold is 49574 --

select sum(quantity) as Total_Pizzas_Sold from pizza_sales;

--Average Pizzas per Order is 2.32--

select CAST(CAST(sum(quantity) as Decimal(10,2))/ CAST(count(distinct(order_id)) as Decimal(10,2)) as Decimal(10,2)) 
as Average_Pizzas_per_Order from pizza_sales;

--Show data from the table--
select * from pizza_sales;

--weekdays wise orders--

SELECT
    TO_CHAR(order_date, 'FMDay') AS weekday,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY TO_CHAR(order_date, 'FMDay');

--monthly wise orders--

SELECT
    TO_CHAR(order_date, 'FMMonth') AS month, count(distinct(order_id)) as Total_orders
	from pizza_sales
	GROUP BY TO_CHAR(order_date,'FMMonth');

--Percentage of sales by Pizza_Category--

select pizza_category, sum(total_price)*100/(select sum(total_price) as Total_Price from pizza_sales) as Percentage_of_sales
from pizza_sales
group by pizza_category;

--Percentage of sales by Pizza size--

SELECT
    pizza_size,
    SUM(total_price) * 100.0 /
    (SELECT SUM(total_price) FROM pizza_sales) AS percentage_of_sales
FROM pizza_sales
GROUP BY pizza_size;



	