-- to start postgresql
brew services start postgresql

-- to create db
createdb todolist

-- to check list of db
psql todolist

-- to create table
create table todos (
id serial primary key, 
title varchar(255) not null,
details text null,
priority int default '1' not null ,
created_at varchar (0) not null,
completed_at timestamp (0) null,
); 

-- to view the table
select * from todos;

-- INSERT statement to the table
insert into todos (title, details, priority, created_at, completed_at)
values ('clean house', 'vacuum, wash windows', 2, '2017-08-22 02:06:19', null),
('do homework', 'read and study', 5, '2017-08-23 02:06:19', null),
('make dinner', 'prep and cook food', 3, '2017-07-27 02:06:19', null),
('exercise', 'go to gym', 4, '2017-08-28 02:06:19', null),
('learn sql', 'do activity', 1, '2017-08-28 02:06:19', '2017-09-28 02:06:19');

-- SELECT statement to find all incomplete todos
select title from todos where completed_at is null;
-- or 
select * from todos where completed_at is null;

-- SELECT statement to find all todos with a priority above 1
select * from todos where priority > 1;

-- UPDATE statement to complete one todo by its id
update todos set completed_at = '2017-09-17 02:06:19' where id =3;

-- DELETE statement to delete all completed todos
delete from todos where completed_at is not null;