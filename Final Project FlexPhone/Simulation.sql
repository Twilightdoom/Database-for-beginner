use FlexPHONE

Select *FROM SalesTransaction

-- staff membeli produk dari vendor brand Pear
begin tran
INSERT INTO Vendor VALUES('VE016','Pear','08111349777','Jimbaran Residence blok E 6 i no 1, Ancol, Jakarta Utara');

-- vendor melakukan pengiriman kepada FlexPhone, Staff menerima produk
-- produk yang diterima akan didata staff dan dimasukan ke PhoneHeader

INSERT INTO PhoneBrand VALUES('PB011','Pear');
INSERT INTO PhoneHeader VALUES('PO016','PB011','Pear','1500000');



-- seorang customer bernama melvin datang dan ingin membeli sebuah Pear
-- staff menanyakan data diri customer untuk dijadikan member
-- melvin memberikan data dirinya
BEGIN TRAN
INSERT INTO Customer VALUES ('CU011','melvin','melvin@bluejack.com','2002-07-01','Male','+62234254677','Pontianak');


rollback
--setelah melvin menjadi member, proses transaksi pun dilakukan
begin tran

insert into SalesTransaction 
 values
	('SH126','ST001','CU011','PO016','2021-9-13',2)

-- tanpa keraguan dan nego harga, erin langsung bayar
begin tran
INSERT INTO PurchaseTransaction VALUES(
'PH055',
'2021-12-12',
'ST007',
'VE001',
'PO009',
10
);


ROLLBACK