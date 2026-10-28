-- Join
create database priyank01;
use priyank01;

create table customers(
    customerID int primary key,
    name varchar(100),
    email varchar(100),
    city varchar(100)
);
create table orders(
    orderID int primary key,
    customerID int,
    orderDate date,
    totalamount Decimal(10,2)
);
insert into orders value(101,1,"2026-05-10",2500.56),
(102,3,"2026-05-10",2500.56),
(103,5,"2026-05-10",2500.56),
(104,7,"2026-05-10",2500.56),
(105,2,"2026-05-10",2500.56),
(106,11,"2026-05-10",2500.56),
(107,15,"2026-05-10",2500.56);

insert into customers value(1 , "joy" , "joy@gmail.com" , "mumbai"),
(2 , "mohit" , "mohit@gmail.com" , "mumbai"),
(4 , "neha" , "neha@gmail.com" , "pune"),
(6 , "parul" , "parul@gmail.com" , "pune"),
(8 , "roy" , "roy@gmail.com" , "gujarat"),
(5 , "kunal" , "kunal@gmail.com" , "mumbai"),
(10 , "varun" , "varun@gmail.com" , "nashik");

select * from orders;
select * from customers;

-- inner join
select customers.name , customers.city , orders.orderdate , orders.totalamount
from customers inner join orders on customers.customerid = orders.customerid;

-- other way

select c.name , c.city , o.orderdate , o.totalamount
from customers as c inner join orders as o on c.customerid = o.customerid;

-- left join

select customers.name , customers.city , orders.orderdate , orders.totalamount
from customers left join orders on customers.customerid = orders.customerid;

-- right join

select customers.name , customers.city , orders.orderdate , orders.totalamount
from customers right join orders on customers.customerid = orders.customerid;


select customers.name , customers.city , orders.orderdate , orders.totalamount
from customers left join orders on customers.customerid = orders.customerid
union
select customers.name , customers.city , orders.orderdate , orders.totalamount
from customers right join orders on customers.customerid = orders.customerid;