/*insert into [Data_Mart_Northwind].dbo.Shipper_Dim
(ShipperName, ShipperID)
select CompanyName, ShipperID
from Shippers*/

--select * from [Data_Mart_Northwind].dbo.Shipper_Dim
--DELETE FROM dbo.Shipper_Dim
--DBCC CHECKIDENT ('dbo.Shipper_Dim', RESEED, 0);

--select * from [Data_Mart_Northwind].dbo.Employee_Dim

--SELECT EmployeeID, LastName + ','+FirstName AS EmployeeName, HireDate
--from Northwind.dbo.Employees

/*insert into Employee_Dim(EmployeeId, EmployeeName, HireDate)
select EmployeeId, LastName + ', ' + FirstName AS EmployeeName, HireDate
from Northwind.dbo.Employees*/

--select * from Employee_Dim

/*select Products.ProductName, Suppliers.CompanyName, Categories.CategoryName,
  Products.ProductID, Products.UnitPrice
from Categories INNER JOIN
Products on Categories.CategoryID = Products.CategoryID INNER JOIN 
  Suppliers on Products.SupplierID = Suppliers.SupplierID*/

  -- select * from [Data_Mart_Northwind].dbo.Product_Dim dp

  /*insert into[Data_Mart_Northwind].dbo.Product_Dim([ProductName],[SupplierName],
  [CategoryName], [ProductID],[ListUnitPrice])

  select Products.ProductName, Suppliers.CompanyName, Categories.CategoryName,
  Products.ProductID, Products.UnitPrice

  from Categories INNER JOIN 
  Products on Categories.CategoryID = Products.CategoryID INNER JOIN
  Suppliers on Products.SupplierID = Suppliers.SupplierID*/

  --select * from [Data_Mart_Northwind].dbo.Product_Dim dp

  --select * from Data_Mart_Northwind.dbo.Customer_Dim

  /*select Phone, Fax, regionc=isnull(Region, 'otro'), PostalCode, Country,
  ContactTitle,
  Address, City, CustomerID, CompanyName, ContactName
  from Customers*/

  /*insert into [Data_Mart_Northwind].dbo.Customer_Dim([Phone],[Fax],[Region],
  [PostalCode],[Country],[ContactTitle],[Address],[City],[CustomerID]
  ,[CompanyName],[ContactName])

  select Phone, Fax, region_n=isnull(Region,'Ninguno'), PostalCode, Country,
  ContactTitle,
  Address, City, CustomerID, CompanyName, ContactName
  from Customers*/

  --select * from Data_Mart_Northwind.dbo.Customer_Dim

  --select * from [Data_Mart_Northwind].dbo.Time_Dim

  select distinct DateName(month, S.ShippedDate) +'_' + DateName(year,S.ShippedDate) as month_Year,
  DateName(dw, S.ShippedDate)as DayOfWeek, 
  End_week = Case Datepart(dw,S.ShippedDate)
	 WHEN 5 THEN 'yes'
	 WHEN 6 THEN 'yes'
	 ELSE 'Not'
	 END,
DatePart(qq, S.ShippedDate) AS [Quarter], DatePart(dy,S.ShippedDate) as DayOfYear,
DatePart(wk, S.ShippedDate) AS WeekOfYear, DatePart(mm, S.ShippedDate) as [Month],
datepart(yy, S.ShippedDate) as year, S.ShippedDate
FROM Orders S
WHERE S.ShippedDate IS NOT NULL


