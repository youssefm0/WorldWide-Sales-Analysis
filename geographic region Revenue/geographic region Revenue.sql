/* Retrieve revenue distribution by geographic region */
SELECT 
    il.InvoiceID,
    cit.CityName AS [City],
    cnt.CountryName AS [Country],
    SUM(il.Quantity * il.UnitPrice) AS [Total Revenue],
    SUM(il.Quantity) AS [Total Quantity],
    AVG(il.UnitPrice) AS [Average Price PerUnit]

from 
	Sales.Invoices as i inner join Sales.InvoiceLines as il
	on i.InvoiceID = il.InvoiceID
	inner join Application.People as p
	on p.PersonID = il.LastEditedBy
	inner join Application.Countries as cnt
	on p.PersonID = cnt.LastEditedBy
	inner join Application.Cities as cit
	on p.PersonID = cit.LastEditedBy

group by cit.CityName, cnt.CountryName, il.InvoiceID
order by [Total Revenue] desc;

