create table LibraryAudit(roll_no number, std_name varchar(20), doi date, bookname varchar(20), status varchar(20));
create table LibraryTable(roll_no number, std_name varchar(20), doi date, bookname varchar(20), status varchar(20));
insert into LibraryTable values(31,'ashish shisal',to_date('10-09-2023','dd-mm-yyyy'),'iot','issued');
insert into LibraryTable values(35,'ayush acharya',to_date('12-09-2023','dd-mm-yyyy'),'spos','issued');
insert into LibraryTable values(39,'kaustubh warade',to_date('13-09-2023','dd-mm-yyyy'),'aiml','issued');
insert into LibraryTable values(43,'omkar latpate',to_date('14-09-2023','dd-mm-yyyy'),'dbms','issued');
insert into LibraryTable values(41,'samruddhi shisal',to_date('15-09-2023','dd-mm-yyyy'),'cns','issued');

select * from LibraryTable;

create or replace trigger trig  
before update or delete 
on LibraryTable 
for each row

begin
	insert into LibraryAudit values(:old.roll_no,:old.std_name,:old.doi,:old.bookname,:old.status);
end;
/
update LibraryTable set roll_no=46 where std_name='omkar latpate';
update LibraryTable set roll_no=36 where std_name='ayush acharya';
select * from LibraryAudit;
/
select * from  LibraryTable;
