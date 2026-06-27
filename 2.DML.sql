use ddl334;
show tables;
select * from students;

#insert--> use for insertion of data, row wise
describe students;

#SINGLE ROW ENTRY
insert into students values(101, "Kiran", "1993-05-15", 80000);
insert into students values(102, "Tiran", "1994-06-16", 90000);
insert into students values(101, "Kunal", "1995-07-17", 60000);
insert into students values(103, "Kunal", "1995-07-17", 60000);
select * from students;
set sql_safe_updates=0; #safe mode off query

#entry in multiple coloums
insert into students(stid, dob, fees) values(107, "1996-12-08", 75000);
insert into students(stid, dob, fees) values(108, "1998-11-08", 55000);

insert into students(stid, stname) values (110, "Nitin");

select * from students;

insert into students 
set stid=112, stname="Vishal", fees=50000; #set keyword

#update command--> existing data can be updated using udate command

update students set stname="Kunal" where stname="Karan";
update students set fees="20000" where fees="80000";

update students set fees="Vishal", fees= 50000 where stid=112;

#alter--> alters the structure of existing table in your database
alter table students add column city varchar (20);
select * from students;

alter table students add column lastname varchar(20) after stname;

alter table students add column lastname varchar (20) after stname;


alter table students change column location location varchar(15);
alter table students add column TotalMarks varchar (20) after lastname;
alter table students drop column TotalMarks;
alter table students add column TotalMarks varchar (20) after lastname;

select * from students;
describe students;

update students set TotalMarks=100 where TotalMarks is null;
set sql_safe_updates=0; #safe mode off query
update students set TotalMarks=100 where TotalMarks is null;

update students set fees=0 where fees is null;
alter table students drop column lastname; 
select * from students;
update students set stname="NA" where stname is null;

update students set dob="NA" where dob is null;
select * from students;

update students set dob="NA" where dob is null; #updating a string value in date column will return truncated o/p with warning
alter table students drop column location;

#Deletion of row
#DELETE COMMAND IS USE TO DELETE THE ROWS
delete from students where stid=112;
delete from students where stname="NA";

delete from students; #DELETE ALL THE ROWS

#TO DELETE THE ROWS FROM STIF 102 TO 105
#WE HAVE TO CREATE A RANGE OF stid 102 to 105
#for which we will require between operator
#and (logical operator) will be used with between operator to create the range

delete from students where stid between 102 and 105;
select * from students;

delete from students;


#delete rows stid is 101,102,103 or any specfic student
#in operator---> or logic

delete from students where stid in(103,110);
select * from students;

alter table students rename students1; #to change the complete table name 
