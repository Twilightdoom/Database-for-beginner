USE FlexPHONE

-- Case 1
-- Display ID (Obtained from word ‘Customer’ and the last number of Customer ID), CustomerName, CustomerGender, 
-- and total amount of spending (Obtained from sum of all phone price times quantity) that have been done by the that customer.
 SELECT
	[Customer] = 'Customer' + RIGHT(C.CustomerID, 1), 
	CustomerName, 
	CustomerGender, 
	[Total Amount of Spending] = SUM(PH.PhonePrice * ST.PhoneSoldQuantity) 
 FROM Customer C 
	JOIN SalesTransaction ST ON C.CustomerID = ST.CustomerID
	JOIN PhoneHeader PH ON ST.PhoneID = PH.PhoneId
 GROUP BY 
	C.CustomerID, 
	C.CustomerName, 
	C.CustomerGender

/*
Case 2
Display Staff ID, Name (Obtained from the first name of the Staff), and the Customer Count (obtained from the total of customer that made transaction with that staff) for the staff whose name contain at least 2 words.
*/
 SELECT
	S.StaffID, 
	[FirstName] = SUBSTRING(StaffName, 1, CHARINDEX(' ', StaffName)), 
	[CustomerCount] = COUNT(ST.StaffID)
 FROM Staff S 
	JOIN SalesTransaction ST ON S.StaffID = ST.StaffID
 WHERE StaffName LIKE '% %'
 GROUP BY 
	S.StaffID,
	S.StaffName
 
 /*
    3. Display 
    Customer ID (Obtained from word "Customer' and the last number of Customer ID),
    Customer Name, Phone Brand, and
    Total spending (Obtained from the sum of phone price and quantity for all phone in that brand)
    for the customer whos name contain at least 2 words and purchase more than 3 kinds of phone.
*/
SELECT
    [Customer ID] = 'Customer' + RIGHT(C.CustomerID, 1),
    [Customer Name] = CustomerName,
    [Phone Brand] = PB.PhoneBrandName,
    [Total spending] = SUM(PH.PhonePrice * ST.PhoneSoldQuantity)
FROM Customer C
    JOIN SalesTransaction ST ON C.CustomerID = ST.CustomerID
    JOIN PhoneHeader PH ON ST.PhoneID = PH.PhoneID
    JOIN PhoneBrand PB ON PH.PhoneBrandId = PB.PhoneBrandId
WHERE
    CHARINDEX(' ', CustomerName) > 0
GROUP BY 
    C.CustomerID,
    CustomerName,
    PhoneBrandName
HAVING
    COUNT(PB.PhoneBrandName) > 3
 
-- Case 4
/*Display Staff ID, Email (Obtained from staff Email with the email format changed into 
@Ymail.com), phone brand, and total selling (obtained from sum of the phone price times
quantity for all phone in that brand) for staff that sell more than 2 kind of phones and order it
by staff ID ascendingly.*/

use FlexPHONE


SELECT S.StaffID,stuff  (StaffEmail, charindex('@', StaffEmail)+1, len(StaffEmail)-charindex('@', StaffEmail), 'Ymail.com') AS[Email],PhoneBrandName,
	SUM((PhonePrice)*PhoneSoldQuantity) AS [total selling] 
FROM PhoneBrand pb JOIN PhoneHeader PH on pb.PhoneBrandId = PH.PhoneBrandId JOIN SalesTransaction ST on ST.PhoneID =  PH.PhoneId JOIN Staff S on S.StaffID =ST.StaffID
GROUP BY s.StaffID, StaffEmail, PhoneBrandName
HAVING COUNT(st.PhoneId) > 2
ORDER BY s.StaffID ASC

--Case 5
/*Display Staff Email, Staff Gender. Date of Birth (Obtained from the staff DOB with the format ‘dd mon yyyy’),
and Salary (Obtained from adding ‘Rp.’ before staff Salary and ‘,00.’ After the staff Salary) for staff that has
the salary above the average of all staff salary and aged 30 years or over.
(alias subquery)*/


