--------UC1-Create Address Book---------
create database Address_Book;
use Address_Book;
--------UC2-Create Table-------------
CREATE TABLE ADDRESS_BOOK
(
Id int identity (1,1) primary key,
first_Name varchar(150),
last_Name varchar(150),
address varchar(250),
city varchar(100),
state varchar(200),
zip int,
phoneNumber bigint,
email varchar(250)
);
----------------------UC3-Insert Contact --------------------
INSERT INTO ADDRESS_BOOK(first_Name,last_Name,address,city,state,zip,phoneNumber
,email)
VALUES('Shweta','Sapkal','At post Chinchner Vandan tal. dist satara','Satara','Maharashtra',456378,9876543210,'sdf@gmail.com');

INSERT INTO ADDRESS_BOOK(first_Name,last_Name,address,city,state,zip,phoneNumber
,email)
VALUES('Snehal','Jagtap','At post Pali','Pali','Maharashtra',543216,9988776655,'abcd39@gmail.com');
INSERT INTO ADDRESS_BOOK(first_Name,last_Name,address,city,state,zip,phoneNumber
,email)
VALUES('Swapnil','Sapkal','At post Chinchner Vandan tal. dist satara','Satara','Maharashtra',456378,9877004422,'xyz65@gmail.com');

select *from ADDRESS_BOOK;

---------------------UC4-Edit existing contact----------------------
UPDATE ADDRESS_BOOK
SET first_Name='Suresh' WHERE Id=1;
select *from ADDRESS_BOOK;

--------------------UC5-Delete person using name----------------------
DELETE from ADDRESS_BOOK WHERE first_Name='Swapnil';
select *from ADDRESS_BOOK;

-----------------UC6-Retrieve Person belonging to city Or State-------------- 
select Id,first_Name,last_Name,address,state,zip,phoneNumber,email from ADDRESS_BOOK WHERE city='Satara';

----------------UC7-understand Size of AddressBook by city and state------------
select CoUNT(*) as StateCount, state from ADDRESS_BOOK group by state;
select COUNT(*) as CityCount,city from ADDRESS_BOOK group by city;
