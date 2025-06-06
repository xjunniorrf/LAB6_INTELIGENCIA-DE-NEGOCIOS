USE [master]
GO
/****** Object:  Database [Data_Mart_Northwind]    Script Date: 10/05/2025 22:58:59 ******/
CREATE DATABASE [Data_Mart_Northwind]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Data_Mart_Northwind', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Data_Mart_Northwind.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Data_Mart_Northwind_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Data_Mart_Northwind_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Data_Mart_Northwind] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Data_Mart_Northwind].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Data_Mart_Northwind] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Data_Mart_Northwind] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Data_Mart_Northwind] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Data_Mart_Northwind] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Data_Mart_Northwind] SET ARITHABORT OFF 
GO
ALTER DATABASE [Data_Mart_Northwind] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Data_Mart_Northwind] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Data_Mart_Northwind] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Data_Mart_Northwind] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Data_Mart_Northwind] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Data_Mart_Northwind] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Data_Mart_Northwind] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Data_Mart_Northwind] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Data_Mart_Northwind] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Data_Mart_Northwind] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Data_Mart_Northwind] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Data_Mart_Northwind] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Data_Mart_Northwind] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Data_Mart_Northwind] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Data_Mart_Northwind] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Data_Mart_Northwind] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Data_Mart_Northwind] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Data_Mart_Northwind] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Data_Mart_Northwind] SET  MULTI_USER 
GO
ALTER DATABASE [Data_Mart_Northwind] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Data_Mart_Northwind] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Data_Mart_Northwind] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Data_Mart_Northwind] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Data_Mart_Northwind] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Data_Mart_Northwind] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Data_Mart_Northwind] SET QUERY_STORE = ON
GO
ALTER DATABASE [Data_Mart_Northwind] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Data_Mart_Northwind]
GO
/****** Object:  Table [dbo].[Customer_Dim]    Script Date: 10/05/2025 22:58:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Dim](
	[CustomerKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nchar](10) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[ContactName] [varchar](50) NOT NULL,
	[ContactTitle] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[PostalCode] [varchar](50) NULL,
	[Region] [varchar](50) NOT NULL,
	[Fax] [varchar](50) NULL,
	[Phone] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Customer_Dim_1] PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Dim]    Script Date: 10/05/2025 22:58:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Dim](
	[EmployeeKey] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[EmployeeName] [varchar](50) NOT NULL,
	[HireDate] [date] NOT NULL,
 CONSTRAINT [PK_Employee_Dim_1] PRIMARY KEY CLUSTERED 
(
	[EmployeeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/05/2025 22:58:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[idOrder] [int] NOT NULL,
	[idShipper] [int] NOT NULL,
	[idEmployee] [int] NOT NULL,
	[idTime] [int] NOT NULL,
	[idProduct] [int] NOT NULL,
	[idCustomer] [int] NOT NULL,
	[ShipName] [nchar](50) NOT NULL,
	[ShipAddres] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[idOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Dim]    Script Date: 10/05/2025 22:58:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Dim](
	[ProductKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[SupplierName] [varchar](50) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[ListUnitPrice] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Product_Dim_1] PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipper_Dim]    Script Date: 10/05/2025 22:58:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipper_Dim](
	[ShipperKey] [int] IDENTITY(1,1) NOT NULL,
	[ShipperID] [int] NOT NULL,
	[ShipperName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Shipper_Dim_1] PRIMARY KEY CLUSTERED 
(
	[ShipperKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Time_Dim]    Script Date: 10/05/2025 22:58:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time_Dim](
	[TimeKey] [int] IDENTITY(1,1) NOT NULL,
	[YearMonth] [datetime] NOT NULL,
	[DayOfWeek] [datetime] NOT NULL,
	[WeekEnd] [datetime] NOT NULL,
	[Quarter] [nchar](10) NOT NULL,
	[DayOfYear] [datetime] NOT NULL,
	[WeekOfYear] [datetime] NOT NULL,
	[Month] [datetime] NOT NULL,
	[Year] [datetime] NOT NULL,
	[TheDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Time_Dim] PRIMARY KEY CLUSTERED 
(
	[TimeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer_Dim] ON 

INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (1, N'ALFKI     ', N'Berlin', N'Alfreds Futterkiste', N'Obere Str. 57', N'Maria Anders', N'Sales Representative', N'Germany', N'12209', N'Ninguno', N'030-0076545', N'030-0074321')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (2, N'ANATR     ', N'México D.F.', N'Ana Trujillo Emparedados y helados', N'Avda. de la Constitución 2222', N'Ana Trujillo', N'Owner', N'Mexico', N'05021', N'Ninguno', N'(5) 555-3745', N'(5) 555-4729')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (3, N'ANTON     ', N'México D.F.', N'Antonio Moreno Taquería', N'Mataderos  2312', N'Antonio Moreno', N'Owner', N'Mexico', N'05023', N'Ninguno', NULL, N'(5) 555-3932')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (4, N'AROUT     ', N'London', N'Around the Horn', N'120 Hanover Sq.', N'Thomas Hardy', N'Sales Representative', N'UK', N'WA1 1DP', N'Ninguno', N'(171) 555-6750', N'(171) 555-7788')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (5, N'BERGS     ', N'Luleå', N'Berglunds snabbköp', N'Berguvsvägen  8', N'Christina Berglund', N'Order Administrator', N'Sweden', N'S-958 22', N'Ninguno', N'0921-12 34 67', N'0921-12 34 65')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (6, N'BLAUS     ', N'Mannheim', N'Blauer See Delikatessen', N'Forsterstr. 57', N'Hanna Moos', N'Sales Representative', N'Germany', N'68306', N'Ninguno', N'0621-08924', N'0621-08460')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (7, N'BLONP     ', N'Strasbourg', N'Blondesddsl père et fils', N'24, place Kléber', N'Frédérique Citeaux', N'Marketing Manager', N'France', N'67000', N'Ninguno', N'88.60.15.32', N'88.60.15.31')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (8, N'BOLID     ', N'Madrid', N'Bólido Comidas preparadas', N'C/ Araquil, 67', N'Martín Sommer', N'Owner', N'Spain', N'28023', N'Ninguno', N'(91) 555 91 99', N'(91) 555 22 82')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (9, N'BONAP     ', N'Marseille', N'Bon app''', N'12, rue des Bouchers', N'Laurence Lebihan', N'Owner', N'France', N'13008', N'Ninguno', N'91.24.45.41', N'91.24.45.40')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (10, N'BOTTM     ', N'Tsawassen', N'Bottom-Dollar Markets', N'23 Tsawassen Blvd.', N'Elizabeth Lincoln', N'Accounting Manager', N'Canada', N'T2F 8M4', N'BC', N'(604) 555-3745', N'(604) 555-4729')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (11, N'BSBEV     ', N'London', N'B''s Beverages', N'Fauntleroy Circus', N'Victoria Ashworth', N'Sales Representative', N'UK', N'EC2 5NT', N'Ninguno', NULL, N'(171) 555-1212')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (12, N'CACTU     ', N'Buenos Aires', N'Cactus Comidas para llevar', N'Cerrito 333', N'Patricio Simpson', N'Sales Agent', N'Argentina', N'1010', N'Ninguno', N'(1) 135-4892', N'(1) 135-5555')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (13, N'CENTC     ', N'México D.F.', N'Centro comercial Moctezuma', N'Sierras de Granada 9993', N'Francisco Chang', N'Marketing Manager', N'Mexico', N'05022', N'Ninguno', N'(5) 555-7293', N'(5) 555-3392')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (14, N'CHOPS     ', N'Bern', N'Chop-suey Chinese', N'Hauptstr. 29', N'Yang Wang', N'Owner', N'Switzerland', N'3012', N'Ninguno', NULL, N'0452-076545')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (15, N'COMMI     ', N'Sao Paulo', N'Comércio Mineiro', N'Av. dos Lusíadas, 23', N'Pedro Afonso', N'Sales Associate', N'Brazil', N'05432-043', N'SP', NULL, N'(11) 555-7647')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (16, N'CONSH     ', N'London', N'Consolidated Holdings', N'Berkeley Gardens 12  Brewery', N'Elizabeth Brown', N'Sales Representative', N'UK', N'WX1 6LT', N'Ninguno', N'(171) 555-9199', N'(171) 555-2282')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (17, N'DRACD     ', N'Aachen', N'Drachenblut Delikatessen', N'Walserweg 21', N'Sven Ottlieb', N'Order Administrator', N'Germany', N'52066', N'Ninguno', N'0241-059428', N'0241-039123')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (18, N'DUMON     ', N'Nantes', N'Du monde entier', N'67, rue des Cinquante Otages', N'Janine Labrune', N'Owner', N'France', N'44000', N'Ninguno', N'40.67.89.89', N'40.67.88.88')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (19, N'EASTC     ', N'London', N'Eastern Connection', N'35 King George', N'Ann Devon', N'Sales Agent', N'UK', N'WX3 6FW', N'Ninguno', N'(171) 555-3373', N'(171) 555-0297')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (20, N'ERNSH     ', N'Graz', N'Ernst Handel', N'Kirchgasse 6', N'Roland Mendel', N'Sales Manager', N'Austria', N'8010', N'Ninguno', N'7675-3426', N'7675-3425')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (21, N'FAMIA     ', N'Sao Paulo', N'Familia Arquibaldo', N'Rua Orós, 92', N'Aria Cruz', N'Marketing Assistant', N'Brazil', N'05442-030', N'SP', NULL, N'(11) 555-9857')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (22, N'FISSA     ', N'Madrid', N'FISSA Fabrica Inter. Salchichas S.A.', N'C/ Moralzarzal, 86', N'Diego Roel', N'Accounting Manager', N'Spain', N'28034', N'Ninguno', N'(91) 555 55 93', N'(91) 555 94 44')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (23, N'FOLIG     ', N'Lille', N'Folies gourmandes', N'184, chaussée de Tournai', N'Martine Rancé', N'Assistant Sales Agent', N'France', N'59000', N'Ninguno', N'20.16.10.17', N'20.16.10.16')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (24, N'FOLKO     ', N'Bräcke', N'Folk och fä HB', N'Åkergatan 24', N'Maria Larsson', N'Owner', N'Sweden', N'S-844 67', N'Ninguno', NULL, N'0695-34 67 21')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (25, N'FRANK     ', N'München', N'Frankenversand', N'Berliner Platz 43', N'Peter Franken', N'Marketing Manager', N'Germany', N'80805', N'Ninguno', N'089-0877451', N'089-0877310')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (26, N'FRANR     ', N'Nantes', N'France restauration', N'54, rue Royale', N'Carine Schmitt', N'Marketing Manager', N'France', N'44000', N'Ninguno', N'40.32.21.20', N'40.32.21.21')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (27, N'FRANS     ', N'Torino', N'Franchi S.p.A.', N'Via Monte Bianco 34', N'Paolo Accorti', N'Sales Representative', N'Italy', N'10100', N'Ninguno', N'011-4988261', N'011-4988260')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (28, N'FURIB     ', N'Lisboa', N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lino Rodriguez', N'Sales Manager', N'Portugal', N'1675', N'Ninguno', N'(1) 354-2535', N'(1) 354-2534')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (29, N'GALED     ', N'Barcelona', N'Galería del gastrónomo', N'Rambla de Cataluña, 23', N'Eduardo Saavedra', N'Marketing Manager', N'Spain', N'08022', N'Ninguno', N'(93) 203 4561', N'(93) 203 4560')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (30, N'GODOS     ', N'Sevilla', N'Godos Cocina Típica', N'C/ Romero, 33', N'José Pedro Freyre', N'Sales Manager', N'Spain', N'41101', N'Ninguno', NULL, N'(95) 555 82 82')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (31, N'GOURL     ', N'Campinas', N'Gourmet Lanchonetes', N'Av. Brasil, 442', N'André Fonseca', N'Sales Associate', N'Brazil', N'04876-786', N'SP', NULL, N'(11) 555-9482')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (32, N'GREAL     ', N'Eugene', N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Howard Snyder', N'Marketing Manager', N'USA', N'97403', N'OR', NULL, N'(503) 555-7555')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (33, N'GROSR     ', N'Caracas', N'GROSELLA-Restaurante', N'5ª Ave. Los Palos Grandes', N'Manuel Pereira', N'Owner', N'Venezuela', N'1081', N'DF', N'(2) 283-3397', N'(2) 283-2951')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (34, N'HANAR     ', N'Rio de Janeiro', N'Hanari Carnes', N'Rua do Paço, 67', N'Mario Pontes', N'Accounting Manager', N'Brazil', N'05454-876', N'RJ', N'(21) 555-8765', N'(21) 555-0091')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (35, N'HILAA     ', N'San Cristóbal', N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'Carlos Hernández', N'Sales Representative', N'Venezuela', N'5022', N'Táchira', N'(5) 555-1948', N'(5) 555-1340')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (36, N'HUNGC     ', N'Elgin', N'Hungry Coyote Import Store', N'City Center Plaza 516 Main St.', N'Yoshi Latimer', N'Sales Representative', N'USA', N'97827', N'OR', N'(503) 555-2376', N'(503) 555-6874')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (37, N'HUNGO     ', N'Cork', N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Patricia McKenna', N'Sales Associate', N'Ireland', NULL, N'Co. Cork', N'2967 3333', N'2967 542')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (38, N'ISLAT     ', N'Cowes', N'Island Trading', N'Garden House Crowther Way', N'Helen Bennett', N'Marketing Manager', N'UK', N'PO31 7PJ', N'Isle of Wight', NULL, N'(198) 555-8888')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (39, N'KOENE     ', N'Brandenburg', N'Königlich Essen', N'Maubelstr. 90', N'Philip Cramer', N'Sales Associate', N'Germany', N'14776', N'Ninguno', NULL, N'0555-09876')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (40, N'LACOR     ', N'Versailles', N'La corne d''abondance', N'67, avenue de l''Europe', N'Daniel Tonini', N'Sales Representative', N'France', N'78000', N'Ninguno', N'30.59.85.11', N'30.59.84.10')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (41, N'LAMAI     ', N'Toulouse', N'La maison d''Asie', N'1 rue Alsace-Lorraine', N'Annette Roulet', N'Sales Manager', N'France', N'31000', N'Ninguno', N'61.77.61.11', N'61.77.61.10')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (42, N'LAUGB     ', N'Vancouver', N'Laughing Bacchus Wine Cellars', N'1900 Oak St.', N'Yoshi Tannamuri', N'Marketing Assistant', N'Canada', N'V3F 2K1', N'BC', N'(604) 555-7293', N'(604) 555-3392')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (43, N'LAZYK     ', N'Walla Walla', N'Lazy K Kountry Store', N'12 Orchestra Terrace', N'John Steel', N'Marketing Manager', N'USA', N'99362', N'WA', N'(509) 555-6221', N'(509) 555-7969')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (44, N'LEHMS     ', N'Frankfurt a.M.', N'Lehmanns Marktstand', N'Magazinweg 7', N'Renate Messner', N'Sales Representative', N'Germany', N'60528', N'Ninguno', N'069-0245874', N'069-0245984')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (45, N'LETSS     ', N'San Francisco', N'Let''s Stop N Shop', N'87 Polk St. Suite 5', N'Jaime Yorres', N'Owner', N'USA', N'94117', N'CA', NULL, N'(415) 555-5938')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (46, N'LILAS     ', N'Barquisimeto', N'LILA-Supermercado', N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Carlos González', N'Accounting Manager', N'Venezuela', N'3508', N'Lara', N'(9) 331-7256', N'(9) 331-6954')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (47, N'LINOD     ', N'I. de Margarita', N'LINO-Delicateses', N'Ave. 5 de Mayo Porlamar', N'Felipe Izquierdo', N'Owner', N'Venezuela', N'4980', N'Nueva Esparta', N'(8) 34-93-93', N'(8) 34-56-12')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (48, N'LONEP     ', N'Portland', N'Lonesome Pine Restaurant', N'89 Chiaroscuro Rd.', N'Fran Wilson', N'Sales Manager', N'USA', N'97219', N'OR', N'(503) 555-9646', N'(503) 555-9573')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (49, N'MAGAA     ', N'Bergamo', N'Magazzini Alimentari Riuniti', N'Via Ludovico il Moro 22', N'Giovanni Rovelli', N'Marketing Manager', N'Italy', N'24100', N'Ninguno', N'035-640231', N'035-640230')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (50, N'MAISD     ', N'Bruxelles', N'Maison Dewey', N'Rue Joseph-Bens 532', N'Catherine Dewey', N'Sales Agent', N'Belgium', N'B-1180', N'Ninguno', N'(02) 201 24 68', N'(02) 201 24 67')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (51, N'MEREP     ', N'Montréal', N'Mère Paillarde', N'43 rue St. Laurent', N'Jean Fresnière', N'Marketing Assistant', N'Canada', N'H1J 1C3', N'Québec', N'(514) 555-8055', N'(514) 555-8054')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (52, N'MORGK     ', N'Leipzig', N'Morgenstern Gesundkost', N'Heerstr. 22', N'Alexander Feuer', N'Marketing Assistant', N'Germany', N'04179', N'Ninguno', NULL, N'0342-023176')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (53, N'NORTS     ', N'London', N'North/South', N'South House 300 Queensbridge', N'Simon Crowther', N'Sales Associate', N'UK', N'SW7 1RZ', N'Ninguno', N'(171) 555-2530', N'(171) 555-7733')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (54, N'OCEAN     ', N'Buenos Aires', N'Océano Atlántico Ltda.', N'Ing. Gustavo Moncada 8585 Piso 20-A', N'Yvonne Moncada', N'Sales Agent', N'Argentina', N'1010', N'Ninguno', N'(1) 135-5535', N'(1) 135-5333')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (55, N'OLDWO     ', N'Anchorage', N'Old World Delicatessen', N'2743 Bering St.', N'Rene Phillips', N'Sales Representative', N'USA', N'99508', N'AK', N'(907) 555-2880', N'(907) 555-7584')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (56, N'OTTIK     ', N'Köln', N'Ottilies Käseladen', N'Mehrheimerstr. 369', N'Henriette Pfalzheim', N'Owner', N'Germany', N'50739', N'Ninguno', N'0221-0765721', N'0221-0644327')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (57, N'PARIS     ', N'Paris', N'Paris spécialités', N'265, boulevard Charonne', N'Marie Bertrand', N'Owner', N'France', N'75012', N'Ninguno', N'(1) 42.34.22.77', N'(1) 42.34.22.66')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (58, N'PERIC     ', N'México D.F.', N'Pericles Comidas clásicas', N'Calle Dr. Jorge Cash 321', N'Guillermo Fernández', N'Sales Representative', N'Mexico', N'05033', N'Ninguno', N'(5) 545-3745', N'(5) 552-3745')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (59, N'PICCO     ', N'Salzburg', N'Piccolo und mehr', N'Geislweg 14', N'Georg Pipps', N'Sales Manager', N'Austria', N'5020', N'Ninguno', N'6562-9723', N'6562-9722')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (60, N'PRINI     ', N'Lisboa', N'Princesa Isabel Vinhos', N'Estrada da saúde n. 58', N'Isabel de Castro', N'Sales Representative', N'Portugal', N'1756', N'Ninguno', NULL, N'(1) 356-5634')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (61, N'QUEDE     ', N'Rio de Janeiro', N'Que Delícia', N'Rua da Panificadora, 12', N'Bernardo Batista', N'Accounting Manager', N'Brazil', N'02389-673', N'RJ', N'(21) 555-4545', N'(21) 555-4252')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (62, N'QUEEN     ', N'Sao Paulo', N'Queen Cozinha', N'Alameda dos Canàrios, 891', N'Lúcia Carvalho', N'Marketing Assistant', N'Brazil', N'05487-020', N'SP', NULL, N'(11) 555-1189')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (63, N'QUICK     ', N'Cunewalde', N'QUICK-Stop', N'Taucherstraße 10', N'Horst Kloss', N'Accounting Manager', N'Germany', N'01307', N'Ninguno', NULL, N'0372-035188')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (64, N'RANCH     ', N'Buenos Aires', N'Rancho grande', N'Av. del Libertador 900', N'Sergio Gutiérrez', N'Sales Representative', N'Argentina', N'1010', N'Ninguno', N'(1) 123-5556', N'(1) 123-5555')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (65, N'RATTC     ', N'Albuquerque', N'Rattlesnake Canyon Grocery', N'2817 Milton Dr.', N'Paula Wilson', N'Assistant Sales Representative', N'USA', N'87110', N'NM', N'(505) 555-3620', N'(505) 555-5939')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (66, N'REGGC     ', N'Reggio Emilia', N'Reggiani Caseifici', N'Strada Provinciale 124', N'Maurizio Moroni', N'Sales Associate', N'Italy', N'42100', N'Ninguno', N'0522-556722', N'0522-556721')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (67, N'RICAR     ', N'Rio de Janeiro', N'Ricardo Adocicados', N'Av. Copacabana, 267', N'Janete Limeira', N'Assistant Sales Agent', N'Brazil', N'02389-890', N'RJ', NULL, N'(21) 555-3412')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (68, N'RICSU     ', N'Genève', N'Richter Supermarkt', N'Grenzacherweg 237', N'Michael Holz', N'Sales Manager', N'Switzerland', N'1203', N'Ninguno', NULL, N'0897-034214')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (69, N'ROMEY     ', N'Madrid', N'Romero y tomillo', N'Gran Vía, 1', N'Alejandra Camino', N'Accounting Manager', N'Spain', N'28001', N'Ninguno', N'(91) 745 6210', N'(91) 745 6200')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (70, N'SANTG     ', N'Stavern', N'Santé Gourmet', N'Erling Skakkes gate 78', N'Jonas Bergulfsen', N'Owner', N'Norway', N'4110', N'Ninguno', N'07-98 92 47', N'07-98 92 35')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (71, N'SAVEA     ', N'Boise', N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Jose Pavarotti', N'Sales Representative', N'USA', N'83720', N'ID', NULL, N'(208) 555-8097')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (72, N'SEVES     ', N'London', N'Seven Seas Imports', N'90 Wadhurst Rd.', N'Hari Kumar', N'Sales Manager', N'UK', N'OX15 4NB', N'Ninguno', N'(171) 555-5646', N'(171) 555-1717')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (73, N'SIMOB     ', N'Kobenhavn', N'Simons bistro', N'Vinbæltet 34', N'Jytte Petersen', N'Owner', N'Denmark', N'1734', N'Ninguno', N'31 13 35 57', N'31 12 34 56')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (74, N'SPECD     ', N'Paris', N'Spécialités du monde', N'25, rue Lauriston', N'Dominique Perrier', N'Marketing Manager', N'France', N'75016', N'Ninguno', N'(1) 47.55.60.20', N'(1) 47.55.60.10')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (75, N'SPLIR     ', N'Lander', N'Split Rail Beer & Ale', N'P.O. Box 555', N'Art Braunschweiger', N'Sales Manager', N'USA', N'82520', N'WY', N'(307) 555-6525', N'(307) 555-4680')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (76, N'SUPRD     ', N'Charleroi', N'Suprêmes délices', N'Boulevard Tirou, 255', N'Pascale Cartrain', N'Accounting Manager', N'Belgium', N'B-6000', N'Ninguno', N'(071) 23 67 22 21', N'(071) 23 67 22 20')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (77, N'THEBI     ', N'Portland', N'The Big Cheese', N'89 Jefferson Way Suite 2', N'Liz Nixon', N'Marketing Manager', N'USA', N'97201', N'OR', NULL, N'(503) 555-3612')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (78, N'THECR     ', N'Butte', N'The Cracker Box', N'55 Grizzly Peak Rd.', N'Liu Wong', N'Marketing Assistant', N'USA', N'59801', N'MT', N'(406) 555-8083', N'(406) 555-5834')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (79, N'TOMSP     ', N'Münster', N'Toms Spezialitäten', N'Luisenstr. 48', N'Karin Josephs', N'Marketing Manager', N'Germany', N'44087', N'Ninguno', N'0251-035695', N'0251-031259')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (80, N'TORTU     ', N'México D.F.', N'Tortuga Restaurante', N'Avda. Azteca 123', N'Miguel Angel Paolino', N'Owner', N'Mexico', N'05033', N'Ninguno', NULL, N'(5) 555-2933')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (81, N'TRADH     ', N'Sao Paulo', N'Tradição Hipermercados', N'Av. Inês de Castro, 414', N'Anabela Domingues', N'Sales Representative', N'Brazil', N'05634-030', N'SP', N'(11) 555-2168', N'(11) 555-2167')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (82, N'TRAIH     ', N'Kirkland', N'Trail''s Head Gourmet Provisioners', N'722 DaVinci Blvd.', N'Helvetius Nagy', N'Sales Associate', N'USA', N'98034', N'WA', N'(206) 555-2174', N'(206) 555-8257')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (83, N'VAFFE     ', N'Århus', N'Vaffeljernet', N'Smagsloget 45', N'Palle Ibsen', N'Sales Manager', N'Denmark', N'8200', N'Ninguno', N'86 22 33 44', N'86 21 32 43')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (84, N'VICTE     ', N'Lyon', N'Victuailles en stock', N'2, rue du Commerce', N'Mary Saveley', N'Sales Agent', N'France', N'69004', N'Ninguno', N'78.32.54.87', N'78.32.54.86')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (85, N'VINET     ', N'Reims', N'Vins et alcools Chevalier', N'59 rue de l''Abbaye', N'Paul Henriot', N'Accounting Manager', N'France', N'51100', N'Ninguno', N'26.47.15.11', N'26.47.15.10')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (86, N'WANDK     ', N'Stuttgart', N'Die Wandernde Kuh', N'Adenauerallee 900', N'Rita Müller', N'Sales Representative', N'Germany', N'70563', N'Ninguno', N'0711-035428', N'0711-020361')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (87, N'WARTH     ', N'Oulu', N'Wartian Herkku', N'Torikatu 38', N'Pirkko Koskitalo', N'Accounting Manager', N'Finland', N'90110', N'Ninguno', N'981-443655', N'981-443655')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (88, N'WELLI     ', N'Resende', N'Wellington Importadora', N'Rua do Mercado, 12', N'Paula Parente', N'Sales Manager', N'Brazil', N'08737-363', N'SP', NULL, N'(14) 555-8122')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (89, N'WHITC     ', N'Seattle', N'White Clover Markets', N'305 - 14th Ave. S. Suite 3B', N'Karl Jablonski', N'Owner', N'USA', N'98128', N'WA', N'(206) 555-4115', N'(206) 555-4112')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (90, N'WILMK     ', N'Helsinki', N'Wilman Kala', N'Keskuskatu 45', N'Matti Karttunen', N'Owner/Marketing Assistant', N'Finland', N'21240', N'Ninguno', N'90-224 8858', N'90-224 8858')
INSERT [dbo].[Customer_Dim] ([CustomerKey], [CustomerID], [City], [CompanyName], [Address], [ContactName], [ContactTitle], [Country], [PostalCode], [Region], [Fax], [Phone]) VALUES (91, N'WOLZA     ', N'Warszawa', N'Wolski  Zajazd', N'ul. Filtrowa 68', N'Zbyszek Piestrzeniewicz', N'Owner', N'Poland', N'01-012', N'Ninguno', N'(26) 642-7012', N'(26) 642-7012')
SET IDENTITY_INSERT [dbo].[Customer_Dim] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee_Dim] ON 

INSERT [dbo].[Employee_Dim] ([EmployeeKey], [EmployeeId], [EmployeeName], [HireDate]) VALUES (1, 1, N'Davolio, Nancy', CAST(N'1992-05-01' AS Date))
INSERT [dbo].[Employee_Dim] ([EmployeeKey], [EmployeeId], [EmployeeName], [HireDate]) VALUES (2, 2, N'Fuller, Andrew', CAST(N'1992-08-14' AS Date))
INSERT [dbo].[Employee_Dim] ([EmployeeKey], [EmployeeId], [EmployeeName], [HireDate]) VALUES (3, 3, N'Leverling, Janet', CAST(N'1992-04-01' AS Date))
INSERT [dbo].[Employee_Dim] ([EmployeeKey], [EmployeeId], [EmployeeName], [HireDate]) VALUES (4, 4, N'Peacock, Margaret', CAST(N'1993-05-03' AS Date))
INSERT [dbo].[Employee_Dim] ([EmployeeKey], [EmployeeId], [EmployeeName], [HireDate]) VALUES (5, 5, N'Buchanan, Steven', CAST(N'1993-10-17' AS Date))
INSERT [dbo].[Employee_Dim] ([EmployeeKey], [EmployeeId], [EmployeeName], [HireDate]) VALUES (6, 6, N'Suyama, Michael', CAST(N'1993-10-17' AS Date))
INSERT [dbo].[Employee_Dim] ([EmployeeKey], [EmployeeId], [EmployeeName], [HireDate]) VALUES (7, 7, N'King, Robert', CAST(N'1994-01-02' AS Date))
INSERT [dbo].[Employee_Dim] ([EmployeeKey], [EmployeeId], [EmployeeName], [HireDate]) VALUES (8, 8, N'Callahan, Laura', CAST(N'1994-03-05' AS Date))
INSERT [dbo].[Employee_Dim] ([EmployeeKey], [EmployeeId], [EmployeeName], [HireDate]) VALUES (9, 9, N'Dodsworth, Anne', CAST(N'1994-11-15' AS Date))
SET IDENTITY_INSERT [dbo].[Employee_Dim] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Dim] ON 

INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (1, 1, N'Chai', N'Exotic Liquids', N'Beverages', N'18.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (2, 2, N'Chang', N'Exotic Liquids', N'Beverages', N'19.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (3, 3, N'Aniseed Syrup', N'Exotic Liquids', N'Condiments', N'10.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (4, 4, N'Chef Anton''s Cajun Seasoning', N'New Orleans Cajun Delights', N'Condiments', N'22.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (5, 5, N'Chef Anton''s Gumbo Mix', N'New Orleans Cajun Delights', N'Condiments', N'21.35')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (6, 6, N'Grandma''s Boysenberry Spread', N'Grandma Kelly''s Homestead', N'Condiments', N'25.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (7, 7, N'Uncle Bob''s Organic Dried Pears', N'Grandma Kelly''s Homestead', N'Produce', N'30.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (8, 8, N'Northwoods Cranberry Sauce', N'Grandma Kelly''s Homestead', N'Condiments', N'40.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (9, 9, N'Mishi Kobe Niku', N'Tokyo Traders', N'Meat/Poultry', N'97.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (10, 10, N'Ikura', N'Tokyo Traders', N'Seafood', N'31.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (11, 11, N'Queso Cabrales', N'Cooperativa de Quesos ''Las Cabras''', N'Dairy Products', N'21.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (12, 12, N'Queso Manchego La Pastora', N'Cooperativa de Quesos ''Las Cabras''', N'Dairy Products', N'38.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (13, 13, N'Konbu', N'Mayumi''s', N'Seafood', N'6.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (14, 14, N'Tofu', N'Mayumi''s', N'Produce', N'23.25')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (15, 15, N'Genen Shouyu', N'Mayumi''s', N'Condiments', N'15.50')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (16, 16, N'Pavlova', N'Pavlova, Ltd.', N'Confections', N'17.45')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (17, 17, N'Alice Mutton', N'Pavlova, Ltd.', N'Meat/Poultry', N'39.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (18, 18, N'Carnarvon Tigers', N'Pavlova, Ltd.', N'Seafood', N'62.50')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (19, 19, N'Teatime Chocolate Biscuits', N'Specialty Biscuits, Ltd.', N'Confections', N'9.20')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (20, 20, N'Sir Rodney''s Marmalade', N'Specialty Biscuits, Ltd.', N'Confections', N'81.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (21, 21, N'Sir Rodney''s Scones', N'Specialty Biscuits, Ltd.', N'Confections', N'10.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (22, 22, N'Gustaf''s Knäckebröd', N'PB Knäckebröd AB', N'Grains/Cereals', N'21.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (23, 23, N'Tunnbröd', N'PB Knäckebröd AB', N'Grains/Cereals', N'9.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (24, 24, N'Guaraná Fantástica', N'Refrescos Americanas LTDA', N'Beverages', N'4.50')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (25, 25, N'NuNuCa Nuß-Nougat-Creme', N'Heli Süßwaren GmbH & Co. KG', N'Confections', N'14.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (26, 26, N'Gumbär Gummibärchen', N'Heli Süßwaren GmbH & Co. KG', N'Confections', N'31.23')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (27, 27, N'Schoggi Schokolade', N'Heli Süßwaren GmbH & Co. KG', N'Confections', N'43.90')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (28, 28, N'Rössle Sauerkraut', N'Plutzer Lebensmittelgroßmärkte AG', N'Produce', N'45.60')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (29, 29, N'Thüringer Rostbratwurst', N'Plutzer Lebensmittelgroßmärkte AG', N'Meat/Poultry', N'123.79')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (30, 30, N'Nord-Ost Matjeshering', N'Nord-Ost-Fisch Handelsgesellschaft mbH', N'Seafood', N'25.89')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (31, 31, N'Gorgonzola Telino', N'Formaggi Fortini s.r.l.', N'Dairy Products', N'12.50')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (32, 32, N'Mascarpone Fabioli', N'Formaggi Fortini s.r.l.', N'Dairy Products', N'32.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (33, 33, N'Geitost', N'Norske Meierier', N'Dairy Products', N'2.50')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (34, 34, N'Sasquatch Ale', N'Bigfoot Breweries', N'Beverages', N'14.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (35, 35, N'Steeleye Stout', N'Bigfoot Breweries', N'Beverages', N'18.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (36, 36, N'Inlagd Sill', N'Svensk Sjöföda AB', N'Seafood', N'19.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (37, 37, N'Gravad lax', N'Svensk Sjöföda AB', N'Seafood', N'26.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (38, 38, N'Côte de Blaye', N'Aux joyeux ecclésiastiques', N'Beverages', N'263.50')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (39, 39, N'Chartreuse verte', N'Aux joyeux ecclésiastiques', N'Beverages', N'18.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (40, 40, N'Boston Crab Meat', N'New England Seafood Cannery', N'Seafood', N'18.40')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (41, 41, N'Jack''s New England Clam Chowder', N'New England Seafood Cannery', N'Seafood', N'9.65')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (42, 42, N'Singaporean Hokkien Fried Mee', N'Leka Trading', N'Grains/Cereals', N'14.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (43, 43, N'Ipoh Coffee', N'Leka Trading', N'Beverages', N'46.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (44, 44, N'Gula Malacca', N'Leka Trading', N'Condiments', N'19.45')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (45, 45, N'Rogede sild', N'Lyngbysild', N'Seafood', N'9.50')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (46, 46, N'Spegesild', N'Lyngbysild', N'Seafood', N'12.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (47, 47, N'Zaanse koeken', N'Zaanse Snoepfabriek', N'Confections', N'9.50')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (48, 48, N'Chocolade', N'Zaanse Snoepfabriek', N'Confections', N'12.75')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (49, 49, N'Maxilaku', N'Karkki Oy', N'Confections', N'20.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (50, 50, N'Valkoinen suklaa', N'Karkki Oy', N'Confections', N'16.25')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (51, 51, N'Manjimup Dried Apples', N'G''day, Mate', N'Produce', N'53.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (52, 52, N'Filo Mix', N'G''day, Mate', N'Grains/Cereals', N'7.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (53, 53, N'Perth Pasties', N'G''day, Mate', N'Meat/Poultry', N'32.80')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (54, 54, N'Tourtière', N'Ma Maison', N'Meat/Poultry', N'7.45')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (55, 55, N'Pâté chinois', N'Ma Maison', N'Meat/Poultry', N'24.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (56, 56, N'Gnocchi di nonna Alice', N'Pasta Buttini s.r.l.', N'Grains/Cereals', N'38.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (57, 57, N'Ravioli Angelo', N'Pasta Buttini s.r.l.', N'Grains/Cereals', N'19.50')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (58, 58, N'Escargots de Bourgogne', N'Escargots Nouveaux', N'Seafood', N'13.25')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (59, 59, N'Raclette Courdavault', N'Gai pâturage', N'Dairy Products', N'55.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (60, 60, N'Camembert Pierrot', N'Gai pâturage', N'Dairy Products', N'34.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (61, 61, N'Sirop d''érable', N'Forêts d''érables', N'Condiments', N'28.50')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (62, 62, N'Tarte au sucre', N'Forêts d''érables', N'Confections', N'49.30')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (63, 63, N'Vegie-spread', N'Pavlova, Ltd.', N'Condiments', N'43.90')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (64, 64, N'Wimmers gute Semmelknödel', N'Plutzer Lebensmittelgroßmärkte AG', N'Grains/Cereals', N'33.25')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (65, 65, N'Louisiana Fiery Hot Pepper Sauce', N'New Orleans Cajun Delights', N'Condiments', N'21.05')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (66, 66, N'Louisiana Hot Spiced Okra', N'New Orleans Cajun Delights', N'Condiments', N'17.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (67, 67, N'Laughing Lumberjack Lager', N'Bigfoot Breweries', N'Beverages', N'14.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (68, 68, N'Scottish Longbreads', N'Specialty Biscuits, Ltd.', N'Confections', N'12.50')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (69, 69, N'Gudbrandsdalsost', N'Norske Meierier', N'Dairy Products', N'36.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (70, 70, N'Outback Lager', N'Pavlova, Ltd.', N'Beverages', N'15.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (71, 71, N'Flotemysost', N'Norske Meierier', N'Dairy Products', N'21.50')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (72, 72, N'Mozzarella di Giovanni', N'Formaggi Fortini s.r.l.', N'Dairy Products', N'34.80')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (73, 73, N'Röd Kaviar', N'Svensk Sjöföda AB', N'Seafood', N'15.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (74, 74, N'Longlife Tofu', N'Tokyo Traders', N'Produce', N'10.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (75, 75, N'Rhönbräu Klosterbier', N'Plutzer Lebensmittelgroßmärkte AG', N'Beverages', N'7.75')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (76, 76, N'Lakkalikööri', N'Karkki Oy', N'Beverages', N'18.00')
INSERT [dbo].[Product_Dim] ([ProductKey], [ProductID], [ProductName], [SupplierName], [CategoryName], [ListUnitPrice]) VALUES (77, 77, N'Original Frankfurter grüne Soße', N'Plutzer Lebensmittelgroßmärkte AG', N'Condiments', N'13.00')
SET IDENTITY_INSERT [dbo].[Product_Dim] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipper_Dim] ON 

INSERT [dbo].[Shipper_Dim] ([ShipperKey], [ShipperID], [ShipperName]) VALUES (1, 1, N'Speedy Express')
INSERT [dbo].[Shipper_Dim] ([ShipperKey], [ShipperID], [ShipperName]) VALUES (2, 2, N'United Package')
INSERT [dbo].[Shipper_Dim] ([ShipperKey], [ShipperID], [ShipperName]) VALUES (3, 3, N'Federal Shipping')
SET IDENTITY_INSERT [dbo].[Shipper_Dim] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer_Dim] FOREIGN KEY([idCustomer])
REFERENCES [dbo].[Customer_Dim] ([CustomerKey])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer_Dim]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employee_Dim] FOREIGN KEY([idEmployee])
REFERENCES [dbo].[Employee_Dim] ([EmployeeKey])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Employee_Dim]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product_Dim] FOREIGN KEY([idProduct])
REFERENCES [dbo].[Product_Dim] ([ProductKey])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product_Dim]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Shipper_Dim] FOREIGN KEY([idShipper])
REFERENCES [dbo].[Shipper_Dim] ([ShipperKey])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Shipper_Dim]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Time_Dim] FOREIGN KEY([idTime])
REFERENCES [dbo].[Time_Dim] ([TimeKey])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Time_Dim]
GO
USE [master]
GO
ALTER DATABASE [Data_Mart_Northwind] SET  READ_WRITE 
GO
