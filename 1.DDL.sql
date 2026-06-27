#DDL-->Data Defination Language
#create-->creation of database, tables

create database ddl334;

#use command  alows us to enter inside the database
#(double click on database name in schemes to do the same)
use ddl334;

#DATATYPES
#1)int, bigint
#2)varchar()
#3)char()
#4)date "yyyy-mm-dd"
#5)dec()

create table students(stid int, stname varchar(20), dob date, fees dec(8,2));
create table Employee(emid int, stname varchar(20), dob date, salary dec (7,2));

select * from students;

#show command-->use to see the databases & tables inside any database
show databases;
show tables;

#drop command-->used to drop the databases & tables
drop table students;

drop database ddl334;
show databases;

#describe command-->use to see the descriptionof the table
create database ddl334;
create table students(stid int, stname varchar(20), dob date, fees dec(8,2));
describe students;


show tables;

drop table employee;
show tables;
truncate students;
select * from students;