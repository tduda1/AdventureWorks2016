USE [AdventureWorks2016CTP3]
GO
/****** Object:  Table [Sales].[SalesOrderDetail_ondisk]    Script Date: 12/26/2017 2:06:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[SalesOrderDetail_ondisk](
	[SalesOrderID] [int] NOT NULL,
	[SalesOrderDetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[CarrierTrackingNumber] [nvarchar](25) NULL,
	[OrderQty] [smallint] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SpecialOfferID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[UnitPriceDiscount] [money] NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [ODPK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID] PRIMARY KEY CLUSTERED 
(
	[SalesOrderID] ASC,
	[SalesOrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesOrderDetail_ondisk] ADD  CONSTRAINT [ODDF_SalesOrderDetail_UnitPriceDiscount]  DEFAULT ((0.0)) FOR [UnitPriceDiscount]
GO
ALTER TABLE [Sales].[SalesOrderDetail_ondisk]  WITH CHECK ADD  CONSTRAINT [ODFK_SalesOrderDetail_SalesOrderHeader_SalesOrderID] FOREIGN KEY([SalesOrderID])
REFERENCES [Sales].[SalesOrderHeader_ondisk] ([SalesOrderID])
GO
ALTER TABLE [Sales].[SalesOrderDetail_ondisk] CHECK CONSTRAINT [ODFK_SalesOrderDetail_SalesOrderHeader_SalesOrderID]
GO
ALTER TABLE [Sales].[SalesOrderDetail_ondisk]  WITH CHECK ADD  CONSTRAINT [ODFK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID] FOREIGN KEY([SpecialOfferID], [ProductID])
REFERENCES [Sales].[SpecialOfferProduct_ondisk] ([SpecialOfferID], [ProductID])
GO
ALTER TABLE [Sales].[SalesOrderDetail_ondisk] CHECK CONSTRAINT [ODFK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID]
GO
ALTER TABLE [Sales].[SalesOrderDetail_ondisk]  WITH CHECK ADD  CONSTRAINT [ODCK_SalesOrderDetail_OrderQty] CHECK  (([OrderQty]>(0)))
GO
ALTER TABLE [Sales].[SalesOrderDetail_ondisk] CHECK CONSTRAINT [ODCK_SalesOrderDetail_OrderQty]
GO
ALTER TABLE [Sales].[SalesOrderDetail_ondisk]  WITH CHECK ADD  CONSTRAINT [ODCK_SalesOrderDetail_UnitPrice] CHECK  (([UnitPrice]>=(0.00)))
GO
ALTER TABLE [Sales].[SalesOrderDetail_ondisk] CHECK CONSTRAINT [ODCK_SalesOrderDetail_UnitPrice]
GO
ALTER TABLE [Sales].[SalesOrderDetail_ondisk]  WITH CHECK ADD  CONSTRAINT [ODCK_SalesOrderDetail_UnitPriceDiscount] CHECK  (([UnitPriceDiscount]>=(0.00)))
GO
ALTER TABLE [Sales].[SalesOrderDetail_ondisk] CHECK CONSTRAINT [ODCK_SalesOrderDetail_UnitPriceDiscount]
GO
