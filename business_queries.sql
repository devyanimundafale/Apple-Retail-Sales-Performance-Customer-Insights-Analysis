-- total revenue (all years)
SELECT sum(price * quantity) as total_revenue 
FROM sales as s
JOIN 
products as p
ON p.product_id_id = s.product_id;

-- revenue per year
SELECT year(sale_date) as year_ ,sum(price * quantity) as total_revenue 
FROM sales as s
JOIN 
products as p
ON p.product_id_id = s.product_id
group by year_
ORDER BY total_revenue desc;

-- units sold per category
SELECT c.category,sum(quantity) as units_sold
FROM sales as s
JOIN 
products as p
ON p.product_id_id = s.product_id
JOIN 
category as c
ON c.category_id = p.category
group by c.category
order by units_sold desc;

-- stores per country 
select country , count(store_id) as total_stores
from stores
group by country 
order by total_stores desc;

-- top 10 products by quantity sold 
SELECT distinct product_name , sum(quantity) as units_sold
FROM sales as s
JOIN 
products as p
ON p.product_id_id = s.product_id
group by product_name 
order by units_sold desc
limit 10;

-- year over year revenue growth
select year_,total_revenue , ROUND((total_revenue - LAG(total_revenue) OVER (ORDER BY year_)) * 100.0
             / LAG(total_revenue) OVER (ORDER BY year_), 2) AS yoy_growth_pct
FROM (SELECT year(sale_date) as year_, sum(price * quantity) as total_revenue 
FROM sales as s
JOIN 
products as p
ON p.product_id_id = s.product_id
GROUP BY year_ ) as revenue;

-- monthly sales trend(2023)
SELECT monthname(sale_date) as year_23 ,sum(price * quantity) as total_revenue 
FROM sales as s
JOIN 
products as p
ON p.product_id_id = s.product_id
where  year(sale_date) ='2023'
group by year_23
ORDER BY year_23 ;

-- revenue contribution % of category
SELECT c.category, sum(price*quantity) revenue  
FROM sales as s
JOIN 
products as p
ON p.product_id_id = s.product_id
JOIN 
category as c
ON c.category_id = p.category
group by c.category
order by revenue desc;

-- top 5 and bottom 5 perfoming stores in revenue
SELECT store_name , sum(price*quantity) revenue  
FROM  products as p 
join sales as s
ON p.product_id_id = s.product_id
JOIN 
stores as t
ON s.store_id= t.store_id
group by store_name
order by revenue desc
limit 5;

SELECT store_name , sum(price*quantity) revenue  
FROM  products as p 
join sales as s
ON p.product_id_id = s.product_id
JOIN 
stores as t
ON s.store_id= t.store_id
group by store_name
order by revenue asc
limit 5;

-- avg price vs total units sold per category
SELECT c.category,sum(quantity) as units_sold , avg(price)
FROM sales as s
JOIN 
products as p
ON p.product_id_id = s.product_id
JOIN 
category as c
ON c.category_id = p.category
group by c.category
order by units_sold desc;

-- Products launched in the last 2 years vs older products — sales comparison
select sum(quantity) as units_sold,sum(price*quantity) as revenue,( 
case 
	when year(launch_date) IN ('2023','2024') then 'launched last 2 yrs'
    else 'old product'
end
)product_age 
from products as p
join 
sales as s
on s.product_id = p.product_id_id
group by product_age;
   
-- Running total (cumulative) revenue per store over time
select store_name ,sale_date ,sum(quantity*price)over(partition by store_name order by sale_date ) running_revenue 
from sales as s 
join products as p on s.product_id = p.product_id_id
join stores as a on s.store_id =a.store_id ;


--  Warranty claim rate per product (min 100 sales to avoid noise)
select product_name, count(claim_id) as total_claim , count(sale_id) as sales,
round ((sum(claim_id)*100)/(sum(sale_id)),2) as claim_rate
from sales as s 
join products as p on s.product_id =p.product_id_id 
join warranty as w on s.sale_id = w.sales_id 
group by product_name;
-- Overall warranty claim rate

-- Average days between sale and claim, by category

-- Rank stores within each country by revenue
select country,city,store_name,sum(quantity*price) as revenue,
rank()over(partition by country order by sum(quantity*price) desc ) rank_ 
from sales as s 
join products as p on s.product_id = p.product_id_id
join stores as a on s.store_id =a.store_id 
 group by country ,city, store_name