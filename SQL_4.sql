create database Weather_Condition;
use Weather_condition;
create table Weather(
num int,
temp int
);
insert into Weather values
(1,14),
(2,13),
(3,15),
(4,12),
(5,14),
(6,16),
(7,13),
(8,17);

delete from Weather where num = 8;

select * from Weather;

select *,
lag(temp,1,0) over (order by num asc) as prev_day_temp,
lead(temp,1,0) over (order by num asc) as next_day_temp
from Weather;
