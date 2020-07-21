/*
Description:  put table into 3NF
Notes: Added genderReq and gradeReq tables
Author: Hailey Wilson
Version: 2.0
Date: July, 2020
*/

/*
Description:  script to create the Student Circuit project tables
Author: Winsum Chang
Version: 1.0
Date: Apr 24, 2019
*/

/* Create database */
CREATE DATABASE DBMS578;
GO

/* Change to the DBMS578 database */
USE DBMS578;
GO

drop table Preference;
drop table Assignment;
drop table GenderReq;
drop table GradeReq;
drop table Student;
drop table Circuit;
/* create schema studentact;  */
create table Student (
	StudentID integer NOT NULL,
    	Fname varchar(256) NOT NULL,
    	Lname varchar(256) NOT NULL,
    	ChurchName varchar(256),
	gradeID integer,
	genderID varchar(32),
	PRIMARY KEY (StudentID), 
	FOREIGN KEY (gradeID) REFERENCES GradeReq(gradeID), 
	FOREIGN KEY (genderID) REFERENCES GenderReq(genderID)
);
--
create table Circuit(
	circuitID integer NOT NULL,
	circuitName varchar(256) NOT NULL,
	minSize integer,
	maxSize integer,
	PRIMARY KEY (circuitID) 
);
--
create table Preference(
	prefNum integer NOT NULL,
	circuitGrp varchar(256) NOT NULL,
	circuitID integer NOT NULL,
	studentID integer NOT NULL,
	FOREIGN KEY (circuitID) REFERENCES Circuit(circuitID), 
	FOREIGN KEY (studentID) REFERENCES Student(studentID) 
);
--
create table Assignment(
	circuitGrp varchar(256) NOT NULL,
	circuitID integer NOT NULL,
	studentID integer NOT NULL,
	FOREIGN KEY(circuitID) REFERENCES Circuit(circuitID),
	FOREIGN KEY(studentID) REFERENCES Student(studentID)
);
--
create table GenderReq(
	genderID integer NOT NULL,
	gender varchar(32) NOT NULL,
	PRIMARY KEY(genderID) 
)
--
create table GradeReq(
	gradeID integer NOT NULL,
	grade integer NOT NULL,
	PRIMARY KEY(gradeID)
);
commit;
