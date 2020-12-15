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