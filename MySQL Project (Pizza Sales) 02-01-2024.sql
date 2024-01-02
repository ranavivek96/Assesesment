/*  ========================================================================    */
							-- Project #4 --
					-- Databse Queries using MySQL --
/*  ========================================================================    */
                  -- Submitted by: Rana Vivekkumar R. --
						-- Course: Data Science --
/*  ========================================================================    */
					/* Problem Statement Pizza Sales */
/*  ========================================================================    */
-- Questions to Solve:
-- 1. Show Total Revenue. 
-- 2. Show Average Order Value. 
-- 3. Show Total Pizzas Sold.
-- 4. Show Total Orders.
-- 5. Show Average Pizza Per Order.
-- 6. Show Daily trend for total Orders. 
-- Identify any patterns or fluctuations in order volumes on a daily basis.
-- 7. Show Monthly Trend for Total Orders. 
-- Identify peak hours or periods of high order activity.
-- 8. Show Percentage of Sales by Pizza Category. 
-- Identify that popularity of various pizza categories and their contribution to overall sales.
-- 9. Show Percentage of Sales by Pizza Size. 
-- Understand customer preferences for pizza sizes and their impact on sales.
-- 10. Show Total Pizza Sold by Pizza Category. 
-- Compare the sales performance of different pizza categories.
-- 11. Show Top 5 Best Sellers by Revenue, Total Quantity and Total Orders. 
-- Identify the most popular pizza options.
-- 12. Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders.
-- Identify underperforming or less popular pizza options.

/*  ===========================  ANSWERS  ===========================    */

Create database Pizza_sales;	
use Pizza_sales;
select * from pizza_sales;

-- 1. Show Total Revenue. 
select sum(total_price) as "Total Revenue" 
from pizza_sales;

-- 2. Show Average Order Value. 
select sum(total_price)/count(order_id) as "Average Order Value" 
from pizza_sales;

-- 3. Show Total Pizzas Sold.
select sum(quantity) as "Total Pizzas Sold" 
from pizza_sales;

-- 4. Show Total Orders. 
select count(order_id) as "Total Orders" 
from pizza_sales;

-- 5. Show Average Pizza Per Order. 
select sum(quantity)/count(order_id) as "Average Pizza Per Order" 
from pizza_sales;

-- 6. Show Daily trend for total Orders. 
-- Identify any patterns or fluctuations in order volumes on a daily basis.
select count(order_id) as "Order per Day", 
		order_date as "Order Date" 
        from pizza_sales
        group by order_date;

-- 7. Show Monthly Trend for Total Orders. 
-- Identify peak hours or periods of high order activity.
select count(order_id) as "Customer Orders", 
		order_time as "Order Time", 
        order_date as "Order Date" 
        from pizza_sales
        group by order_time, order_date;

-- 8. Show Percentage of Sales by Pizza Category. 
-- Identify that popularity of various pizza categories and their contribution to overall sales.
select substr(avg(total_price), 1,5) as "Percentage of Sales",
		count(quantity) as "No. of Pizza's", 
		pizza_category as "Pizza Category" 
        from pizza_sales
        group by pizza_category;

-- 9. Show Percentage of Sales by Pizza Size. 
-- Understand customer preferences for pizza sizes and their impact on sales.
select substr(avg(total_price), 1,5) as "Percentage of Sales(%)",
		count(quantity) as "No. of Pizza's", 
		pizza_size as "Pizza Size" 
        from pizza_sales
        group by pizza_size;

-- 10. Show Total Pizza Sold by Pizza Category. 
-- Compare the sales performance of different pizza categories.
select count(quantity) as "Total Pizza Sold", 
		pizza_category as "Pizza Category" 
        from pizza_sales
        group by pizza_category;

-- 11. Show Top 5 Best Sellers by Revenue, Total Quantity and Total Orders. 
-- Identify the most popular pizza options.
select pizza_name as "Pizza Name",sum(total_price) as "Revenue" from pizza_sales group by pizza_name order by sum(total_price) desc limit 5;
select pizza_name as "Pizza Name",sum(quantity) as "Total Quantity" from pizza_sales group by pizza_name order by sum(quantity) desc limit 5;
select pizza_name as "Pizza Name",count(order_id) as "Total Orders" from pizza_sales group by pizza_name order by count(order_id) desc limit 5;

select pizza_name as "Pizza Name", 
		sum(total_price) as "Revenue", 
		sum(quantity) as "Total Quantity", 
		count(order_id) as "Total Orders" 
        from pizza_sales
        group by pizza_name 
        order by sum(total_price) 
        desc limit 5;

-- 12. Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders.
-- Identify underperforming or less popular pizza options.
select pizza_name as "Pizza Name",sum(total_price) as "Revenue" from pizza_sales group by pizza_name order by sum(total_price) limit 5;
select pizza_name as "Pizza Name",sum(quantity) as "Total Quantity" from pizza_sales group by pizza_name order by sum(quantity) limit 5;
select pizza_name as "Pizza Name",count(order_id) as "Total Orders" from pizza_sales group by pizza_name order by count(order_id) limit 5;

select pizza_name as "Pizza Name", 
		sum(total_price) as "Revenue", 
		sum(quantity) as "Total Quantity", 
        count(order_id) as "Total Orders" 
        from pizza_sales
        group by pizza_name 
        order by sum(total_price) limit 5;
        
/* =========================== THE END =========================== */

