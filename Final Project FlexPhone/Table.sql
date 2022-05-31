go
CREATE DATABASE FlexPHONE
go
USE FlexPHONE

go
CREATE TABLE Staff(
	StaffID char(5) primary key not null check(StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName varchar(255) not null,
	StaffEmail varchar(255) not null check(StaffEmail  LIKE '%@bluejack.com' or StaffEmail LIKE '%@sunib.edu'),
	StaffDOB DATE not null,
	StaffGender varchar(255) not null check(StaffGender IN ('Male', 'Female')),
	StaffPhone varchar(25) not null,
	StaffAddress varchar(255) not null,
	StaffSalary int not null
);

go
CREATE TABLE PhoneBrand (
	PhoneBrandId CHAR(5),
	PhoneBrandName VARCHAR(255) NOT NULL,

	CONSTRAINT PK_PhoneBrandId PRIMARY KEY (PhoneBrandId),
	CONSTRAINT CHECK_PhoneBrandId CHECK (PhoneBrandId like 'PB[0-9][0-9][0-9]')
);

go
CREATE TABLE PhoneHeader (
	PhoneId CHAR(5),
	PhoneBrandId CHAR(5),
	PhoneName VARCHAR(255) NOT NULL,
	PhonePrice INT NOT NULL,
	
	CONSTRAINT PK_PhoneId PRIMARY KEY (PhoneId),
	CONSTRAINT CHECK_PhoneId CHECK(PhoneId like 'PO[0-9][0-9][0-9]'),

	CONSTRAINT FK_PhoneBrandId FOREIGN KEY (PhoneBrandId)
		references PhoneBrand(PhoneBrandId) ON UPDATE CASCADE ON DELETE CASCADE,

	CONSTRAINT CHECK_PhonePrice CHECK(PhonePrice between 100000 and 40000000)
);

go
CREATE TABLE Customer(
	CustomerID CHAR(5) PRIMARY KEY NOT NULL CHECK(CustomerID LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName VARCHAR(255) NOT NULL,
	CustomerEmail VARCHAR(255) NOT NULL check(CustomerEmail  LIKE '%@bluejack.com' OR CustomerEmail LIKE '%@sunib.edu'),
	CustomerDOB VARCHAR(255) NOT NULL,
	CustomerGender VARCHAR(255) NOT NULL CHECK(CustomerGender IN ('Male', 'Female')),
	CustomerPhoneNumber VARCHAR(25) NOT NULL,
	CustomerAddress VARCHAR(255) NOT NULL,
	
);


CREATE TABLE SalesTransaction(
	SalesTransactionID CHAR(5) PRIMARY KEY NOT NULL CHECK(SalesTransactionID LIKE 'SH[0-9][0-9][0-9]'),
	StaffID CHAR(5) NOT NULL FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
	CustomerID CHAR(5) NOT NULL FOREIGN KEY REFERENCES Customer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE,
	PhoneID CHAR(5) NOT NULL FOREIGN KEY  REFERENCES PhoneHeader(PhoneID) ON UPDATE CASCADE ON DELETE CASCADE,
	SalesTransactionDate DATE NOT NULL,
	PhoneSoldQuantity INT NOT NULL
	
);

SELECT * FROM SalesTransaction

go
CREATE TABLE Vendor(
	VendorID CHAR(5) PRIMARY KEY NOT NULL CHECK(VendorID LIKE 'VE[0-9][0-9][0-9]'),
	VendorName VARCHAR(255) NOT NULL,
	VendorPhoneNumber VARCHAR(255) NOT NULL,
	VendorAddress VARCHAR(255) NOT NULL
);

go
CREATE TABLE PurchaseTransaction(
	PurchaseID CHAR(5) PRIMARY KEY NOT NULL CHECK (PurchaseID LIKE 'PH[0-9][0-9][0-9]'),
	TransactionDate DATE NOT NULL,
	StaffID CHAR(5) FOREIGN KEY REFERENCES Staff(StaffID) NOT NULL,
	VendorID CHAR(5) FOREIGN KEY REFERENCES Vendor(VendorID) NOT NULL,
	PurchasedPhoneID CHAR(5) FOREIGN KEY REFERENCES PhoneHeader(PhoneID) ON UPDATE CASCADE ON DELETE CASCADE,
	PhonePurchasedQuantity INT NOT NULL
);