USE [AdventureWorks2016CTP3]
GO
/****** Object:  Table [Demo].[DemoSalesOrderDetailSeed]    Script Date: 12/26/2017 2:06:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Demo].[DemoSalesOrderDetailSeed]
(
	[OrderQty] [smallint] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SpecialOfferID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[LocalID] [int] IDENTITY(1,1) NOT NULL,

INDEX [IX_OrderID] NONCLUSTERED HASH 
(
	[OrderID]
)WITH ( BUCKET_COUNT = 1048576),
 PRIMARY KEY NONCLUSTERED 
(
	[LocalID] ASC
)
)WITH ( MEMORY_OPTIMIZED = ON , DURABILITY = SCHEMA_AND_DATA )
GO
