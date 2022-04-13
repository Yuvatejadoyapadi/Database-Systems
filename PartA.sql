-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-07-01 10:55:14.277
CREATE DATABASE if NOT exists CPSCProject;
USE CPSCProject;
-- tables
-- Table: Branch
CREATE TABLE Branch (
    Branch_ID int NOT NULL AUTO_INCREMENT,
    Name varchar(50) NOT NULL,
    Address varchar(100) NOT NULL,
    PhoneNumber varchar(20) NOT NULL,
    CONSTRAINT Branch_pk PRIMARY KEY (Branch_ID)
);

-- Table: Customer
CREATE TABLE Customer (
    Customer_ID int NOT NULL,
    Name varchar(50) NOT NULL,
    Surname varchar(50) NOT NULL,
    Gender varchar(10) NOT NULL,
    Address varchar(100) NOT NULL,
    PhoneNumber varchar(20) NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY (Customer_ID)
);

-- Table: Employee
CREATE TABLE Employee (
    Employee_ID int NOT NULL,
    Name varchar(50) NOT NULL,
    Surname varchar(50) NOT NULL,
    Gender varchar(10) NOT NULL,
    Address varchar(100) NOT NULL,
    PhoneNumber varchar(20) NOT NULL,
    JobTitle varchar(20) NOT NULL,
    Branch_ID int NOT NULL,
    Branch_Manager_ID int NOT NULL,
    CONSTRAINT Employee_pk PRIMARY KEY (Employee_ID)
);

-- Table: Manager
CREATE TABLE Manager (
    Branch_Manager_ID int NOT NULL,
    Name varchar(50) NOT NULL,
    Surname varchar(50) NOT NULL,
    Gender varchar(10) NOT NULL,
    Address varchar(100) NOT NULL,
    PhoneNumber varchar(20) NOT NULL,
    CONSTRAINT Manager_pk PRIMARY KEY (Branch_Manager_ID)
);

-- Table: Membership
CREATE TABLE Membership (
    Membership_ID int NOT NULL,
    CardNo int NOT NULL,
    Customer_ID int NOT NULL,
    Branch_ID int NOT NULL,
    CONSTRAINT Membership_pk PRIMARY KEY (Membership_ID)
);

-- foreign keys
-- Reference: Employee_Branch (table: Employee)
ALTER TABLE Employee ADD CONSTRAINT Employee_Branch FOREIGN KEY Employee_Branch (Branch_ID)
    REFERENCES Branch (Branch_ID);

-- Reference: Employee_Manager (table: Employee)
ALTER TABLE Employee ADD CONSTRAINT Employee_Manager FOREIGN KEY Employee_Manager (Branch_Manager_ID)
    REFERENCES Manager (Branch_Manager_ID);

-- Reference: Membership_Branch (table: Membership)
ALTER TABLE Membership ADD CONSTRAINT Membership_Branch FOREIGN KEY Membership_Branch (Branch_ID)
    REFERENCES Branch (Branch_ID);

-- Reference: Membership_Customer (table: Membership)
ALTER TABLE Membership ADD CONSTRAINT Membership_Customer FOREIGN KEY Membership_Customer (Customer_ID)
    REFERENCES Customer (Customer_ID);

-- End of file.

