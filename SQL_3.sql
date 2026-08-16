-- TRANSFORMATIONS
use studentdb;
-- Numeric Transformations
SELECT 
	unit_price * 0.90 AS discounted_price,
    unit_price + 10 as taxed_price,
    unit_price / 10 as fractioned_price,
    ROUND(unit_price,1) as rounded_price,
    unit_price * unit_price as multiply_price
FROM 
	dim_product;
   
   
-- DATE Transformations
-- 1) 
SELECT 
	date,
    now() as 'current_timestamp',
    utc_date(),
    utc_time(),
    utc_timestamp()
FROM 
	dim_date;
    
-- 2)
SELECT 
	date,
    YEAR(date),
    MONTH(date),
    DAY(date),
    WEEKDAY(date),
    DAYNAME(date),
    DATEDIFF(DATE(utc_timestamp()),date) AS total_days,
    ADDDATE(date,2),
    SUBDATE(date,2),
    CAST('2025-01-01' AS datetime) 
FROM 
	dim_date;
    
-- 3)
SELECT 
	date,
    date_format(date,"%W %M %e %Y") AS converted_date
FROM 
	dim_date;


-- TYPE CASTING
SELECT 
	customer_key,
    CAST(customer_key AS CHAR(100))
FROM
	dim_customer;


-- STRING FUNCTIONS
SELECT 
	*,
	CONCAT(first_name,' ',last_name) AS full_name,
    CONCAT_WS(' ',first_name,last_name,country),
    LENGTH(country) AS country_size,
    LOWER(city),
    substring(email,1,6),
    REPLACE(email,'@','%'),
    LEFT(country,3),
    RIGHT(country,3),
    REVERSE(country),
    REPEAT(first_name,2)
FROM 
	dim_customer;
    
with cte_table as(    
select * from 
(select * from dim_product where unit_price > (select avg(unit_price) from dim_product)) as subquery_table
where category = 'clothing'
)
select * from cte_table
where brand = 'BrandC' and product_name like 'S%';




with cte_table as(    
select * from 
(select * from dim_product where unit_price > (select avg(unit_price) from dim_product)) as subquery_table
where category = 'clothing'
)
select * from cte_table
where product_name in ('Our Raise', 'Send Story', 'Pressure That');


select subquery.* from
(select *, dense_rank() over(order by unit_price) as ranking from dim_product) subquery
where ranking = 5;
