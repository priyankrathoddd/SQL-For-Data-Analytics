-- Show Database list
show databases;
-- Create a database 
create database priyank;
-- select database
use priyank;
-- how to delete database
-- drop database priyank;
-- select database
use priyank;
show tables;

create table employee(
    Employee_id int auto_increment primary key,
    name varchar(50),
    date_of_birth date,
    gender enum("male","female"),
    email varchar(100) unique key,
    phone varchar(100) unique key,
    salary decimal(10,2),
    age int
);
show tables;

-- show table records
select * from employee;
-- insert into table

insert into employee (name,date_of_birth,gender,email,phone,salary,age)
value(101,"Nisha","1998-12-05","male","nisha@cqpc.in","8972285468",451000,78);

insert into employee (name,date_of_birth,gender,email,phone,salary,age)
value("Nishant","1998-12-05","male","nishant@cqpc.in","8975685468",450000,78),
("Joy","1996-12-05","male","joy@cqpc.in","8975685768",480000,76),
("Bhavin","1997-12-05","male","bhavin@cqpc.in","8975285468",410000,48),
("Toy","1992-12-05","Female","toy@cqpc.in","8975645468",400000,55),
("Tie","1994-12-05","Female","tie@cqpc.in","8915645468",480000,55);

-- Switch database
use classicmodels;
show tables;
select * from customers;
select count(*) from customers;
-- and / or / where
select customerName, city, country, state, creditLimit from customers
where country = "USA";

update customers set creditLimit = creditLimit + 50000
where country = "USA"
or country = "Australia"
or country = "France";

