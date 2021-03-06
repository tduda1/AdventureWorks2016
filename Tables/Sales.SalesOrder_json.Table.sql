USE [AdventureWorks2016CTP3]
GO
/****** Object:  Table [Sales].[SalesOrder_json]    Script Date: 12/26/2017 2:06:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[SalesOrder_json](
	[SalesOrderID] [int] NOT NULL,
	[RevisionNumber] [tinyint] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[ShipDate] [datetime] NULL,
	[Status] [tinyint] NOT NULL,
	[OnlineOrderFlag] [dbo].[Flag] NOT NULL,
	[SalesOrderNumber]  AS (isnull(N'SO'+CONVERT([nvarchar](23),[SalesOrderID]),N'*** ERROR ***')),
	[PurchaseOrderNumber] [dbo].[OrderNumber] NULL,
	[AccountNumber] [dbo].[AccountNumber] NULL,
	[CustomerID] [int] NOT NULL,
	[SalesPersonID] [int] NULL,
	[TerritoryID] [int] NULL,
	[BillToAddressID] [int] NULL,
	[ShipToAddressID] [int] NULL,
	[ShipMethodID] [int] NULL,
	[CreditCardID] [int] NULL,
	[CreditCardApprovalCode] [varchar](15) NULL,
	[CurrencyRateID] [int] NULL,
	[SubTotal] [money] NOT NULL,
	[TaxAmt] [money] NOT NULL,
	[Freight] [money] NOT NULL,
	[TotalDue]  AS (isnull(([SubTotal]+[TaxAmt])+[Freight],(0))),
	[Comment] [nvarchar](128) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SalesOrder__json_SalesOrderID] PRIMARY KEY CLUSTERED 
(
	[SalesOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesOrder_json] ADD  CONSTRAINT [DF_SalesOrder_RevisionNumber]  DEFAULT ((0)) FOR [RevisionNumber]
GO
ALTER TABLE [Sales].[SalesOrder_json] ADD  CONSTRAINT [DF_SalesOrder_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [Sales].[SalesOrder_json] ADD  CONSTRAINT [DF_SalesOrder_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [Sales].[SalesOrder_json] ADD  CONSTRAINT [DF_SalesOrder_OnlineOrderFlag]  DEFAULT ((1)) FOR [OnlineOrderFlag]
GO
ALTER TABLE [Sales].[SalesOrder_json] ADD  CONSTRAINT [DF_SalesOrder_SubTotal]  DEFAULT ((0.00)) FOR [SubTotal]
GO
ALTER TABLE [Sales].[SalesOrder_json] ADD  CONSTRAINT [DF_SalesOrder_TaxAmt]  DEFAULT ((0.00)) FOR [TaxAmt]
GO
ALTER TABLE [Sales].[SalesOrder_json] ADD  CONSTRAINT [DF_SalesOrder_Freight]  DEFAULT ((0.00)) FOR [Freight]
GO
ALTER TABLE [Sales].[SalesOrder_json] ADD  CONSTRAINT [DF_SalesOrder_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [Sales].[SalesOrder_json] ADD  CONSTRAINT [DF_SalesOrder_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
