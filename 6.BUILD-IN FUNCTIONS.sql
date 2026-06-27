#BUILD-IN FUNCTIONS
#SINGLE ROW FUNCTION
use dql334;

#1) String Functions
#concat()
#Find the fullname of the customers
select * from customers;
select customernumber, concat(contactfirstname, " ", contactlastname) "Fullname" from customers;

alter table customers add column fullname varchar(40) after customername;

update customers set fullname=concat(contactfirstname, " ", contactlastname);

#upper()
select * from employees;
select upper(lastname), lastname from employees;

#lower()
select lower(lastname), lastname from employees;

alter table employees add column fullname varchar(40) after firstname;
update employees set fullname=upper(concat(firstname, " ", lastname));
set sql_safe_updates=0;

#replace()
select employeenumber, fullname, replace(email, "classicmodelcars", "gmail") "NEW MAIL ID", officecode from employees;

#length() & trim()
select employeenumber, fullname, length(fullname) "Length", length(trim(fullname)) "Trimmed length" from employees;
select length("       Priyank"),length(trim("      Priyank"));

#substr()

select fullname, substr(fullname,3,6) from employees;

#first 3 character from fullname
select fullname, substr(fullname,1,3) from employees;

#last 3 character from fullname
select fullname, substr(fullname,-3) from employees;

#start from 3rd last character & fetch 2 character from fullname
select fullname, substr(fullname,-3, 2) from employees;

#create a gmail id for customera-->first 3 character from firstname, last 3 characater from lastname customerid, @gmail.comm
#do it in a single query

select * FROM customers;

select customernumber, contactfirstname, contactlastname, lower(concat(substr(contactfirstname,1,3),substr(contactlastname,-3),customernumber,"@gmail.com")) from customers;

#position()
select position("world" in "hello world");


select * from employees;
select position("classicmodelcars" in email) from employees;

#2) DATE FUNCTIONS
#curdate()
select curdate();
select now();
select sysdate();
select now(), sysdate();

#month()
select * from orders;
select ordernumber, year(requireddate) from orders;

#day()
select ordernumber, day(requireddate) from orders;

#last_day()
select ordernumber, Orderdate, Last_day(requireddate) from orders;

#increase creditlimit of each customer by 5%
select customernumber, fullname, creditlimit, creditlimit + (0.05*creditlimit) "New CL" FROM customers;

select * from orders;

select ordernumber, orederdate, orderdate+5 from orders; #wrong way to add no of days to your date 

select ordernumber, orderdate, adddate(orderdate,5) from orders;

#dateiff()

#find the difference between shipping and orderdate
select datediff(shippeddate, orderdate) "No of days from delivering" from orders;

#timestampdiff()
#difference in month of orderdate and todaydate 
select orderdate, timestampdiff(month, orderdate, curdate()) "Difference in months" from orders;

#difference in year of orderdate and todaydate 
select orderdate, timestampdiff(year, orderdate, curdate()) "Difference in years" from orders;

#date_format()-->changes the format of the date

select orderdate, orderdate, date_format(orderdate, "%M") from orders;#monthnumber %m monthname %M
select orderdate, ordernumber,
date_format(orderdate, "%m") "Month number",
date_format(orderdate, "%M") "Month name",
date_format(orderdate, "%y") "year number in short",
date_format(orderdate, "%Y") "year number in full format",
date_format(orderdate, "%b") "Short month date",
date_format(orderdate, "%d") "Day",
date_format(orderdate, "%W") "Weekday",
date_format(orderdate, "%a") "Weekday in short",
date_format(orderdate, "%D") "Position with date",
from orders;

#Monday of 2nd Mar 2026-->bring all the cordinates in this format

select orderdate, date_format(orderdate, "%W, %D of %b %Y") from orders;

#3) MATH FUNCTIONS
# ROUND()
select * from products;
select MSRP, round(MSRP), round(MSRP,1), round(MSRP,3)FROM PRODUCTS;

# ceil()
select MSRP, CEIL(MSRP) FROM products;

#floor()
select buyprice, floor(buyprice) from products;

select buyprice, round(buyprice), ceil(buyprice), floor(buyprice) from products;

#pow()
select pow(12,2); #12^2-->12 raise to 2 or 12 to the power 2

#sqrt()
select sqrt(144);

# 4) COMPARISION FUNCTION
# IS NULL FUNCTION
#FIND ALL THE CUSTOMERS WHOSE STATE DATA IS NULL
SELECT customernumber, customername, state from customers where state is null;
#is null here is keyword which will filter the data of the customers whose state is null
SELECT customernumber, customername, isnull(state) from customers;
# isnull functions givve us binary output-->state if null than 1 and if not null then 0

#IF()
#IF()-->ADDITIONAL COLUMN for o/p
#FRANCE-->5% discount
#USA-->2% discount
#Australia--> 1% discount
#other countries--> no discount

alter table customers drop column discount;
Select * from customers;
select customernumber, customername, country, 
if(country="France", "5% Discount",
if(country="USA", "2% Discount",
if(country="Australia", "1% Discount",
"NO DISCOUNT"))) "DISCOUNTS"
from customers;

#officecode-->1->PF 2000, 2-->PF 3000 5-->PF 4000, NO PF
Select * from employees;

alter table employees add column PF_details varchar(20) after officecode;
update employees set PF_details=
if(officecode=1, "PF2000",
IF(officecode=2, "PF3000",
IF(officecode=5, "PF4000",
"NO PF")));

# Greatest() & Least()
select * from products;
select buyprice, MSRP, greatest(buyprice, MSRP), least(buyprice,MSRP) from products;

# 5) aggregate functions
#sum(), avg(), min(), max(), count()

select * from customers;
select customernumber, sum(creditlimit) from customers;

#Find total, max, min, avg creditlimit of all the customers who are from country--->USA, UK, France-->sort the country who has the highest creditlimit to lowest creditlimit
SELECT country,
    SUM(creditLimit) AS total_credit,
    MAX(creditLimit) AS max_credit,
    MIN(creditLimit) AS min_credit,
    AVG(creditLimit) AS avg_credit
FROM customers
WHERE country IN ('USA', 'UK', 'France')
GROUP BY country
ORDER BY MAX(creditLimit) DESC;

#find total amount paif by each customer and sort the data of the customers who paid highest to lowest amount and fetch only top 5 customers who paid the most
