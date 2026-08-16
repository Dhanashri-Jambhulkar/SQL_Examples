create database ECOM; 
-- if not exists
use ECOM;
create table Service_Provider(
Order_id int unique,
Product varchar(25),
Price int not null,
Base_City varchar(20)
);
insert into Service_Provider values
(101, "Clothing", 2500, "Delhi"),
(102, "Sports", 3000, "Mumbai"),
(105, "HomeDecor", 6400, "Jaipur");

create table Customer_view(
Product_id int unique,
Customer_name varchar(50),
Address_city varchar(25)
);
insert into Customer_view values
(101, "Chinu", "Pune"),
(103, "Juggu", "Mumbai"),
(105, "Prinshu", "Nagpur");

select * from Service_Provider sp
inner join Customer_view cv
on sp.Order_id = cv.Product_id;

select * from Service_Provider sp
left join Customer_view cv
on sp.Order_id = cv.Product_id;

select * from Service_Provider sp
right join Customer_view cv
on sp.Order_id = cv.Product_id;

-- FULL_Join

select * from Service_Provider sp
left join Customer_view cv
on sp.Order_id = cv.Product_id

union

select * from Service_Provider sp
right join Customer_view cv
on sp.Order_id = cv.Product_id;