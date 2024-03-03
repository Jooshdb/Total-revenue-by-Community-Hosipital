SELECT *
FROM Hospitalrecord

SELECT Date MedicationRevenue, LabCost, [EntryTime]
FROM Hospitalrecord
WHERE LabCost > $1 AND [ Medication Revenue ] IS NULL
ORDER BY 1, 2, 3

SELECT [ Medication Revenue ],[  Lab Cost ], [DoctorType]
FROM Hospitalrecord
WHERE [  LAB COST  ] > $1 AND [ Medication Revenue ] IS NOT NULL
ORDER BY [  Lab Cost ]

NUMBER OF TOTALPATIENT PER DAY
SELECT VisitDAte, COUNT(VisitDAte) AS TOTALPatient
FROM Hospitalrecord
GROUP BY VisitDAte

SELECT[DoctorType], COUNT(DoctorType) NooFpatient
FROM Hospitalrecord
GROUP BY [DoctorType]
HAVING COUNT(DoctorType)>2

SELECT *
FROM Hospitalrecord
WHERE [Financial Class] LIKE '%INS%' AND [Doctor Type] LIKE '%HOR%'
ORDER BY 1,2

SELECT DoctorType, COUNT(PatientID) Total_Customer_DT
FROM Hospitalrecord
GROUP BY DoctorType
HAVING COUNT(PatientID)>5
ORDER BY COUNT(PatientID)


SELECT LabCost, PatientID
FROM Hospitalrecord
WHERE labcost is not null and labcost > $0
order by labcost DESC

SELECT SUM([ Medication Revenue ]) AS TOTALMR, 
	SUM([ Consultation Revenue ]) AS TOTALCR
FROM Hospitalrecord

SELECT  PatientID,  
	DoctorType, PatientType,
	[ Medication Revenue ],
	[ Consultation Revenue ],
	[ MEDICATION REVENUE ] + [ CONSULTATION REVENUE ] AS TOTAL_REVENUE
FROM Hospitalrecord
WHERE [ Medication Revenue ] IS NOT NULL AND [ Consultation Revenue ] IS NOT NULL
ORDER BY 1 ,2

SELECT PatientID, 
	[ Medication Revenue ], 
	[ Consultation Revenue ], 
	[Financial Class]
FROM Hospitalrecord
WHERE [ Medication Revenue ] IS NOT NULL 
	AND [ Consultation Revenue ] IS NOT NULL 
	OR [Financial Class] IS NULL
ORDER BY 1 DESC


SELECT dbo.Economic.CustomerID, dbo.Economic.InvoiceNo,
	dbo.Economic.Description, dbo.Economic.StockCode, dbo.Economic.Country,
	dbo.Economic.Quantity, dbo.Economic.F1, dbo.Economic.UnitPrice,
	dbo.Economic.Date, dbo.Economic.Hour, (Quantity*UnitPrice) AS TOTALPRICE
FROM Economic
WHERE StockCode IS NOT NULL

SELECT dbo.Economic.CustomerID, dbo.Economic.InvoiceNo,
	dbo.Economic.Description, dbo.Economic.StockCode, dbo.Economic.Country,
	dbo.Economic.Quantity, dbo.Economic.UnitPrice,
	 (Quantity*UnitPrice) AS TOTALPRICE
FROM Economic
ORDER BY CustomerID, TOTALPRICE DESC

SELECT CustomerID, COUNT(CustomerID) LOPC_ID
FROM Economic
GROUP BY CustomerID
HAVING COUNT(CustomerID)>1
ORDER BY CustomerID;


INSERT INTO Economic(CustomerID) VALUES(1000)

SELECT *
FROM Economic
WHERE CustomerID <= 1000

UPDATE Economic
SET StockCode = 100, Quantity = 20, Country= 'NIGERIA'
WHERE CustomerID = 1000

UPDATE Economic
SET Date = 2023-02-02
WHERE StockCode=100

DELETE FROM Economic
WHERE Quantity IS NULL

ALTER TABLE Economic 
ADD PRIMARY KEY(CustomerID)
REFERENCES Hosipitalrecord(PatientID)
ON DELETE SET NULL;

SELECT CustomerID,  Quantity, AVG(Quantity) AS AQ
FROM  specialproject.dbo.Economic
GROUP BY  specialproject.dbo.Economic.Quantity, specialproject.dbo.Economic.CustomerID
ORDER BY  specialproject.dbo.Economic.CustomerID

SELECT  specialproject.dbo.Economic.CustomerID, SUM(Quantity + UnitPrice) AS TOTALPURCHASE
FROM  specialproject.dbo.Economic
GROUP BY  specialproject.dbo.Economic.CustomerID
ORDER BY  specialproject.dbo.Economic.CustomerID

SELECT *
FROM specialproject.dbo.Economic
WHERE stockcode IS NOT NULL AND Description IS NOT NULL AND UnitPrice IS NOT NULL
GROUP BY  specialproject.dbo.Economic.InvoiceNo,
	 specialproject.dbo.Economic.StockCode, 
	 specialproject.dbo.Economic.Description, 
	 specialproject.dbo.Economic.Quantity, 
	 specialproject.dbo.Economic.UnitPrice, 
	 specialproject.dbo.Economic.CustomerID,
	 specialproject.dbo.Economic.Country, 
	 specialproject.dbo.Economic.Date, 
	 specialproject.dbo.Economic.Hour
ORDER BY  specialproject.dbo.Economic.CustomerID

SELECT CustomerID, Gender, SUM([Annual Income (k$)] + [Spending Score (1-100)]) UNITPRICE
FROM Mall_Customers$
GROUP BY CustomerID, Gender
ORDER BY Gender DESC

SELECT *
FROM Economic
WHERE Stockcode IS NOT NULL AND Description IS NOT NULL
ORDER BY CustomerID

SELECT *
FROM Economic
WHERE UnitPrice IS NULL OR Quantity > 20
ORDER BY Country

SELECT Country, count(State) as totalstate, count(Customer_Gender)
FROM SPECIALPROJECT.dbo.Sale
group by Country
order by Country

SELECT CustomerID, count(CustomerID) as TOTALID, 
	SUM(UnitPrice) unitprice, 
	SUM(Quantity) quantity,
	sum(unitprice * quantity) as totalunit
from Economic
where UnitPrice is not null
GROUP BY CustomerID
order by TOTALID Desc

SELECT Country, State
FROM Sale
GROUP BY Country, State
HAVING COUNT(State)>4

SELECT *
FROM Economic
INNER JOIN Sale
ON SPECIALPROJECT.dbo.Sale.Country=SPECIALPROJECT.dbo.Economic.Country

SELECT CustomerID, Age_Group, Customer_Gender 
FROM Sale
FULL JOIN Economic
ON SPECIALPROJECT.dbo.Sale.Country=SPECIALPROJECT.dbo.Economic.Country
GROUP BY CustomerID, Age_Group, Customer_Gender
ORDER BY CustomerID

SELECT [ Medication Revenue ]
FROM Hospitalrecord
select sum([ Medication Revenue ]) as Totalrevenue 
from Hospitalrecord