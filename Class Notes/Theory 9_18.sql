/*
NOT NULL - Ensures that a column cannot have a NULL value
UNIQUE - Ensures that all values in a column are different
PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
FOREIGN KEY - Prevents actions that would destroy links between tables
CHECK - Ensures that the values in a column satisfies a specific condition
DEFAULT - Sets a default value for a column if no value is specified
CREATE INDEX - Used to create and retrieve data from the database very quickly

--Table A - student_id Primary
--Table B - student_year_enroll Primary student_id Secondary/Foreign
--Table C - student_sub_enroll Primary student_id, student_year_enroll Secondary/Foreign
*/
drop table if exists bds35_tab_nn;
create table bds35_tab_nn(
id int not null,
fname varchar(255) not null,
lname varchar(255) not null);

insert into bds35_tab_nn values (1191, 'Pritam', 'Shah');
insert into bds35_tab_nn values (1192, 'Ramana', 'Verma');

drop table if exists bds35_tab_unq;
create table bds35_tab_unq(
id int not null,
fname varchar(255) not null,
lname varchar(255) not null,
unique (id));

drop table if exists bds35_tab_prim;
create table bds35_tab_prim(
id int not null,
fname varchar(255) not null,
lname varchar(255) not null,
primary key (id));

insert into bds35_tab_prim values (1234, 'Viju', 'Shah');
insert into bds35_tab_prim values (1235, 'Vijay', 'Shah');
insert into bds35_tab_prim values (1236, 'Vijayan', 'Shah');
insert into bds35_tab_prim values (1237, 'Vijayta', 'Shah');
insert into bds35_tab_prim values (1238, 'Vijan', 'Shah');

drop table if exists bds35_tab_fore;
create table bds35_tab_fore(
order_id int not null,
order_number int not null,
ID int,
PRIMARY KEY (order_id),
CONSTRAINT FK_PersonOrder FOREIGN KEY (ID)
REFERENCES bds35_tab_prim(ID)
);

insert into bds35_tab_fore values (7651234, 98765, 1234);
insert into bds35_tab_fore values (7651235, 98765, 1234);
insert into bds35_tab_fore values (7651236, 98765, 1234);
insert into bds35_tab_fore values (7651237, 98765, 1234);
insert into bds35_tab_fore values (7651238, 98765, 1234);

insert into bds35_tab_fore values (7651239, 98766, 1235);
insert into bds35_tab_fore values (7651240, 98766, 1235);
insert into bds35_tab_fore values (7651241, 98766, 1235);
insert into bds35_tab_fore values (7651242, 98766, 1235);
insert into bds35_tab_fore values (7651243, 98766, 1235);

insert into bds35_tab_fore values (7651244, 98767, 1236);
insert into bds35_tab_fore values (7651245, 98767, 1236);
insert into bds35_tab_fore values (7651246, 98767, 1236);
insert into bds35_tab_fore values (7651247, 98767, 1236);
insert into bds35_tab_fore values (7651248, 98767, 1236);

insert into bds35_tab_fore values (7651249, 98768, 1237);
insert into bds35_tab_fore values (7651250, 98768, 1237);
insert into bds35_tab_fore values (7651251, 98768, 1237);
insert into bds35_tab_fore values (7651252, 98768, 1237);
insert into bds35_tab_fore values (7651253, 98768, 1237);

insert into bds35_tab_fore values (7651254, 98769, 1238);
insert into bds35_tab_fore values (7651255, 98769, 1238);
insert into bds35_tab_fore values (7651256, 98769, 1238);
insert into bds35_tab_fore values (7651257, 98769, 1238);
insert into bds35_tab_fore values (7651258, 98769, 1238);

select * from bds35_tab_fore;

select * from bds35_tab_nn;

select * from bds35_tab_nn
where
fname = 'Pritam';

select * from bds35_tab_nn
where 
id = 1192;

select * from bds35_tab_nn
where
fname = 'Pritam' and id=1192;

select * from bds35_tab_nn
where
fname = 'Pritam' or id=1192;

select * 
from 
bds35_tab_prim a,
bds35_tab_fore b
where 
a.id = b.id;

select * from
bds35_tab_prim where
lname = "Shah";

select * 
from 
bds35_tab_prim a,
bds35_tab_fore b
where 
a.id = b.id;

select * 
from 
bds35_tab_prim a,
bds35_tab_fore b
where 
a.id = b.id and
a.lname = 'Shah';

select * 
from 
bds35_tab_prim a,
bds35_tab_fore b
where 
a.id = b.id and
a.fname = 'Vijay' and
a.lname = 'Shah';

select * from
bds35_tab_prim a,
bds35_tab_fore b
where
a.id = b.id and
b.order_id > 7651238 and b.order_id < 7651258 and
b.order_number > 98765 and b.order_number < 98768;

select * from
bds35_tab_prim a,
bds35_tab_fore b
where
a.id = b.id and
b.order_id between 7651238 and 7651258 and
b.order_number between 98765 and 98768;

update bds35_tab_nn
set fname = "HariOm"
where id = 1191;

select * from bds35_tab_nn;
select * from bds35_tab_fore;

update bds35_tab_fore set ID = 1211 where order_number = 98765;
/*
update bds35_tab_fore set ID = 1211 where order_number = 98765	
Error Code: 1452. Cannot add or 
update a child row: a foreign key constraint fails 
(`sys`.`bds35_tab_fore`, CONSTRAINT `FK_PersonOrder` 
FOREIGN KEY (`ID`) REFERENCES `bds35_tab_prim` (`id`))	0.000 sec
*/
update bds35_tab_fore set ID = 1211 where id = 1234;
/*
update bds35_tab_fore set ID = 1211 where id = 1234	
Error Code: 1452. Cannot add or 
update a child row: a foreign key constraint fails 
(`sys`.`bds35_tab_fore`, CONSTRAINT `FK_PersonOrder` 
FOREIGN KEY (`ID`) REFERENCES `bds35_tab_prim` (`id`))	0.016 sec
*/

delete from bds35_tab_fore where
id = 1234;

select * from bds35_tab_fore;

select * from bds35_tab_fore where
id = 1234;