SELECT s.StaffEmail, s.StaffGender, [Date of Birth] = CONVERT(VARCHAR, s.StaffDOB, 106), [Salary] = CONCAT('Rp.', s.StaffSalary, ',00')
FROM Staff s,
(
	SELECT [average] = AVG(s.StaffSalary)
	FROM Staff s
) AS avgSalary
WHERE DATEDIFF(YEAR, s.StaffDOB, GETDATE()) >= 30 AND s.StaffSalary > avgSalary.average


--Case 6
/*Display StaffID, StaffName, StaffPhone (Obtained from StaffPhone and change the ‘+62’ into ‘08’),
and Total Selling (Obstained from adding ‘Rp.’ before and ‘,00.’ After the sum of the purchase for all
transaction have been done to customer by that staff) for Total Selling that between 10000000 and 100000000 and the staff whose gender is Male.
(alias subquery)*/

SELECT s.StaffID, s.StaffName, [StaffPhone] = REPLACE(s.StaffPhone, '+62', '08'), [Total Selling] = CONCAT('Rp.', SUM(ph.PhonePrice), ',00')
FROM Staff s JOIN SalesTransaction st
ON st.StaffID = s.StaffID
JOIN PhoneHeader ph
ON ph.PhoneId = st.PhoneID,(
 SELECT [ts] = SUM(ph.PhonePrice)
 FROM SalesTransaction st
 JOIN PhoneHeader ph
 ON st.PhoneID = ph.PhoneId
 JOIN Staff s
 ON s.StaffID = st.StaffID
 WHERE s.StaffGender = 'Male'
) AS total
WHERE total.ts > 10000000  AND total.ts < 100000000
GROUP BY s.StaffID, s.StaffName, s.StaffPhone

--Case 9
/*Create a view named ‘Vendor_Brand_Transaction_View’ to display VendorID 
(Obtained from adding the word ‘Vendor’ before the last number of VendorID), VendorName, PhoneNumber 
(Obtained by replacing ‘+62’ into ‘08’ in VendorPhone), PhoneBrand, Transaction Count (Obtained by counting transaction for every phone brand),
Total Transaction (Obtained from the sum of all PhonePrice times quantity in a brand)*/
GO
CREATE VIEW Vendor_Brand_Transaction_View AS
    SELECT 
        VendorID = 'Vendor' + RIGHT(PT.VendorID, 1),
        VendorName,
        [PhoneNumber] = REPLACE(VendorPhoneNumber, '+62', '08'),
        PhoneBrand = PhoneBrandName,
        [Transaction Count] = COUNT(*),
        [Total Transaction] = SUM(PhonePrice * PhonePurchasedQuantity)
    FROM 
        Vendor V
        JOIN PurchaseTransaction PT ON PT.VendorID = V.VendorID
        JOIN PhoneHeader P ON PT.PurchasedPhoneID = P.PhoneId
        JOIN PhoneBrand PB ON PB.PhoneBrandID = P.PhoneBrandID
    GROUP BY
        PT.VendorID,
        VendorName,
        VendorPhoneNumber,
        PhoneBrandName
go

--Mengecek Nomor 9
SELECT *FROM Vendor_Brand_Transaction_View

--Case 10
/*
    Create a view named 'Staff Selling_ View' to display
    StaffID,
    StaffName,
    Sold Phone Count (Obtained from sum the quantity of phone end with the word 'pc(s)'),
    Total Transaction (Obtained from the sum of phone price times qty and add 'Rp.' Before and ',00.' After it),
    Count Brand (Obtained from counting the number of brand which phone sold by Staff whose have email format '@bluejack.com')
*/
GO
CREATE VIEW Staff_Selling_View AS
    SELECT
        S.StaffID,
        StaffName,
        [Sold Phone Count] = CAST(SUM(PhonePurchasedQuantity) AS VARCHAR) + 'pc(s)',
        [Total Transaction] = 'Rp.' + CAST(SUM(PhonePurchasedQuantity * PhonePrice) AS VARCHAR) + ',00.',
        [Count Brand] = COUNT(P.PhoneBrandID)
    FROM
        Staff S
        JOIN PurchaseTransaction PT ON S.StaffID = PT.StaffID
        JOIN PhoneHeader P ON P.PhoneID = PT.PurchasedPhoneID
    WHERE
        StaffEmail LIKE '%@bluejack.com'
    GROUP BY
        S.StaffID,
        StaffName
go

--Mengecek Nomor 10 
SELECT *FROM Staff_Selling_View
