
begin tran



 insert into Staff values 
('ST001','Audi Marissa','Audi@bluejack.com','1999-01-23','Female','+62111349777','ancol','3000000'),
('ST002','Budi Jojo','Budi@bluejack.com','1982-02-23','Male','+62112349777','sunter','2500000'),
('ST003','Dudi Lala','Dudi@sunib.edu','1982-03-23','Female','+62113349777','gading','4600000'),
('ST004','Hudi Black','Hudi@bluejack.com','1983-04-23','Male','+62114349777','aslut','4000000'),
('ST005','Sudi Rman','Sudi@sunib.edu','1983-05-23','Male','+62115349777','serpong','3000000'),
('ST006','Yudi Yahya','Yudi@sunib.edu','1983-06-23','Male','+62116349777','bsd','2200000'),
('ST007','Tudi Issa','Tudi@bluejack.com','1984-07-23','Female','+62117349777','kemang','2800000'),
('ST008','Pudi Ngab','Pudi@bluejack.com','1979-08-23','Male','+62118349777','kemanggisan','4500000'),
('ST009','Ludi Em','Ludi@sunib.edu','1977-09-23','Male','+62119349777','bandung','1500000'),
('ST010','Rudi Rawr','Rudi@bluejack.com','1970-10-23','Male','+62110349777','malang','2240000')
;


-- dummy
INSERT INTO PhoneBrand
VALUES (
    'PB001',
    'Apple'
)

INSERT INTO PhoneBrand
VALUES (
    'PB002',
    'Samsung'
)

INSERT INTO PhoneBrand
VALUES (
    'PB003',
    'Oppo'
)

INSERT INTO PhoneBrand
VALUES (
    'PB004',
    'Lenovo'
)

INSERT INTO PhoneBrand
VALUES (
    'PB005',
    'Xiaomi'
)

INSERT INTO PhoneBrand
VALUES (
    'PB006',
    'Huawei'
)

INSERT INTO PhoneBrand
VALUES (
    'PB007',
    'Sony'
)

INSERT INTO PhoneBrand
VALUES (
    'PB008',
    'LG'
)

INSERT INTO PhoneBrand
VALUES (
    'PB009',
    'Nokia'
)

INSERT INTO PhoneBrand
VALUES (
    'PB010',
    'Motorola'
)

-- 1
INSERT INTO PhoneHeader
VALUES (
    'PO001',
    'PB001',
    'Iphone X',
    '10000000'
)
-- 2
INSERT INTO PhoneHeader
VALUES (
    'PO002',
    'PB002',
    'Galaxy',
    '8799000'
)
-- 3
INSERT INTO PhoneHeader
VALUES (
    'PO003',
    'PB002',
    'S7',
    '7000000'
)
-- 4
INSERT INTO PhoneHeader
VALUES (
    'PO004',
    'PB008',
    'XPeria',
    '4500000'
)

-- 5
INSERT INTO PhoneHeader
VALUES (
    'PO005',
    'PB004',
    'Velvet',
    '1500000'
)

-- 6
INSERT INTO PhoneHeader
VALUES (
    'PO006',
    'PB001',
    'Ipad Pro',
    '12499999'
)
-- 7
INSERT INTO PhoneHeader
VALUES (
    'PO007',
    'PB001',
    'Iphone 6',
    '3000000'
)
-- 8
INSERT INTO PhoneHeader
VALUES (
    'PO008',
    'PB009',
    'Nokia 3210',
    '750000'
)
-- 9
INSERT INTO PhoneHeader
VALUES (
    'PO009',
    'PB003',
    'Reno7',
    '4700999'
)

-- 10
INSERT INTO PhoneHeader
VALUES (
    'PO010',
    'PB005',
    'Redmi 10',
    '10999999'
)

-- 11
INSERT INTO PhoneHeader
VALUES (
    'PO011',
    'PB007',
    'XZ',
    '2300000'
)
-- 12
INSERT INTO PhoneHeader
VALUES (
    'PO012',
    'PB010',
    'Moto G10',
    '500000'
)
-- 13
INSERT INTO PhoneHeader
VALUES (
    'PO013',
    'PB009',
    'Nokia 3210',
    '750000'
)
-- 14
INSERT INTO PhoneHeader
VALUES (
    'PO014',
    'PB003',
    'F17 Pro',
    '19700000'
)

-- 15
INSERT INTO PhoneHeader
VALUES (
    'PO015',
    'PB004',
    'K10',
    '1500000'
)

