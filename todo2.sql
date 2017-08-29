-- to start postgresql
brew services start
postgresql

-- to create db
createdb todolist

-- to check list of db
psql todolist
-- to create table
create table todos
(
    id serial primary key,
    title varchar(255) not null,
    details text null,
    priority int default '1' not null ,
    created_at varchar (0) not null,
    completed_at timestamp (0) null,
);
-- to view the table
select *
from todos;
-- INSERT statement to the table
insert into todos
    (title, details, priority, created_at, completed_at)
values
    ('clean house', 'vacuum, wash windows', 2, '2017-08-22 02:06:19', null),
    ('do homework', 'read and study', 5, '2017-08-23 02:06:19', null),
    ('make dinner', 'prep and cook food', 3, '2017-07-27 02:06:19', null),
    ('exercise', 'go to gym', 4, '2017-08-28 02:06:19', null),
    ('learn sql', 'do activity', 1, '2017-08-28 02:06:19', '2017-08-28 02:06:19');
-- SELECT statement to find all incomplete todos
select title
from todos
where completed_at is null;
-- or 
select *
from todos
where completed_at is null;
-- SELECT statement to find all todos with a priority above 1
select *
from todos
where priority > 1;
-- UPDATE statement to complete one todo by its id
update todos set completed_at = '2017-09-17 02:06:19' where id =3;
-- DELETE statement to delete all completed todos
delete from todos where completed_at is not null;
---------------------PART TWO-----------------
--INSERT statements to insert 20 todos into the todos table, 
--with a combination of priorities, created times, and completed times, 
--with not all having a completed time.
-- to start postgresql
brew services start postgresql

-- to check list of db
psql todolist
-- to view the table
select *
from todos;
insert into todos
    (title, details, priority, created_at, completed_at)
values
    ('run', 'go outside', 2, '2017-03-22 02:06:19', null),
    ('read', 'with a book', 5, '2017-04-23 02:06:19', null),
    ('paint', 'paint new picture', 3, '2017-05-27 02:06:19', '2017-07-28 02:06:19'),
    ('photograph', 'take pictures', 2, '2017-02-28 02:06:19', null),
    ('pay bills', 'schedule payments online', 1, '2017-05-28 02:06:19', '2017-08-28 02:06:19'),
    ('drive around town', 'learn backroads', 2, '2017-05-22 02:06:19', null),
    ('go for walk', 'at neighborhood park', 3, '2017-06-23 02:06:19', '2017-08-28 02:06:19'),
    ('feed dog', 'feed when I get home', 3, '2017-07-27 02:06:19', null),
    ('play scrabble', 'using board game at home', 4, '2017-02-28 02:06:19', null),
    ('basket weaving', 'with basket materials', 1, '2017-09-28 02:06:19', '2017-08-28 02:06:19'),
    ('play tennis', 'at neighborhood tennis court', 3, '2017-09-22 02:06:19', null),
    ('learn russian', 'read and study', 4, '2017-05-23 02:06:19', '2017-07-28 02:06:19'),
    ('make cake', 'curtis has a birthday Thursday', 3, '2017-02-27 02:06:19', null),
    ('call mom', 'call her after class', 4, '2017-01-28 02:06:19', '2017-02-28 02:06:19'),
    ('mail postcards', 'use cards at home', 1, '2017-04-28 02:06:19', '2017-08-28 02:06:19'),
    ('get haircut', 'Aveda salon in Cool Springs', 1, '2017-06-22 02:06:19', null),
    ('meet with bethany', 'discuss future', 5, '2017-03-23 02:06:19', '2017-8-28 02:06:19'),
    ('talk to buffy', 'figure out homework', 1, '2017-02-27 02:06:19', null),
    ('do homework', 'get caught up on assignments', 2, '2017-08-28 02:06:19', null),
    ('watch movie', 'find one on netflix', 4, '2017-08-28 02:06:19', '2017-08-28 02:06:19');
--Write a SELECT statement to find all incomplete todos with priority 3.
select *
from todos
where priority = 3 and completed_at is null;
--Write a SELECT statement to find the number of incomplete todos by priority.
select count(completed_at is null)
from todos
group by priority;
--Write a SELECT statement to find the number of todos by priority created in the last 30 days.
select priority, count(priority), created_at
from todos
where created_at >= '2017-07-30 0:00:00'
group by priority, created_at
order by priority asc;
--Write a SELECT statement to find the next todo you should work on. 
--This is the todo with the highest priority that was created first.
select *
from todos
where priority = 1 and created_at = (select min(created_at)
    from todos
    where priority = 1);
