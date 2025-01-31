/* Retrieve top customers by total spending */
select 
	c.BillToCustomerID as [CustomerID],
	c.CustomerName,
	cg.CustomerCategoryName,
	SUM(il.Quantity) as [Quantity],
	SUM(il.Quantity * il.UnitPrice) as [TotalSpent]

from 
	Sales.Invoices as i inner join Sales.InvoiceLines as il
	on i.InvoiceID = il.InvoiceID
	inner join Sales.Customers as c
	on i.CustomerID = c.CustomerID
	inner join Sales.CustomerCategories as cg
	on c.CustomerCategoryID = cg.CustomerCategoryID

group by c.CustomerName , c.BillToCustomerID , cg.CustomerCategoryName 
order by TotalSpent desc;
