USE [AdventureWorks2016CTP3]
GO
/****** Object:  Table [Sales].[SalesOrderHeader_ondisk]    Script Date: 12/26/2017 2:06:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[SalesOrderHeader_ondisk](
	[SalesOrderID] [int] IDENTITY(1,1) NOT NULL,
	[RevisionNumber] [tinyint] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[DueDate] [datetime2](7) NOT NULL,
	[ShipDate] [datetime2](7) NULL,
	[Status] [tinyint] NOT NULL,
	[OnlineOrderFlag] [bit] NOT NULL,
	[PurchaseOrderNumber] [nvarchar](25) NULL,
	[AccountNumber] [nvarchar](15) NULL,
	[CustomerID] [int] NOT NULL,
	[SalesPersonID] [int] NOT NULL,
	[TerritoryID] [int] NULL,
	[BillToAddressID] [int] NOT NULL,
	[ShipToAddressID] [int] NOT NULL,
	[ShipMethodID] [int] NOT NULL,
	[CreditCardID] [int] NULL,
	[CreditCardApprovalCode] [varchar](15) NULL,
	[CurrencyRateID] [int] NULL,
	[SubTotal] [money] NOT NULL,
	[TaxAmt] [money] NOT NULL,
	[Freight] [money] NOT NULL,
	[Comment] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk] ADD  CONSTRAINT [ODDF_SalesOrderHeader_RevisionNumber]  DEFAULT ((0)) FOR [RevisionNumber]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk] ADD  CONSTRAINT [ODDF_SalesOrderHeader_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk] ADD  CONSTRAINT [ODDF_SalesOrderHeader_OnlineOrderFlag]  DEFAULT ((1)) FOR [OnlineOrderFlag]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk] ADD  CONSTRAINT [ODDF_SalesOrderHeader_SalesPersonID]  DEFAULT ((-1)) FOR [SalesPersonID]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk] ADD  CONSTRAINT [ODDF_SalesOrderHeader_SubTotal]  DEFAULT ((0.00)) FOR [SubTotal]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk] ADD  CONSTRAINT [ODDF_SalesOrderHeader_TaxAmt]  DEFAULT ((0.00)) FOR [TaxAmt]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk] ADD  CONSTRAINT [ODDF_SalesOrderHeader_Freight]  DEFAULT ((0.00)) FOR [Freight]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]  WITH CHECK ADD  CONSTRAINT [ODCK_SalesOrderHeader_DueDate] CHECK  (([DueDate]>=[OrderDate]))
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk] CHECK CONSTRAINT [ODCK_SalesOrderHeader_DueDate]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]  WITH CHECK ADD  CONSTRAINT [ODCK_SalesOrderHeader_Freight] CHECK  (([Freight]>=(0.00)))
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk] CHECK CONSTRAINT [ODCK_SalesOrderHeader_Freight]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]  WITH CHECK ADD  CONSTRAINT [ODCK_SalesOrderHeader_ShipDate] CHECK  (([ShipDate]>=[OrderDate] OR [ShipDate] IS NULL))
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk] CHECK CONSTRAINT [ODCK_SalesOrderHeader_ShipDate]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]  WITH CHECK ADD  CONSTRAINT [ODCK_SalesOrderHeader_Status] CHECK  (([Status]>=(0) AND [Status]<=(8)))
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk] CHECK CONSTRAINT [ODCK_SalesOrderHeader_Status]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]  WITH CHECK ADD  CONSTRAINT [ODCK_SalesOrderHeader_SubTotal] CHECK  (([SubTotal]>=(0.00)))
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk] CHECK CONSTRAINT [ODCK_SalesOrderHeader_SubTotal]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]  WITH CHECK ADD  CONSTRAINT [ODCK_SalesOrderHeader_TaxAmt] CHECK  (([TaxAmt]>=(0.00)))
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk] CHECK CONSTRAINT [ODCK_SalesOrderHeader_TaxAmt]
GO
