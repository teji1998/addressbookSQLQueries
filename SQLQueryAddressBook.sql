/*UC1*/
--creating Address Book database
create database Address_Book_Service;
--using the database
use Address_Book_Service;

/*UC2*/
--creating address book table
Create table Address_Book(Id int identity(1,1) primary key,First_Name Varchar(30),Last_Name Varchar(30),
Address Varchar(50),City Varchar(50),State Varchar(50),Zip int,Mobile_Number Varchar(10) unique, 
Email_Id Varchar(40) unique) ;

/*--To change datatype of mobile number from varchar to int
Alter Table Address_Book
Alter Column Mobile_Number int;*/

/*UC3*/
--To insert new Contact into addressbook
insert into Address_Book(First_Name,Last_Name,Address,City,State,Zip,Mobile_Number,Email_Id)
values('Tejaswini','Kulkarni','Chembur','Mumbai','Maharashtra','400071','9920275347','tejasvinirpk@gmail.com');
insert into Address_Book(First_Name,Last_Name,Address,City,State,Zip,Mobile_Number,Email_Id)
values('Lee','Minho','Palace','Seoul','Korea','898976','6768995434','lee_minho@kbstv.com');
insert into Address_Book(First_Name,Last_Name,Address,City,State,Zip,Mobile_Number,Email_Id)
values('Aryan','Pai','Blueivy','Bangalore','Karnataka','560878','9845622100','arayan148@abc.com');
insert into Address_Book(First_Name,Last_Name,Address,City,State,Zip,Mobile_Number,Email_Id)
values('Varun','Exo','Fatorda','Ponda','Goa','458678','8786554400','varun_exo@sbs.com');
insert into Address_Book(First_Name,Last_Name,Address,City,State,Zip,Mobile_Number,Email_Id)
values('Tejaswini','Shetti','Dharwad','Marines','Konkan','858678','8786499400','teju_sj13@sj.com');
insert into Address_Book(First_Name,Last_Name,Address,City,State,Zip,Mobile_Number,Email_Id)
values('Roopa','Rajkumar','Kusugal','Hubli','Karnataka','563222','9920307457','roopa_brt@yahoo.com');
insert into Address_Book(First_Name,Last_Name,Address,City,State,Zip,Mobile_Number,Email_Id)
values('Aryan','Wellington','lakeview','Hubli','Karnataka','560788','8777622100','arayanwelli@abdc.com');
insert into Address_Book(First_Name,Last_Name,Address,City,State,Zip,Mobile_Number,Email_Id)
values('Abhimanyu','Jagirdar','Farmhouse','Mumbai','Maharashtra','400767','8956434789','abhi_jagir@cmtv.com');

--To retrieve all records from table;
Select * from Address_Book;

/*UC4*/
--Editing a contact by using first name and last name
Update Address_Book set Email_Id='tejasvini@gmail.com' where First_Name='Tejaswini' and Last_Name = 'Kulkarni';
--Editing a contact by using only first name
Update Address_Book set Address='LottePark' where First_Name='Tejaswini' ;
--Editing a contact by using only last name
Update Address_Book set Zip='908323' where Last_Name='Minho' ;
--Editing a contact by using first name or last name
Update Address_Book set Address='Buckingham' where First_Name='Roopa' or Last_Name = 'Exo';

/*UC5*/
--Deleting a contact by using first name and last name
Delete from Address_Book where First_Name='Tejaswini' and Last_Name='Shetti';
--Deleting a contact by using first name 
Delete from Address_Book where First_Name='Aryan';
--Deleting a contact by using last name
Delete from Address_Book where Last_Name='Exo';
--Deleting a contact by using first name or last name
Delete from Address_Book where First_Name='Tejaswini' or Last_Name='Minho';

/*UC6*/
--To retrieve contacts based on state
Select * from Address_Book where State = 'Karnataka';
--To retrieve contacts based on state
Select * from Address_Book where State = 'Maharashtra';
--To retrieve contacts based on city
Select * from Address_Book where city = 'Seoul';
--To retrieve contacts based on city
Select * from Address_Book where city = 'Mumbai';

