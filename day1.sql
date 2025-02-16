



-- SQL : Structured query Language 
-- MySQL
-- PostgreSQL
-- Oracle SQL 
-- IBM Db2
-- MS SQL


-- DBMS -> Database Management System 

-- No SQL 

-- Database 
     -- Tables 
         -- Columns (Column names) 
		 -- Rows (Data)
         
-- Tables is in the form of Rows and Columns. 
-- Table is called as an "Entity".
-- Columns are called "Fields or attributes".
-- Rows are called as "Records or Tuples".
-- We uses quries to get the Data, or insert the data or update data, delete data.
-- Schemas are nothing but a database sturecture. 


-- SQL -> sub languages -> conception catagories of the functionality of SQL standard. 
-- DDL -> Data definition Language 
-- DML -> Data Manipulation Language 
-- DQL -> Data Query Language 
-- DCL -> Data Control Language 
-- TCL -> Transaction Control Lanuage 



-- DDL -> Data definition Language 
-- it defines the overall data structure -> database, tables and columns 
-- Commands 
    -- create  -> used to create a new database or tables 
    -- alter   -> changes the exiting database or table 
    -- drop    -> removes the databse or table 
    -- truncate -> delete the whole data inside a table but not the structure of data(table)


-- DML -> Data Manipulation Language 
-- its all about handling the data inside a table
-- CRUD => create(insert), read, update, delete 
-- Commands
       -- insert -> it will insert the new data or record or row in table.
       -- update  -> update the exiting data
       -- delete  -> remove the existing data
       -- select  -> acesses or read the data from a table 
       -- these select statements are called quries in SQL

-- DQL -> Data Query Language 
-- select  -> acesses or read the data from a table 
-- select statements are called quries in SQL


-- DCL -> Data Control Language 
-- This is used to grant the level of access to the various users to access the database. 
-- Commands 
    -- Grant 
    -- Revoke 
    
    
-- TCL -> Transaction Control Lanuage 
--  This is releted to transactions. there are group of releted SQL statements to ensure that they succeed or fail collectively.
--  Commands                
      -- Begin 
      -- Commit 
      -- Rollback 
      -- Set
    
    
-- MYSQL Data types 
-- a data type is a constraint upon a column in table indicating that only that type of data can be held in that column
-- VARCHAR(size)  -> it is a set of characters(like a string), we can max limit the number of characters with size.
   -- ex : varchar(2) => 'ch', 'a'
   --      varchar(5) => 'werty', 'ab%3e', '3', '', 'as', 'abc'

-- BOOL / BOOLEAN ->  stored as a bit value , 0 -> false , any other int value is true.   
-- INT / INTEGER(size) ->  a medium signed interger value   -2147483648 to 2147483647 
       -- ex : int(3) => 1, 13, 145, 999
--  LONG , BIGINT
-- FLOAT(size, decimal) -> size -> defines the max number of total digits 
					  -- -> decimal -> defines the number of digits after the decimal point. 
	    -- ex: FLOAT(4, 2). 14.00 , 24.35, 78.81, 12.34 
        --     467.5617  => FLOAT(7, 4)
        --     467.12    => FLOAT(5, 2)
        --     046.0     => FLOAT(4,1)    => 1.1, 12.1, 123.1, 1, 12, 999     
		--     rate => 7.10, 5.25, 12.25, 24.75 , 99.99 => FLOAT(4,2)
        
-- DOUBLE(size, decimal) -> it can take larget numbers then float. 
-- TIMESTAMP -> secific moment in time -> format is yyyy_mm_dd hh:mm:ss 
-- single quotes -> varchar, dates, datetime, timestamp, time, blob, text
-- int, float, double

-- Null values represent missing or unkonwn data

-- Null is not equal to Zero, null means empty space. 

-- ------------------------------------------------------  write - select - run 

create database pnt_db;
drop database pnt_db;

use pnt_db;

create table person(
id int(3), 
age int(3),
firstname varchar(20),
lastname varchar(20), 
phonenumber bigint, 
email varchar(30),
address varchar(200),
city varchar(10)
);

show tables;

select * from person;  -- read data from table     -- * means all columns 

drop table person;  -- delete a table

alter table person rename column phonenumber to mobilenumber;

alter table person drop column city;

alter table person add column zipcode int(5);

