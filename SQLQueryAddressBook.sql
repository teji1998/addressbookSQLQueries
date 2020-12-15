/*UC1*/
--creating Address Book database
create database Address_Book_Service;
--using the database
use Address_Book_Service;
/*UC2*/
--creating address book table
Create table Address_Book(Id int identity(1,1) primary key,First_Name Varchar(30),Last_Name Varchar(30),
Address Varchar(50),City Varchar(50),State Varchar(50),Zip int,Mobile_Number Varchar(10) unique, 
Email_Id Varchar(40) unique ) ;
/*--To change datatype of mobile number from varchar to int
Alter Table Address_Book
Alter Column Mobile_Number int;*/