/*UC7*/
--To retrieve the count of records based on city
Select COUNT(City) as city_count from Address_Book where City = 'Mumbai';
Select COUNT(City) as city_count from Address_Book where City = 'Hubli';
Select COUNT(City) as city_count from Address_Book where City = 'Ponda';
-- To retrieve the count of records based on State
Select COUNT(State)as state_count from Address_Book where State = 'Karnataka';
Select COUNT(State) as state_count from Address_Book where State = 'Konkan';
Select COUNT(State) as state_count from Address_Book where State = 'Goa';
--Taking both city and state to get state count
Select Count(State) as state_count from Address_Book
where City='Mumbai' and State='Maharashtra';
--Taking both city and state to get city count
Select Count(State) as city_count from Address_Book
where City='Ponda' and State='Goa';

/*UC8*/
--to sort alphabetically for a given city by first name
select * from Address_Book where City = 'Hubli' order by First_Name ASC ;
select * from Address_Book where City = 'Mumbai' order by First_Name ASC ;
--to sort alphabetically for a given city by last name
select * from Address_Book where City = 'Hubli' order by Last_Name ASC ;
select * from Address_Book where City = 'Mumbai' order by Last_Name ASC ;

/*UC9*/
--altering table to add addressbook name and type column
Alter table  Address_Book add Address_Book_Name varchar(20) , Type varchar(20);
--Updating the values in the table
Update Address_Book set Type = 'Family' , Address_Book_Name = 'A' where First_Name='Tejaswini';
Update Address_Book set Type = 'Friend', Address_Book_Name = 'B' where Last_Name='Wellington';
Update Address_Book set Type='Profession' , Address_Book_Name = 'A' where Last_Name='Rajkumar';
Update Address_Book set Type='Profession' , Address_Book_Name = 'B' where Last_Name='Jagirdar';
Update Address_Book set Type='Friend' , Address_Book_Name = 'C' where First_Name='Lee';
Update Address_Book set Type='Family' , Address_Book_Name = 'C' where Last_Name='Pai';
Update Address_Book set Type='Family' , Address_Book_Name = 'B' where Last_Name='Exo';
--creating table Address_Book_Type
Create table Address_Book_Type(
address_book_id int identity(1,1) primary key,
person_type varchar(20) ,
address_book_name varchar(50)
);
--inserting values into Address_Book_Type
Insert into Address_Book_Type(person_type,address_book_name)
values('Friend','Friend_Address_Book'),
('Family','Family_Address_Book'),
('Profession','Profession_Address_Book');

--To retrieve records from address book type
select * from Address_Book_Type;

/*UC10*/
--to get count by type
Select COUNT(Type) as type_count from Address_Book where Type='Friend';

--UC11 Adding one Person both Profession and friend
Create table Person_And_AddressBook(
Person_Id int not null Foreign Key(Person_Id) references Address_Book(ID),
Book_Id int not null Foreign key(Book_Id) references Address_Book_Type(address_book_id)
)
--To retrieve the records
Select * from Address_Book;
--inserting values into Person_And_AddressBook
Insert Into Person_And_AddressBook(Person_Id,Book_Id)
values(6,2),
(8,3),
(10,1),
(14,1),
(11,3),
(9,2),
(12,2),
(13,1),
(6,1);
--retrieve the records
select * from Person_And_AddressBook;
--To get count of person by type
Select Count(Book_Id) as Contacts,Book_Id from Person_And_AddressBook
Group by Book_Id;

/*UC12*/
--ER Diagram

/*UC13*/
--Crud operations
select * from Address_Book;
--To retrieve contacts based on state
Select * from Address_Book where State = 'Karnataka';
--to sort alphabetically for a given city by last name
select * from Address_Book where City = 'Hubli' order by Last_Name ASC ;
--to sort alphabetically  in descending order for a given city by first name
select * from Address_Book where City = 'Mumbai' order by Last_Name DESC ;