alter table person modify column id int(8);

alter table person modify column id bigint;

insert into person(id, age, firstname, lastname, mobilenumber, email, address, zipcode)
values(1, 25, 'bob', 'miller', 1234567890, 'bmiller@gmail.com', 'Fairfax, VA', 22042);
     
select * from person;

-- Different database 
-- Create a 2 tables inisde database, with atlest 6 columns 
-- Fill 10 rows in a table


create table employee (
id int, 
firstname varchar(30), 
lastname varchar(30), 
phonenumber bigint, 
email varchar(20), 
salary double(7,2),
city varchar(20)
);

insert into employee (id, firstname, lastname,phonenumber, email, salary, city)
value(1, 'jack', 'miller', 1234567890, 'jmiller@email.com', 3200.00, 'Fairfax'),
(2, 'jhon', 'wick', 0987654321, 'jwick@email.com', 5200.00, 'Ashburn'),
(3, 'Batman', 'Dc', 2345678901, 'bdc@email.com', 4600.00, 'Fairfax'),
(4, 'Ironman', 'marvel', 345678901, 'imarvel@email.com', 6200.00, 'Fairfax');


select * from employee;

insert into  employee (id, firstname, lastname)
value(5, 'spiderman', 'marvel');

select * from employee;

insert into  employee (id, phonenumber, email)
value(5, 4567812390, 'sggy@email.com');

select * from employee;


-- SQL constraints 
-- We use it to specity rules for the data in a table 
-- NOT NULL -> ensures that a column can not have a null values 
-- UNIQUE  -> ensures that a column cann not have duplicate values.
-- PRIMARY KEY -> combination of NOT NULL and UNIQUE and Identification 
-- FOREIGN KEY -> prevents that any action would destory links between tables 
-- CHECK -> enusres that values in a column statisfies a specific condition
-- DEFAULT -> it will set a default values for a column

-- ------------------------------------------------------------------------

create table student(
id int primary key, 
firstname varchar(20) not null,
lastname varchar(20), 
phonenumber bigint unique, 
email varchar(35) not null unique, 
address varchar(20) default 'VA',
age int(2) check(age > 10)
);

insert into student(id, firstname, lastname, phonenumber, email, address, age)
value(1, 'ana', 'aa', 1234567890, 'ana@gmail.com', 'PA', 12);

insert into student(id, firstname, lastname, phonenumber, email)
value(2, 'jim', 'jj', 2234567890, 'jim@gmail.com');

insert into student(id, firstname, lastname, phonenumber, email, age)
value(3, 'roy', 'rr', 'roy@gmail.com', 15);

insert into student(id, firstname, lastname, phonenumber, email, address, age)
value(4, 'jack', 'rome', 0987612345, 'rome@gmail.com', 'NA', 11),
(5, 'Rose', 'jonson', 1234554321, 'jonson@gmail.com', 'AZ', 16),
(6, 'Kimber', 'roder', 0987667890, 'kimber@gmail.com', 'NY', 14),
(7, 'lilly', 'little', 2345665432, 'lilly@gmail.com', 'MA', 13),
(8, 'john', 'wick', 3456776543, 'john@gmail.com', 'OH', 12),
(9, 'santa', 's', 4567887654, 'santa@gmail.com', 'NC', 11),
(10, 'omar', 'oling', 5678998765, 'omar@gmail.com', 'MA', 15),
(11, 'bunny', 'butter', 6789009876, 'bunny@gmail.com', 'NY', 16);


select * from student;


-- Operators 

-- = Equal 
-- <> or != not eqaul 
-- > greather than 
-- < Less than 
-- >=
-- <=
-- BETWEEN  => data between an inclusive range
-- LIKE   => serach for pattern
-- IN.    => To specity multiple possible values for a column
-- AND.  => condition2 and condition2 => both are true then you will get the data
-- OR.   => condition2 and condition2 => if even one is true then you will get the data
-- NOT.  


-- --------------------------------------------------------------------------------------------


select * from student;

select id, firstname, age, email from student;

-- find the students whose age > 15

select * from student where age >15;


-- find the students age and email and firstname whose age is <= 14

select age, email, firstname from student where age <=14;

-- find the students who does not belong to VA
select * from student where address != 'VA';

-- find students whose age is less than 14 and  does not belong to VA