insert into Customer 
	values
	('CU001','Oscar Tisarana','oscar@bluejack.com','2002-09-11','Male','+62123133312','ANCOL'),
	('CU002','Jessica Alba','jessica.alba@sunib.edu','2002-06-01','Female','+62122313135','jln. bandung'),
	('CU003','Jason Lieadi Stanlie','jason.stanlie@sunib.edu','2001-12-05','Male','+621098765432','jln. tangerang pusat'),
	('CU004','Adriel Jonathan', 'adriel.jonathan@bluejack.com','2002-06-26','Male','+62111072021','jln. lempuyang 1 no.3'),
	('CU005','Albertus Alexander','albertus.alexander@bluejack.com','2002-02-06','Male','+62110672391','jakarta selatan'),
	('CU006','Natalie Canggih','nataliec12@sunib.edu','2002-07-21','Female','+62120908918','jln. lengkuas 3 no. 21'),
	('CU007','Vania Felicia','vania.felicia@bluejack.com','2002-01-23','Female','+62112345678','tangerang selatan'),
	('CU008','Bernard Kusnadi','bernard.kusnandi@sunib.edu','2003-04-08','Male','+62177778888','BSD City'),
	('CU009','Nathanael Emeraldo','nathanael.emeraldo@bluejack.com','2002-09-28','Male','+62172029228','karawaci'),
	('CU010','Audrey Jocellyn','audrey.jocellyn@bluejack.com','2001-09-13','Female','+62113232323','serpong')
 ;


 insert into SalesTransaction 
 values
	('SH101','ST001','CU002','PO001','2020-9-11',2),
	('SH102','ST003','CU007','PO005','2021-11-14',12),
	('SH103','ST007','CU009','PO015','2021-4-8',6),
	('SH104','ST009','CU003','PO007','2020-1-6',4),
	('SH105','ST002','CU010','PO002','2020-8-7',9),
	('SH106','ST010','CU005','PO012','2021-5-4',3),
	('SH107','ST010','CU004','PO008','2020-6-28',10),
	('SH108','ST003','CU006','PO005','2021-2-20',8),
	('SH109','ST003','CU003','PO015','2020-9-24',5),
	('SH110','ST009','CU003','PO007','2021-1-10',7),

	('SH111','ST001','CU002','PO008','2020-8-11',2),
	('SH112','ST005','CU006','PO001','2020-1-14',1),
	('SH113','ST006','CU009','PO015','2021-3-2',8),
	('SH114','ST008','CU004','PO002','2021-10-7',3),
	('SH115','ST003','CU001','PO007','2020-12-9',4),
	('SH116','ST007','CU009','PO006','2021-8-8',2),
	('SH117','ST002','CU002','PO013','2021-4-18',1),
	('SH118','ST003','CU004','PO014','2020-3-2',3),
	('SH119','ST007','CU006','PO004','2021-7-9',5),
	('SH120','ST003','CU009','PO005','2020-3-12',3),

	('SH121','ST003','CU002','PO007','2020-9-18',1),
	('SH122','ST008','CU008','PO004','2021-1-4',1),
	('SH123','ST007','CU003','PO008','2021-8-5',2),
	('SH124','ST010','CU010','PO011','2020-3-9',1),
	('SH125','ST002','CU010','PO012','2020-2-1',4),
	('SH126','ST002','CU010','PO012','2020-2-2',5),
	('SH127','ST002','CU010','PO012','2020-2-3',3),
	('SH128','ST002','CU010','PO012','2020-2-4',2)
 ;

 -- untuk case no. 3
 INSERT INTO SalesTransaction
 VALUES 
	('SH129', 'ST009', 'CU008', 'PO001', '2021-1-4', 1),
	('SH130', 'ST009', 'CU008', 'PO002', '2021-2-4', 1),
	('SH131', 'ST001', 'CU008', 'PO003', '2021-3-4', 2),
	('SH132', 'ST002', 'CU008', 'PO004', '2021-4-4', 3)
	;

 INSERT INTO SalesTransaction
 VALUES 
	('SH133', 'ST003', 'CU001', 'PO001', '2021-1-1', 1)
;

 INSERT INTO SalesTransaction
 VALUES 
	('SH134', 'ST003', 'CU001', 'PO001', '2020-1-1', 1),
	('SH135', 'ST003', 'CU001', 'PO001', '2021-11-11', 1),
	('SH136', 'ST003', 'CU001', 'PO001', '2020-11-11', 1)
;

 INSERT INTO Vendor Values
('VE001','Jaya Phone','08212312353','Jakarta Selatan'),
('VE002','Sinar Phone','081234546345','Tangerang Utara'),
('VE003','Mantap Phone','08789358843','Jember'),
('VE004','Good Phone','082167876863','China'),
('VE005','Awesome Phone','082123445233','Beijing'),
('VE006','Toko Sinar','082121543653','Taiwan'),
('VE007','Great Phone Store','0821212123','Sydney'),
('VE008','Apless','08212123456','Papua'),
('VE009','Phonis','082123121233','Kuala Lumpur'),
('VE010','Phone Free','08123346353','Washington');


INSERT INTO PurchaseTransaction Values
('PH001','2020-2-1','ST001','VE003','PO002',4),
('PH003','2020-3-12','ST002','VE004','PO003',5),
('PH004','2020-4-12','ST002','VE005','PO004',6),
('PH005','2020-5-12','ST004','VE006','PO005',7),
('PH006','2020-6-12','ST005','VE007','PO001',3),
('PH007','2020-7-12','ST006','VE008','PO001',4),
('PH008','2020-8-12','ST007','VE009','PO002',5),
('PH009','2020-9-12','ST008','VE010','PO007',6),
('PH010','2020-10-12','ST003','VE004','PO007',3),
('PH011','2020-11-12','ST004','VE005','PO008',5),
('PH012','2020-12-12','ST005','VE002','PO008',6),
('PH013','2020-12-13','ST009','VE002','PO008',7),
('PH014','2020-12-14','ST010','VE008','PO010',8),
('PH015','2020-12-15','ST003','VE008','PO009',1),
('PH016','2020-12-16','ST005','VE003','PO002',2),
('PH017','2020-12-17','ST002','VE005','PO005',6),
('PH018','2020-12-18','ST008','VE007','PO007',3),
('PH019','2020-12-19','ST001','VE002','PO002',2),
('PH020','2020-12-20','ST010','VE001','PO001',1),
('PH021','2020-12-21','ST004','VE010','PO005',7),
('PH022','2020-12-22','ST006','VE010','PO009',3),
('PH023','2020-12-23','ST007','VE007','PO002',3),
('PH024','2020-12-24','ST002','VE002','PO004',1),
('PH025','2020-12-25','ST004','VE005','PO006',1);





