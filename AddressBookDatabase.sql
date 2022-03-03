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
VALUES('Swapnil','Sapkal','At post Chinchner Vandan tal. dist satara','Satara','Maharashtra',456378,9877004422,'xyz65@gmail.com'),
('Swagata','sawant','At post Degaon','Benglore','Karnataka',543216,9966223344,'gtyh43@gmail.com');

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

----------------UC8-Retrieve entries sorted alphabetically by person name---------------
select *from Address_Book order by first_Name;

---------------UC9-Identify Address Book With name and Type--------------------------
ALTER TABLE ADDRESS_BOOK add ContactType varchar(100)not null default 'friends';
update Address_Book set ContactType='Family' WHERE first_Name='Swapnil';

---------------UC10-Get Contact person count by type-------------------
select COUNT(ContactType) as TypeCount, ContactType from ADDRESS_BOOK group by ContactType;

--------------UC11-Add person to both friends and family-------------
INSERT INTO ADDRESS_BOOK(first_Name,last_Name,address,city,state,zip,phoneNumber,email,ContactType)
VALUES('Lata','Sapkal','Dahiwadi','Dahiwadi','Maharashtra',987654,8765432123,'tgfr654@gmail.com','Family'),
('Lata','Sapkal','Dahiwadi','Dahiwadi','Maharashtra',987654,8765432123,'tgfr654@gmail.com','Friend');
select * from ADDRESS_BOOK;
--------------UC12-Creating table using ER Diagram-------------------
Create table AddressBook(
						AddressBookId Int Identity(1,1) Primary Key,
						AddressBookName varchar(100)
						);
Create table PersonDetail
						(
						PersonId Int Identity(1,1) Primary Key,
						AddressBookId Int Foreign Key References AddressBook(AddressBookId),
						FirstName varchar(50),
						LastName varchar(50),
						Address varchar(255),
						City varchar(50),
						StateName varchar(50),
						ZipCode int,
						PhoneNum bigint,
						EmailId varchar(50));
CREATE table PersonTypes(
	PersonTypeId Int Identity(1,1) Primary Key,
	PersonType varchar(50),
);

CREATE table PersonsDetailType(
	PersonId Int Foreign Key References PersonDetail(PersonId),
	PersonTypeId Int Foreign Key References PersonTypes(PersonTypeId)
);

--------------Inserting Values in thae table-----------
---------Inserting values in the AddressBook----------------
INSERT INTO AddressBook(AddressBookName) Values('Home'),('school'),('college'),(' office');
select *from AddressBook;
---------Inserting values into persontype--------------
INSERT INTO PersonTypes(PersonType) VALUES('Family'),('schoolFriend'),('friend'),('Profession');
select *from PersonTypes;
------------Insert values in person detail table-------------
Insert INTO PersonDetail VALUES(1,'Suresh','sapkal','At post Chinchner Vandan tal. dist satara','Satara','Maharashtra',456378,9876543210,'sdf@gmail.com'),
								(2,'Snehal','Jagtap','At post Pali','Pali','Maharashtra',543216,9988776655,'abcd@gmail.com'),
								(3,'Swapnil','Sapkal','At post Rahimatpur','Rahimatpur','Maharashtra',654321,9876554433,'xyz@gamil.com'),
								(4,'Shweta','Sapkal','Pimpri','Pune','Maharashtra',765432,9988664422,'pqr34@gmail.com');
select *from PersonDetail;
-----------Insert values in person detail type-------------
INSERT INTO PersonsDetailType(PersonId,PersonTypeId) VALUES(1,4),(2,3),(3,1),(4,2);
select *from PersonsDetailType;