select * from student where age < 14 and address != 'VA';

-- find the students who belongs to PA, MA, NY

select * from student where address in ('PA', 'MA', 'NY');

-- find the students who does not belongs to PA, MA, NY
select * from student where address not in ('PA', 'MA', 'NY');

-- finding the Airbnb
-- location, price range = 200
-- select * from airbnb.properties where location = '-----' and price < 200;

-- find the students who belongs (10 - 15)
select * from student where age between 10 and 15;

-- find the students whose age is present in table
select * from student where age is not null;

select * from student where age is null;
 
 -- note : never use a update without where 
 
update student set age = 11;

-- update the phonenumber of jack 

update  student set phonenumber = 1009887766 where id = 4;

 set SQL_SAFE_UPDATES = 1;
 
-- find a students whose first name starts with 'r'

select * from student where firstname like 'r%'; --   

-- find a students whose first name ends with 'r'

select * from student where firstname like '%r';

-- find a students whose first name contains 'r'

select * from student where firstname like '%r%'; 

select * from student where phonenumber like '%6'; 

use pnt_db;

create table product(
id int primary key, 
name varchar(20),
price double(5,2), 
rating float(4,2)
);

select * from product;

insert into product (id, name, price, rating)
value(1, 'tv', 100.00, 4.20),
(2, 'remote', 20.00, 3.2),
(3, 'laptop', 359.99, 2.15),
(4, 'phone', 599.99, 4.65),
(5, 'Box', 180.10, 2.86),
(6, 'Tab', 99.99, 3.35),
(7, 'Motor', 87.99, 3.35),
(8, 'Cup', 3.99, 2.87),
(9, 'plate', 10.99, 4.56),
(10, 'Pellow', 20.99, 3.56),
(11, 'Toy Car', 399.99, 4.99),
(12, 'pen', 1.99, 2.99),
(13, 'Craft Cart', 999.99, 4.98);

-- SUM, AVG, MIN, MAX, COUNT 

select MAX(price) as max_price from product;

select AVG(rating) as avg_rating from product;

select MIN(price) as min_price from product;

select sum(price) as sum_of_products from product;

select count(id) as count_of_products from product;


insert into product(id, name, price, rating)
value(14, 'tv', 200.99, 4.1),
(15, 'tv', 599.99, 2.8),
(16, 'tv', 349.99, 3.8),
(17, 'tv', 249.99, 4.56); 

select * from product;

-- Find the no of tvs, total_cost, avg_rating, maxprice, minprice, max_rating, min_rating

select count(name) as no_of_tvs, 
sum(price) as total_cost, 
avg(rating) as avg_rating, 
max(price) as max_price, 
min(price) as min_price,
max(rating) as max_rating, 
min(rating) as min_rating   
from product where name = 'tv';



-- Multiplicity

-- 1:1 -> one to one 
-- 1:N or N: 1 -> one to Many or Many to one
-- N:N -> Many to Many 


create table citizen(
id int primary key, 
firstname varchar(20) not null,
lastname varchar(20), 
phonenumber bigint unique, 
email varchar(35) not null unique, 
address varchar(20) default 'VA',
age int(2) 
);

insert into citizen(id, firstname, lastname, phonenumber, email, address, age)
value(1, 'ana', 'aa', 1234567890, 'ana@gmail.com', 'PA', 32);

insert into citizen(id, firstname, lastname, phonenumber, email)
value(2, 'jim', 'jj', 2234567890, 'jim@gmail.com');

insert into citizen(id, firstname, lastname, phonenumber, email, age)
value(3, 'roy', 'rr',776655443399, 'roy@gmail.com', 25);

insert into citizen(id, firstname, lastname, phonenumber, email, address, age)
value(4, 'jack', 'rome', 0987612345, 'rome@gmail.com', 'NA', 21),
(5, 'Rose', 'jonson', 1234554321, 'jonson@gmail.com', 'AZ', 31),
(6, 'Kimber', 'roder', 0987667890, 'kimber@gmail.com', 'NY', 26),
(7, 'lilly', 'little', 2345665432, 'lilly@gmail.com', 'MA', 19),
(8, 'john', 'wick', 3456776543, 'john@gmail.com', 'OH', 34),
(9, 'santa', 's', 4567887654, 'santa@gmail.com', 'NC', 43),
(10, 'omar', 'oling', 5678998765, 'omar@gmail.com', 'MA', 23),
(11, 'bunny', 'butter', 6789009876, 'bunny@gmail.com', 'NY', 28);

