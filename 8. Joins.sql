#Joins-->Joining two or more tables
#Inner Join-->needs a common cloumn--> retrieves the matching data from both the tables
#unmatched data will not come in the o/p
create table author(aid int primary key, Aname varchar(15));
insert into author values
(1, "Rama"),
(2, "Mohan"),
(3, "Sudha"),
(4, "Bhagat"),
(5, "Roshan"),
(6, "Bhati");

create table book(bid int, bname varchar(30), aid int);
insert into book values
(101, "Healthy Recipes", 4),
(102, "Revolving Around The Earth", 1),
(103, "Great Women", 2),
(104, "Pink City", 5),
(105, "Great Indian Chef", 7),
(108, "Hello From Another World", 9);

#inner join on author & book table
#1)
select a.aid, a.aname, b.bid, b.bname from author a join book b where a.aid=b.aid;
#2)
select b.aid, a.aname, b.bid, b.bname from author a join book b on a.aid=b.aid;
#3)
#using clause--> to use this it is mandatory to have same name for common column in both 
select aid, aname, bid, bname from author join book using(aid);

#Find salesrepemployee from all customers i.e which sales person has been assigned to which customer
select * from customers;
select * from employees;
#names of the common column--> customers-->salesrepemployeesnumber, employees--> employeenumber
SELECT customernumber, customername , c.salesrepemployeenumber FROM customers c JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber;

#count the customers under each sales representatives
select salesrepemployeenumber, firstname, lastname, count(customernumber) from employees join customers on salesrepemployeenumber=employeenumber
group by salesrepemployeenumber;

#find office location all the employees
select * from offices;
SELECT employeeNumber, fullName, officecode, city, state, country postalcode FROM employees JOIN offices using (officecode);

#find the customers who have given orders with their orderdetails
select * from orders;
select customernumber, customername, fullname, ordernumber from customers join orders using(customernumber);

#find the customers who has given orders with the count of their orders
select customernumber, customername, fullname, count(ordernumber) from customers join orders using(customernumber) group by customernumber;

#find the sum of amount paid by each customer with their names
SELECT customerNumber, customername, fullname, SUM(amount) FROM customers JOIN payments USING (customerNumber) GROUP BY customerNumber;

#OUTER JOIN
#LEFT OUTER JOIN-->GIVES MORE IMPORTANCE TO LEFT TABLE
#I.E MATCHED AND UNMATCHED DATA FROM LEFT TABLE
#ONLY MATCHING DATA FROM RIGHT TABLE

#find out all the author name who wrote the book & also the author's who didn't write the book
select aid, aname, bid, bname from author left outer join book using (aid);

#find the customers who gave orders and also the ones who did nto gave order

#right OUTER JOIN-->GIVES MORE IMPORTANCE TO right TABLE
#I.E MATCHED AND UNMATCHED DATA FROM right TABLE
#ONLY MATCHING DATA FROM left TABLE
select customernumber, customername, fullname, ordernumber from orders right outer join customers using(customernumber);

select customernumber, customername, fullname, ordernumber from orders left outer join customers using(customernumber);

#find thr customers who are assigned with sales representatives & also the customers who dont have sales representatives
SELECT customernumber, customername, salesRepEmployeeNumber, firstname, lastname 
FROM customers LEFT outer JOIN employees on salesRepEmployeeNumber=employeenumber;

#only employees who are assigned some customers
#(do not account fro employees who are not having any customers

select employeenumber, firstname, officecode, customernumber from customers right outer join employees 
on salesrepemployeenumber=employeenumber where salesRepEmployeeNumber is not null;

#count of customers per employee, only the employees who have customer count>0
select employeenumber, firstname, officecode, customernumber from customers right outer join employees 
on salesrepemployeenumber=employeenumber group by employeenumber having count(customernumber)<>0;

#CROSS JOINS
CREATE TABLE student(sid int primary key, sname varchar(15), module varchar(10));
insert into student values
(1, "Kajol", "SQL"),
(2, "Ritest", "SQL"),
(3, "Rahul", "SQL"),
(4, "Chetan", "SQL"),
(5, "Umesh", "SQL");

create table test(test_id int primary key, testname varchar(15));
insert into test values
(101, "Test 1"),
(102, "Test 2"),
(103, "Test 3");

select sid, sname, module, test_id, testname from student, test;
#no common column is neede for cross join 
#also known as cartesian join
#no of rows in o/p= no of rows in first table * no of rows in second table

#SELF JOIN
#joining a table to itself

select * from employees;

select a.employeenumber, a.fullname, a.reportsto, b.fullname from employees a left outer join employees b on(a.reportsto=b.employeenumber);

create table food(ID int primary key, Quantity int, Category varchar(20), Parentcategoryid int, foreign key(parentcategoryid) references food(id));

insert into food values
(101, 60, "Food", null),
(102, 50, "Fruit", 102),
(104, 40, "Apple", 102),
(105, 30, "Granny smith", 104),
(106, 20, "Milk", 101),
(107, 60, "Soy milk", 106),
(108, 20, "Cow milk", 106),
(109, 10, "Whole milk", 108),
(110, 10, "Low fat milk", 108);

select a.id, a.category, a.parentcategoryid, b.category from food a left outer join food b on(a.parentcategoryid=b.id);

# NON EQUI JOIN--> INNER JOIN
#WE DO NOT USE THIS JOIN MUCH BECUZ WE HAVE ALTERNATIVE JOINTS LIKE CASE CLAUSE AND IF FUNCTION

SELECT * FROM CUSTOMERS;
# 0-50000--->SILVER
# 50001-100000--->GOLD
#100001-->300000--->DIAMOND

create table condition1(low int, high int, status varchar(15));
insert into condition1 values
(0,50000,"SILVER"),
(50001,100000,"GOLD"),
(100001,300000, "DIAMOND");
SELECT * FROM CONDITION1;
#CUSTOMERS TABLE & CONDITION1 TABLE HAS NO COMMON COLUMN--> 
#STILL WE CAN USE THE NON EQUI JOINT BY CREATING RANGE OF CREDITLIMIT

SELECT customernumber, customername, fullname, creditlimit, 
status from customers join condition1 on(creditlimit between low and high);

#payments
#0-20000--->LOW BILLING AMOUNT
#20001-50000--->AVERAGE BILLING AMOUNT
#50001-200000--->HIGHEST BILLING AMOUNT

create table condition2(low int, high int, status varchar(15));
insert into condition2 values
(0,20000,"LOW BILLING AMOUNT"),
(20001,50000,"AVERAGE BILLING AMOUNT"),
(50001,200000, "HIGHEST BILLING AMOUNT");

SELECT CUSTOMERNUMBER, PAYMENTDATE, AMOUNT, STATUS FROM PAYMENTS JOIN CONDITION2 ON(AMOUNT BETWEEN LOW AND HIGH);
SELECT * FROM CONDITION2;
