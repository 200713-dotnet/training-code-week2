-- data definition language

use master;
go

-- CREATE

create database PizzaStoreDb; --project
go

create schema Pizza; --namespace
go

--constraints = datatype, key, default, check, null, ?
--number datatypes = tinyint (int8), smallint (int16), int (int32), bigint (int64), numeric, decimal, money
--text datatypes = text, ntext, varchar (ascii), nvarchar (utf-8), char (ascii), nchar(utf-8)
--datetime datatypes = date, time, datetime, datetime2
--boolean datatypes = bit

create table Pizza.Pizza
(
  PizzaId int not null primary key,
  Name nvarchar(250) not null,
  DateModified datetime2(0) not null,
  IsValid bit not null,
  constraint PK_PizzaId (PizzaId) primary key
);

create table Pizza.Crust
(

);

create table Crust
(

);

create table Pizza.Size
(

);

create table Pizza.Topping
(

);


-- ALTER

-- DROP

-- TRUNCATE
