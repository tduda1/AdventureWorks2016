USE [AdventureWorks2016CTP3]
GO
/****** Object:  Table [Production].[Product_ondisk]    Script Date: 12/26/2017 2:06:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[Product_ondisk](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ProductNumber] [nvarchar](25) NOT NULL,
	[MakeFlag] [bit] NOT NULL,
	[FinishedGoodsFlag] [bit] NOT NULL,
	[Color] [nvarchar](15) NULL,
	[SafetyStockLevel] [smallint] NOT NULL,
	[ReorderPoint] [smallint] NOT NULL,
	[StandardCost] [money] NOT NULL,
	[ListPrice] [money] NOT NULL,
	[Size] [nvarchar](5) NULL,
	[SizeUnitMeasureCode] [nchar](3) NULL,
	[WeightUnitMeasureCode] [nchar](3) NULL,
	[Weight] [decimal](8, 2) NULL,
	[DaysToManufacture] [int] NOT NULL,
	[ProductLine] [nchar](2) NULL,
	[Class] [nchar](2) NULL,
	[Style] [nchar](2) NULL,
	[ProductSubcategoryID] [int] NULL,
	[ProductModelID] [int] NULL,
	[SellStartDate] [datetime2](7) NOT NULL,
	[SellEndDate] [datetime2](7) NULL,
	[DiscontinuedDate] [datetime2](7) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [ODPK_Product_ProductID] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Production].[Product_ondisk] ADD  CONSTRAINT [ODDF_Product_MakeFlag]  DEFAULT ((1)) FOR [MakeFlag]
GO
ALTER TABLE [Production].[Product_ondisk] ADD  CONSTRAINT [ODDF_Product_FinishedGoodsFlag]  DEFAULT ((1)) FOR [FinishedGoodsFlag]
GO
ALTER TABLE [Production].[Product_ondisk] ADD  CONSTRAINT [ODDF_Product_ModifiedDate]  DEFAULT (sysdatetime()) FOR [ModifiedDate]
GO
ALTER TABLE [Production].[Product_ondisk]  WITH CHECK ADD  CONSTRAINT [ODCK_Product_Class] CHECK  ((upper([Class])='H' OR upper([Class])='M' OR upper([Class])='L' OR [Class] IS NULL))
GO
ALTER TABLE [Production].[Product_ondisk] CHECK CONSTRAINT [ODCK_Product_Class]
GO
ALTER TABLE [Production].[Product_ondisk]  WITH CHECK ADD  CONSTRAINT [ODCK_Product_DaysToManufacture] CHECK  (([DaysToManufacture]>=(0)))
GO
ALTER TABLE [Production].[Product_ondisk] CHECK CONSTRAINT [ODCK_Product_DaysToManufacture]
GO
ALTER TABLE [Production].[Product_ondisk]  WITH CHECK ADD  CONSTRAINT [ODCK_Product_ListPrice] CHECK  (([ListPrice]>=(0.00)))
GO
ALTER TABLE [Production].[Product_ondisk] CHECK CONSTRAINT [ODCK_Product_ListPrice]
GO
ALTER TABLE [Production].[Product_ondisk]  WITH CHECK ADD  CONSTRAINT [ODCK_Product_ProductLine] CHECK  ((upper([ProductLine])='R' OR upper([ProductLine])='M' OR upper([ProductLine])='T' OR upper([ProductLine])='S' OR [ProductLine] IS NULL))
GO
ALTER TABLE [Production].[Product_ondisk] CHECK CONSTRAINT [ODCK_Product_ProductLine]
GO
ALTER TABLE [Production].[Product_ondisk]  WITH CHECK ADD  CONSTRAINT [ODCK_Product_ReorderPoint] CHECK  (([ReorderPoint]>(0)))
GO
ALTER TABLE [Production].[Product_ondisk] CHECK CONSTRAINT [ODCK_Product_ReorderPoint]
GO
ALTER TABLE [Production].[Product_ondisk]  WITH CHECK ADD  CONSTRAINT [ODCK_Product_SafetyStockLevel] CHECK  (([SafetyStockLevel]>(0)))
GO
ALTER TABLE [Production].[Product_ondisk] CHECK CONSTRAINT [ODCK_Product_SafetyStockLevel]
GO
ALTER TABLE [Production].[Product_ondisk]  WITH CHECK ADD  CONSTRAINT [ODCK_Product_SellEndDate] CHECK  (([SellEndDate]>=[SellStartDate] OR [SellEndDate] IS NULL))
GO
ALTER TABLE [Production].[Product_ondisk] CHECK CONSTRAINT [ODCK_Product_SellEndDate]
GO
ALTER TABLE [Production].[Product_ondisk]  WITH CHECK ADD  CONSTRAINT [ODCK_Product_StandardCost] CHECK  (([StandardCost]>=(0.00)))
GO
ALTER TABLE [Production].[Product_ondisk] CHECK CONSTRAINT [ODCK_Product_StandardCost]
GO
ALTER TABLE [Production].[Product_ondisk]  WITH CHECK ADD  CONSTRAINT [ODCK_Product_Style] CHECK  ((upper([Style])='U' OR upper([Style])='M' OR upper([Style])='W' OR [Style] IS NULL))
GO
ALTER TABLE [Production].[Product_ondisk] CHECK CONSTRAINT [ODCK_Product_Style]
GO
ALTER TABLE [Production].[Product_ondisk]  WITH CHECK ADD  CONSTRAINT [ODCK_Product_Weight] CHECK  (([Weight]>(0.00)))
GO
ALTER TABLE [Production].[Product_ondisk] CHECK CONSTRAINT [ODCK_Product_Weight]
GO
