#VIEWS-->VIRTUAL TBALE
#incase you dont want to create a physical table
#you can create a view of the table and fetch it anytime you want to view

create view author_book
as select aid, aname, bid, bname from author join book using(aid);

select * from author_book;

describe author_book;

show tables;