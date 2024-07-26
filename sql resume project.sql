use AdventureWorks2012;

SELECT * FROM PERSON.Person;
SELECT * FROM PERSON.PersonPhone;
SELECT * FROM PERSON.PhoneNumberType;
SELECT * FROM PERSON.EmailAddress;


--QUESTION -1 
with temp_cte as
(select BusinessEntityID,FirstName,LastName from PERSON.Person as pp
),
temp_phone_cte as
(select BusinessEntityID,PhoneNumber,PhoneNumberTypeID from PERSON.PersonPhone
),
temp_type_cte as
(select PhoneNumberTypeID,Name from PERSON.PhoneNumberType
),
temp_email_cte as
(select BusinessEntityID,EmailAddress from Person.EmailAddress
)
select (a.FirstName+' '+a.LastName)[Person Name],a.BusinessEntityID,b.PhoneNumber,c.Name[Phone Type],d.EmailAddress
from temp_cte as a
inner join temp_phone_cte as b
on a.BusinessEntityID=b.BusinessEntityID
inner join temp_type_cte as c
on c.PhoneNumberTypeID=b.PhoneNumberTypeID
inner join temp_email_cte as d
on d.BusinessEntityID=a.BusinessEntityID

--QUESTION -2

SELECT SS.OrderDate,SS.DueDate,SS.ShipDate,SS.Status,SS.OnlineOrderFlag,SS.SalesOrderNumber,SS.AccountNumber,SS.CustomerID,
SS.TerritoryID,SS.SubTotal,SS.TaxAmt,SS.Freight,SS.TotalDue,SO.SalesOrderID,SR.ReasonType
FROM Sales.SalesOrderHeader AS SS
INNER JOIN Sales.SalesOrderHeaderSalesReason AS SO
ON SS.SalesOrderID=SO.SalesOrderID
INNER JOIN Sales.SalesReason AS SR
ON SR.SalesReasonID=SO.SalesReasonID
where SS.OrderDate BETWEEN '2011-05-01' AND '2011-05-31';

--QUESTION -3

SELECT * FROM Sales.SalesOrderDetail AS SL
INNER JOIN SALES. SalesOrderHeader AS SO
ON SL.SalesOrderID=SO.SalesOrderID
WHERE SO.OrderDate BETWEEN '2011-05-01' AND '2011-05-31';

--QUESTION-4

SELECT sum(ss.OrderQty*(ss.UnitPrice-SS.UnitPrice*UnitPriceDiscount))[total profit in may] FROM SALES.SalesOrderDetail as ss
INNER JOIN SALES. SalesOrderHeader AS SO
ON ss.SalesOrderID=SO.SalesOrderID
WHERE SO.OrderDate BETWEEN '2011-05-01' AND '2011-05-31';

--QUESTION-5

SELECT CASE 
WHEN MONTH(SO.OrderDate)=6 THEN 'JUNE'
WHEN MONTH(SO.OrderDate)=9 THEN 'SEPTEMBER'
WHEN MONTH(SO.OrderDate)=5 THEN 'MAY'
WHEN MONTH(SO.OrderDate)=11 THEN 'NOVEMBER'
WHEN MONTH(SO.OrderDate)=12 THEN 'DECEMBER'
WHEN MONTH(SO.OrderDate)=7 THEN 'JULY'
WHEN MONTH(SO.OrderDate)=8 THEN 'AUGUST'
ELSE 'OCTOBER' END AS [MONTH],
sum(ss.OrderQty*(ss.UnitPrice-SS.UnitPrice*UnitPriceDiscount))[total profit in may]
FROM SALES.SalesOrderDetail as ss
INNER JOIN SALES. SalesOrderHeader AS SO
ON ss.SalesOrderID=SO.SalesOrderID
WHERE YEAR(SO.OrderDate)=2011
GROUP BY MONTH(SO.OrderDate)
ORDER BY [total profit in may]

--QUESTION 6


SELECT * FROM Sales.SalesOrderDetail
select * from sales.SalesOrderHeader
select * from sales.SalesTaxRate
select * from sales.SalesTerritory
select * from sales.Store
select * from sales.SalesPerson
SELECT * FROM SALES.Customer

SELECT * FROM PERSON.Person
WHERE FirstName='Gustavo'
and
LastName='Achong'

select * from person.ContactType






