-- data manipulation language

use AdventureWorks2017;
go

-- SELECT (select, from, where, group by, having, order by)
select 'hello'; 
select 1 + 1;

select * -- horizontal filter
from Person.Person;

-- collation = character set is case insensitive, accent sensitive
-- A == a, â != a
select firstname, lastname
from Person.Person;

select firstname, lastname
from Person.Person
where firstname = 'john' or lastname = 'john'; -- vertical filter

select firstname, lastname
from Person.Person
where firstname <> 'john' and lastname <> 'john';

select firstname, lastname
from Person.Person
where (firstname >= 'k' and firstname < 'l') or (lastname >= 'k' and lastname < 'l');

select firstname, lastname
from Person.Person
where (firstname like 'k%') or (lastname like 'k%'); -- % wildcard, 0 or more characters

select firstname, lastname
from Person.Person
where (firstname like '%k') or (lastname like '%k%');

select firstname, lastname
from Person.Person
where (firstname like 'k__') or (lastname like '__k'); -- _ wildcard, exactly 1

select firstname, lastname
from Person.Person
where (firstname like '[k,z]%') or (lastname like '[a-d]_k'); -- a_k, b_k, c_k, d_k

select firstname, lastname
from Person.Person
where firstname = 'john'
group by firstname, lastname;

select firstname, lastname, count(*) as count -- aggregate count, average, sum
from Person.Person
where firstname = 'john'
group by firstname, lastname;

select firstname, lastname, count(*) as count
from Person.Person
where firstname = 'john' --vertical filter of records
group by firstname, lastname
having count(*) > 1; --vertical filter of groups

select firstname, lastname, count(*) as count
from Person.Person
where firstname = 'john'
group by firstname, lastname
having count(*) > 1
order by lastname desc, count desc;

select firstname, lastname, count(*) as johns
from Person.Person
where firstname = 'john'
group by firstname, lastname
having count(*) > 1
order by johns desc, lastname desc;

-- ORDER OF EXECUTION
--from
--where
--group by
--having
--select
--order by

-- INSERT
select *
from Person.Address
where AddressLine1 like '123 elm%';

insert into Person.Address(AddressLine2, AddressLine1, City, StateProvinceID, PostalCode, SpatialLocation, rowguid, ModifiedDate)
values
('123 elm street', 'suite 200',	'dallas',	14, 75200, 0xE6100000010C72C2B2242FE04A4016902E7EB1B7F8BF,	'fd069aaa-ad12-4a4c-a548-23b35dfeb242',	'2020-07-22')
,('123 elm street', 'suite 200',	'dallas',	14, 75200, 0xE6100000010C72C2B2242FE04A4016902E7EB1B7F8BF,	'fd069aaa-ad12-4a4c-a548-23b35dfeb242',	'2020-07-22')
,('123 elm street', 'suite 200',	'dallas',	14, 75200, 0xE6100000010C72C2B2242FE04A4016902E7EB1B7F8BF,	'fd069aaa-ad12-4a4c-a548-23b35dfeb242',	'2020-07-22')
,('123 elm street', 'suite 200',	'dallas',	14, 75200, 0xE6100000010C72C2B2242FE04A4016902E7EB1B7F8BF,	'fd069aaa-ad12-4a4c-a548-23b35dfeb242',	'2020-07-22')

-- UPDATE
update pa
set addressline2 = 'suite 200', addressline1 = '123 elm st'
from Person.Address as pa
where AddressLine1 = 'suite 200';

-- DELETE
delete pa
from Person.Address as pa
where AddressLine2 = 'suite 200';
go 

-- VIEW
create view vw_getpersons with schemabinding -- firstname and lastname cannot chnage for the lifetime of this view
as
select firstname, lastname
from Person.Person
go

select * from vw_getpersons; --read-only access to Person.Person
go

alter view vw_getpersons with schemabinding
as
select firstname, middlename, lastname
from Person.Person
go

drop view vw_getpersons;
go

-- FUNCTION

-- STORED PROCEDURE

-- JOIN

-- UNION

-- TRIGGER

-- TRANSACTION

-- ORM + Entity Framework Core + Data-first Approach
