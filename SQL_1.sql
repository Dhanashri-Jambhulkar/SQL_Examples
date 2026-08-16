create database StudentDB;
USE StudentDB;
create table Info
(
Roll_No INT unique,
St_Name varchar(100) not null,
Marks int,
City varchar(50)
);
insert into Info values
(1,"Chinu",98,"Pune"),
(2,"Prinshu",85,"Wardha"),
(3,"Sakshi",70,"Nagpur"),
(4,"Mintu",82,"Mumbai"),
(5,"Juggu",95,"Amaravati"),
(6,"Sweety",90,"Sewagram");

insert into Info(Roll_No) value (7),(8);
insert into Info(St_Name) value ("Pintu"),("Kitu");

drop table Info;
create table EmployeeInfo(
Emp_Name varchar(100),
Dept varchar(20),
Salary DECIMAL(10, 2) DEFAULT 10000
);

alter table EmployeeInfo
add column Gender varchar(10);
alter table employeeinfo
rename column Dept to Department;






