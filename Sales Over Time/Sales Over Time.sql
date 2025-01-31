/* Retrieve monthly sales revenue per product */
select
	sti.StockItemName,
	sg.StockGroupName,
	InvoiceDate as [Date],
	SUM(Quantity * il.UnitPrice) as [TotalRevenue]
from
	Sales.Invoices as si inner JOIN Sales.InvoiceLines as il
	on si.InvoiceID = il.InvoiceID
	inner join Warehouse.StockItems  as sti
	on il.StockItemID = sti.StockItemID
	inner join Warehouse.StockItemStockGroups as sisg
	on sti.StockItemID = sisg.StockItemID
	inner join Warehouse.StockGroups as sg
	on sisg.StockGroupID = sg.StockGroupID
group by InvoiceDate, sti.StockItemName , sg.StockGroupName
order by Date, TotalRevenue desc

