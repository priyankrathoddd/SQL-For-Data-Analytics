create database constraints;
use constraints;

#UNQUE--> unique constraint/key will not allow dublicate entry in the column
#NOT NULL-->not null constraint/key will not allow null values in the column

create table employee(Eid int unique, Ename varchar(30) not null, Salary dec(8,2));
show tables;
select * from employee;
describe employee;

insert into employee values(223, "Jatin",80000);
insert into employee values(223, "Latin",90000);
#inserting a single dublicate Eid row

insert into employee values
(224, "Girish", 50000),
(225, "Kiran", 45000);
select * from employee;

insert into employee values(226, null,78000);

insert into employee value
(226, null, 78000),
(227, "Krish",44500),
(228, "Firoz", 89000);

select * from employee;
#enum--> act as a constraint as wll as datatype,
#allow you to enter any one value from the list of enum
create table employees(Eid int unique, ename varchar(30) not null, dept enum("Hr", "Operations", "Accounts", "Admin", "Sales"));
select * from employee;
describe employees;

insert into employees value(101, "Naman", "Training");
select * from employees;


insert into employees values(102, "Namisha", "Admin");
insert into employees values(103, "Neha", "Operation");
insert into employees values(104, "Jatin", "Operations");

#set-->set constraint act as a datatypes  as well as constraint
#allows you to enter more than one value from the set list

create table employee1(Eid int unique, ename varchar(20) not null, qualification set("Graduate", "Post Graduate", "master", "Double Masters"));

select * from employee1;
describe employee1;

insert into employee1 values(152, "Bharat", "Master");
delete from employee1 where eid=151;
insert into employee1 values(151, "Bharat", "Master");
delete from employee1 where eid=152;
insert into employee1 value (152, "Hiten", "Master,Double Masters");
insert into employee1 values(153, "Girija", "Master,Double Masters");
insert into employee1 values(154, "Siya", "Graduate,Master,Double Masters");

update employee1 set ename="Hiten" where eid=152;
update employee1 set ename="Siya" where eid=154;

#Make Train Time Table
#Trainnumber, trainname, boardingstation, platformstation
#trainnumber-->unique
#trainname-->cannot be null
#boardingstation-->list-->1 permitted
#platformnumber-->list-->more than 1 permitted

create table traintt(train_no int unique, train_name varchar(20) not null, board_at enum("Borivali", "Dadar", "CST", "Palghar"), plt_no set("1","2","3","4","5","6","7"));
insert into traintt values
(22092, "Lokshakti", "Borivali", "4,7"),
(22093, "Intercity", "Bandra", "2,5,6"),
(12092, "Garib Rath", "CST", "1,2,8");

Select * from traintt;







