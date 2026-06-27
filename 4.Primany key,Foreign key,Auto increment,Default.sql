#PRIMARY KEY-->unique + not null
#in one table there can be only one primary key
create table courses(cid int primary key, cname varchar(20) not null, DOL date);
select * from courses;
describe courses;

insert into courses values(1002, "DSDA", "2026-05-12");
insert into courses values(null, "DSDA", "2026-05-12");

#FOREIGN KEY-->allows a dublicate values
#this key is a reference key to primary table
#you can multiple foreign key in one table

create table students(sid int primary key, sname varchar(30) not null,c_id int, foreign key(c_id) references courses(cid));
describe courses;
describe students;

insert into students values(101, "Anand", 1002);
select * from students;
insert into students values(102, "Viren", 1008);
#you cannot add value in foreign key, which is not there in a primary key

insert into courses values(1008, "FSD", "2026-02-13");
insert into students values(102, "Viren", 1008);
insert into students values(104, "Vedant", 1002);
insert into students values(105, "Rushank", null);

drop table courses;#since students tables has a reference key of courses table (course id) therefore it can 
drop table students;#therefore first drop student table
drop table courses;#then drop courses table


