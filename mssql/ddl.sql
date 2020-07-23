-- data definition language

use master;
go

-- CREATE

create database PizzaStoreDb; --project
go

create schema Pizza; --namespace
go

--constraints = datatype, key, default, check, null, computed
--number datatypes = tinyint (int8), smallint (int16), int (int32), bigint (int64), numeric, decimal, money
--text datatypes = text, ntext, varchar (ascii), nvarchar (utf-8), char (ascii), nchar(utf-8)
--datetime datatypes = date, time, datetime, datetime2
--boolean datatypes = bit

create table Pizza.Pizza
(
  PizzaId int not null primary key, -- identity(seed, step)
  CrustId int null foreign key references Pizza.Crust(CrustId), -- least likely
  SizeId int null,
  [Name] nvarchar(250) not null,
  DateModified datetime2(0) not null,
  Active bit not null default 1,
  constraint SizeId foreign key references Pizza.Size(SizeId)
);

create table Pizza.Crust
(
  CrustId int not null,
  [Name] nvarchar(100) not null,
  Active bit not null,
  constraint CrustId primary key,
  constraint Active default 1
);

create table Pizza.Size
(
  SizeId int not null,
  [Name] nvarchar(100) not null,
  Active bit not null
);

create table Pizza.Topping
(
  ToppingId int not null,
  PizzaId int not null,
  [Name] nvarchar(100) not null,
  Active bit not null
);

create table Pizza.PizzaTopping
(
  PizzaToppingId int not null,
  PizzaId int not null,
  ToppingId int not null,
  Active bit not null
)
go

-- ALTER
alter table Pizza.Size
  add constraint PK_Size_SizeId SizeId primary key

alter table Pizza.Topping
  add constraint PK_Topping_ToppingId ToppingId primary key

alter table Pizza.PizzaTopping
  add constraint PK_PizzaTopping_PizzaToppingId PizzaToppingId primary key

alter table Pizza.PizzaTopping
  add constraint PK_PizzaTopping_PizzaId PizzaId foreign key references Pizza.Pizza(PizzaId)

alter table Pizza.PizzaTopping
  add constraint PK_PizzaTopping_ToppingId ToppingId foreign key references Pizza.Topping(ToppingId)

-- DROP
-- replication, backup(full, incremental, differential), failover
drop table Pizza.Pizza;
drop schema Pizza;
drop database PizzaStoreDb; -- development

-- TRUNCATE

truncate table Pizza.Pizza;
truncate schema Pizza;
truncate database PizzaStoreDb;
