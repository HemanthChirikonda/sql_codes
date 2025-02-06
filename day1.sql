



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

update  set phonenumber = 1009887766 where id = 4;

 set SQL_SAFE_UPDATES = 1;
 
-- find a students whose first name starts with 'r'

select * from student where firstname like 'r%'; --   

-- find a students whose first name ends with 'r'

select * from student where firstname like '%r';

-- find a students whose first name contains 'r'

select * from student where firstname like '%r%'; 

select * from student where phonenumber like '%6'; 