delete from citizen where id = 2;

select * from citizen;

create table ssn_table(
ssn_id int primary key, 
ssn_value varchar(10), 
citizenId int unique not null, 
foreign key(citizenId) references citizen(id)
);

insert into ssn_table(ssn_id, ssn_value, citizenId)
value(3, '987654321', 11);

select* from ssn_table;

create table cars(
car_id int primary key, 
car_name varchar(20), 
car_model varchar(20), 
ownerId int, 
foreign key(ownerId) references citizen(id)
);

insert into cars(car_id, car_name, car_model, ownerId)
value(1, 'Toyota', 'Camry', 1);

insert into cars(car_id, car_name, car_model, ownerId)
value(2, 'Lexus', 'ES 350', 10),
(3, 'Mazda', 'CX 50', 1),
(4, 'Honda ', 'CRV', 3),
(5, 'Volvo', 'XC 60', 10)
;

insert into cars(car_id, car_name, car_model)
value(6, 'Ford', 'Explorer' ),
(7, 'BMW', 'SLC');


select * from cars;


create  table orders (
id int primary key, 
total double, 
invoice_number varchar(20), 
order_date date, 
customer_id int, 
foreign key(customer_id) references citizen(id)
);


create table products_orders(
id int primary key, 
productId int not null,
orderId int not null, 
foreign key(productId) references product(id),
foreign key(orderId) references orders(id)
);


insert into orders(id, total, invoice_number, order_date, customer_id) 
value (1, 120.25, 'ABC124', '2025-01-12', 6);


insert into orders(id, total, invoice_number, order_date, customer_id) 
value (2, 599.99, 'BCD345', '2025-01-25', 3),
(3, 249.99, 'CDF456', '2025-01-31', 8),
(4, 86.99, 'DEF768', '2025-02-01', 5),
(5, 29.99, 'EFG098', '2025-01-02', 11),
(6, 345.99, 'FGH123', '2025-01-05', 9);

select * from orders;
select * from product;

insert into products_orders(id, productId, orderId)
value(1, 1, 1),
(2, 2, 1),
(3, 4, 2),
(4, 7, 3),
(5, 6, 3), 
(6, 7, 4),
(7, 12, 4);

select * from products_orders;

select o.*,p.* from orders o inner join products_orders po on po.orderId = o.id
inner join product p on po.productId = p.id;


-- student2 -> many to one -> Teacher 
-- student2 -> many to many -> course 



-- Joins 

-- INNER JOIN 
-- LEFT JOIN 
-- RIGHT JOIN 
-- FULL JOIN 
-- SELF JOIN 



select * from citizen;

select * from cars;

select * from citizen  inner join cars on citizen.id = cars.ownerId;

select * from citizen left join  cars on citizen.id = cars.ownerId;

select * from citizen right join  cars on citizen.id = cars.ownerId;

select * from citizen full join  cars ;

select A.* from cars A,  cars B where A.car_name = B.car_name and A.car_id != B.car_id;

select * from cars;


insert into cars(car_id, car_name, car_model)
value(8, 'Lexus', 'RX 450'),
(9, 'Mazda', 'mazda 6'),
(10, 'Honda ', 'acord'),
(11, 'Volvo', 'XC 90' )
;


-- where  => this will filter the data before joining the table. 
-- having => this will filter the data after joining the table. 

select * from citizen  inner join cars on citizen.id = cars.ownerId;

-- find the people whose age less than 25 and has the car. 

select * from citizen  left join cars on citizen.id = cars.ownerId where citizen.age <=25;


select * from citizen  left join cars on citizen.id = cars.ownerId having citizen.age <=25;




-- group by 
-- groups are rows that have same values into summy rows like sum/svg/count
-- groups are used to get the summary details. 

select citizen.*, count(cars.car_id) as no_of_cars from citizen  
left join cars on citizen.id = cars.ownerId 
group by citizen.id;


-- find the people who is atlest 2 car. 

