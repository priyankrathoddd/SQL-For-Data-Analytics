#SUBQUERY--> QUERY INSIDE THE MAIN QUERY
#INNER QUERY (sub query) will be the answer to my outer query (main query)

#find all the employees who are working in the same office as mary

select * from employees;
select officecode from employees where firstname="Mary";
select * from employees where officecode=1;

#using subquery
select * from employees where officecode=(select officecode from employees where firstname="Mary");

#fetch all the employees who reports to the same manager as "William Patterson" with subquery
select * from employees where reportsto=(select reportsTo from employees where fullname="William Patterson");

#find total ammount paid by Jean
SELECT customernumber, SUM(amount)FROM payments group by customernumber having customernumber in
(SELECT customerNumber FROM customers WHERE contactFirstName = 'Jean');

select * from customers where contactfirstname="Jean";

#count the number of payments made by customers same as lastname-->Schmitt & firstname-->Carine
SELECT customernumber, count(amount)FROM payments group by customernumber having customernumber=
(SELECT customerNumber FROM customers WHERE contactFirstName = "Carine" and contactlastname = "Schmitt");

#find all the customers having country same as Dragon souveniers, Ltd.
SELECT * FROM customers WHERE country =(SELECT country FROM customers WHERE customerName = 'Dragon Souveniers, Ltd.');

select * from customers;

#Find the customers whose creditlimit is greater than the average creditlimit of all the customers
SELECT * from customers where creditLimit > (SELECT AVG(creditLimit)FROM customers);

#Find the customers whose creditlimit is greater than the average creditlimit of all the customers & belongs to nyc
SELECT * from customers where creditLimit > (SELECT AVG(creditLimit) FROM customers) AND city="nyc";

#find the customers having creditlimit greater than the average creditlimit of any country from usa, uk, france
select * from customers where creditlimit>ANY(select avg(creditlimit) from customers group by country having country in("USA", "UK", "France"));

#ANY-->less than the maximum values
#find the customers having creditlimit less than the average creditlimit of any country from usa, uk, france
#UK-->AVG CL-->IS HIGHEST-->88740
select * from customers where creditlimit<ANY(select avg(creditlimit) from customers group by country having country in("USA", "UK", "France"));

# >ALL--> higher than the maximum value 
select country, avg(creditlimit) from customers group by country having country in("USA", "UK", "France");
#find the customers having creditlimit greater than the average creditlimit of all country from usa, uk, france
select * from customers where creditlimit >all(select avg(creditlimit) from customers group by country having country in("USA", "UK", "France"));

# <ALL-->less thant the minimum value
#find the customers having creditlimit less then average creditlimit of all country from usa, uk, france
select * from customers where creditlimit <all(select avg(creditlimit) from customers group by country having country in("USA", "UK", "France"));

#find the cutomers cl more than the highest cl of all the county from germany,spain,australia
SELECT * FROM customers WHERE creditLimit >ALL(SELECT MAX(creditLimit) FROM customers GROUP BY COUNTRY HAVING COUNTRY IN ("Germany","Spain","Australia"));

# FIND CUSTOMERS WHO LIVED IN SAME COUNTRY AS THAT OF DANIEL
SELECT customernumber, fullname, country from customers where country in (SELECT country FROM customers WHERE contactFirstName = "Daniel");

#DML with subquery
select * from customers;
#update the cl of all the customers who belong to same country as that of fungiftsideas.com
update customers set creditlimit=creditlimit+1000
where country =(select country from customers where customername="fungilftsideas");

set sql_safe_updates=0;

#update email id of all the employees working in same office as that of larry, itvedant@gmail.com
UPDATE employees SET email = "itvedant@gmail.com" WHERE officeCode = (SELECT officeCode FROM employees WHERE firstName = "Larry");
select * from employees where email="itvedant@gmail.com";

#DDL USING SUBQUERY
#CREATE A COPY OF EMPLOYEES TABLE
#INSERT ALL THE ROWS SAME AS EMPLOYEES TABLE
DESCRIBE employees;
create table employeescopy(eid int, surname varchar(50), name varchar(50), fullname varchar(40), ext varchar(10), Officeno int, reportingmanager int, position varchar(40));

select * from employeescopy;

insert into employeescopy
select employeenumber, lastname, firstname, fullname, extension, officecode, reportsto, jobtitle from employees;

#create a copy customers table in single query
create table customerscopy select * from customers;

select * from customerscopy;
describe customerscopy;

create table customerscopy2 select customernumber, customername, fullname, creditlimit, country from customers;
select * from customerscopy2;

create table customerscopy3 select customernumber "cid", customername "cname", fullname "fn", creditlimit "cl", country from customers;
select * from customerscopy3;

#create a customized table of customers who belong to Australia seperately
CREATE TABLE customerscopy4 AS SELECT * FROM customers WHERE country = "Australia";
select * from customerscopy4;

#delete the data of all the employees working with Mary from employeecopy
DELETE FROM employeescopy WHERE officeno =(SELECT officeno FROM employeescopy WHERE Name="Mary");
select * from employeescopy;







