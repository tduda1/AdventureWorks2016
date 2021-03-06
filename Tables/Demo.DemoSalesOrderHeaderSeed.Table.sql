USE [AdventureWorks2016CTP3]
GO
/****** Object:  Table [Demo].[DemoSalesOrderHeaderSeed]    Script Date: 12/26/2017 2:06:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Demo].[DemoSalesOrderHeaderSeed]
(
	[DueDate] [datetime2](7) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[SalesPersonID] [int] NOT NULL,
	[BillToAddressID] [int] NOT NULL,
	[ShipToAddressID] [int] NOT NULL,
	[ShipMethodID] [int] NOT NULL,
	[LocalID] [int] IDENTITY(1,1) NOT NULL,

 PRIMARY KEY NONCLUSTERED 
(
	[LocalID] ASC
)
)WITH ( MEMORY_OPTIMIZED = ON , DURABILITY = SCHEMA_AND_DATA )
GO