select citizen.*, count(cars.car_id) as no_of_cars from citizen  
left join cars on citizen.id = cars.ownerId 
 group by citizen.id having no_of_cars >= 2;
 
 select * from citizen where no_of_cars >= 2; 
  select * from cars;
 

-- sub quries 

 select * from citizen;
 
 -- find the oldest person's details.
 
 select  * from citizen where age =(select max(age) from citizen);
 

 -- order by 
 
  select  * from citizen order by age asc;   
  
   
  select  * from citizen order by age desc;  
  
  
  select  * from citizen order by address asc, lastname desc;  
  
  
  
  -- limit                  limit
select  * from citizen limit  3;
--                        offset, limit
select  * from citizen limit  2,    4;
    
   -- by using the limit  find the second oldest person. 
   
 select * from  citizen order by age desc limit 1, 1; 
 
 
 -- auto_increment
 
 
 create table people(
id int primary key auto_increment, 
firstname varchar(20) not null,
lastname varchar(20), 
phonenumber bigint unique, 
email varchar(35) not null unique, 
address varchar(20) default 'VA',
age int(2) 
);
 
 insert into people( firstname, lastname, phonenumber, email, address, age)
value( 'ana', 'aa', 1234567890, 'ana@gmail.com', 'PA', 32);

insert into people( firstname, lastname, phonenumber, email)
value( 'jim', 'jj', 2234567890, 'jim@gmail.com');

insert into people( firstname, lastname, phonenumber, email, age)
value( 'roy', 'rr',776655443399, 'roy@gmail.com', 25);

insert into people( firstname, lastname, phonenumber, email, address, age)
value( 'jack', 'rome', 0987612345, 'rome@gmail.com', 'NA', 21),
( 'Rose', 'jonson', 1234554321, 'jonson@gmail.com', 'AZ', 31),
( 'Kimber', 'roder', 0987667890, 'kimber@gmail.com', 'NY', 26),
( 'lilly', 'little', 2345665432, 'lilly@gmail.com', 'MA', 19),
( 'john', 'wick', 3456776543, 'john@gmail.com', 'OH', 34),
( 'santa', 's', 4567887654, 'santa@gmail.com', 'NC', 43),
( 'omar', 'oling', 5678998765, 'omar@gmail.com', 'MA', 23),
( 'bunny', 'butter', 6789009876, 'bunny@gmail.com', 'NY', 28);

select * from people;


-- ACID
-- Transactions, the grouping of SQL statements so that they all succeed or fail together, requires
-- the adherence to 4 properties. These properties are remembered by the name ACID and are
-- common database terms.
-- • Atomicity – A transaction must fully succeed, and all changes are made or be fully rolled back
-- and no changes are made to the database.
-- • Consistency – Relationships in the database must be valid when a transaction finishes. You can
-- not have “orphaned reference” in FKs for instance. E.g. if I delete and address from the database
-- I have to delete all references to that address in the users table for the transaction to complete.
-- • Isolation – Transaction must run independently of each other. I.e. no transaction should be
-- dependent of another transaction’s completion in order to complete. How isolated transactions
-- are from each other is set by the database’s Transaction Level and will be determined based on
-- the sensitivity of data and the need for rapid, multithreaded transaction processing.
-- • Durability – Transactions when they commit should persist through catastrophic failure. E.g. a
-- system crash or power outage.


-- Data Normalization:
-- • Normalization is a tiered structure for designing databases to reduce redundancy of data
-- storage. This increases efficiency in the database.
-- • Each level of normalization is called a “normal form”. If no attempt at normalization is made, the
-- database is said to be in 0 Normal Form.
-- • There are 3 generally used normal forms in the real world. There are more beyond that that
-- have been defined; however, these are difficult to implement and rarely have much impact in a
-- real-world scenario and are therefore more academic.
-- • 1st Normal Form – Atomic Data (data values stored should be broken down in the smallest
-- amount of meaningful data possible) and Primary Keys.
-- • 2nd Normal Form – 1st NF plus no partial dependencies. You can achieve this by having single
-- column PKs. A partial dependency is a value that can be determined by only accessing one
-- column in the PKs information.
-- • 3rd Normal Form – 2nd NF plus no transitive dependencies. A transitive dependency is when one
-- value can be fully determined by another value in the same record that is not the primary. If
-- that is the case then the value should be moved to another table the determinating value should
-- be made a foreign key to that other table.