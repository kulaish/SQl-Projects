create database pizzasales;
use pizzasales;
show variables like
'secure_file_priv';
create table pizzasales
(order_details_id int,
 order_id int,
 pizza_id varchar(100),
 quantity varchar(3),
 order_date date,
 order_time time,
 unit_price varchar(6),
 total_price varchar(8),
 pizza_size	varchar(400),
 pizza_category varchar(500),
 pizza_ingredients varchar(400),
 pizza_name varchar(550)
 );
 
 select * from pizzasales;
 
 
 ALTER TABLE pizzasales MODIFY pizza_id varchar(100);
 ALTER TABLE pizzasales MODIFY order_date varchar(100);
 ALTER TABLE pizzasales ADD order_dates_ date;
 UPDATE pizzasales SET order_dates_ = STR_TO_DATE(order_date, '%m/%d/%Y');

load data infile "C:/ProgramData/MySQL/MySQL Server 8.2/Uploads/Data Model - Pizza Sales.csv"
into table pizzasales
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
 
 -- total revenue
 select sum(total_Price) as total_revenue
 from pizzasales;
 
 -- top 5 pizza by revenue
 select pizza_name,sum(total_Price) as total_sale
 from pizzasales
 group by pizza_name
 order by Total_sale desc
 limit 5;
 
 select pizza_name,sum(total_Price) as total_sale
 from pizzasales
 group by pizza_name
 order by Total_sale asc
 limit 5;
 
 -- bottom 5 pizza by quantity 
 select pizza_name,sum(quantity) as pizzaorders
 from pizzasales
 group by pizza_name
 order by pizzaorders asc
 limit 5;
 
 -- top 5 classic pizza by total orders
 select pizza_name,count(distinct order_id) as total_orders
 from pizzasales
 where pizza_category="classic"
 group by pizza_name
 order by total_orders desc
 limit 5;
 
 -- average no of pizza per order
 select sum(quantity)/count(distinct (order_id)) as averagepizzas
 from pizzasales;

 select avg(quantity/order_id) as averagepizzas
 from pizzasales;
 SELECT AVG( ) FROM table_name;

-- 
 
