/* Retrieve yearly revenue, product details, and customer Category ID */
SELECT 
    YEAR(i.InvoiceDate) as [Sales Year],
	c.CustomerName,
    c.CustomerCategoryID as [Customer Category ID],
    si.StockItemName as [Product Name],
    sg.StockGroupName as [Product Category],
    SUM(il.Quantity) as [Total Quantity Sold],
    SUM(il.Quantity * il.UnitPrice) as [Total Revenue]

FROM 
	Sales.Invoices as i inner join Sales.InvoiceLines as il
	on i.InvoiceID = il.InvoiceID
	inner join Warehouse.StockItems as si
	on il.StockItemID = si.StockItemID
	inner join Warehouse.StockItemStockGroups as sisg
	on si.StockItemID = sisg.StockItemID 
	inner join Warehouse.StockGroups as sg 
	on sg.StockGroupID = sisg.StockGroupID
	JOIN Sales.Customers as c
	on i.CustomerID = c.CustomerID

GROUP BY YEAR(i.InvoiceDate), C.CustomerCategoryID,c.CustomerName, si.StockItemName, sg.StockGroupName
ORDER BY [Sales Year], [Total Revenue] DESC;
