USE [AdventureWorks2016CTP3]
GO
/****** Object:  Table [Sales].[SpecialOfferProduct_inmem]    Script Date: 12/26/2017 2:06:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[SpecialOfferProduct_inmem]
(
	[SpecialOfferID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,

 CONSTRAINT [IMPK_SpecialOfferProduct_SpecialOfferID_ProductID]  PRIMARY KEY NONCLUSTERED 
(
	[SpecialOfferID] ASC,
	[ProductID] ASC
),
INDEX [ix_ProductID] NONCLUSTERED 
(
	[ProductID] ASC
)
)WITH ( MEMORY_OPTIMIZED = ON , DURABILITY = SCHEMA_AND_DATA )
GO
ALTER TABLE [Sales].[SpecialOfferProduct_inmem] ADD  CONSTRAINT [IMDF_SpecialOfferProduct_ModifiedDate]  DEFAULT (sysdatetime()) FOR [ModifiedDate]
GO
ALTER TABLE [Sales].[SpecialOfferProduct_inmem]  WITH CHECK ADD  CONSTRAINT [IMFK_SpecialOfferProduct_Product_ProductID] FOREIGN KEY([ProductID])
REFERENCES [Production].[Product_inmem] ([ProductID])
GO
ALTER TABLE [Sales].[SpecialOfferProduct_inmem] CHECK CONSTRAINT [IMFK_SpecialOfferProduct_Product_ProductID]
GO
ALTER TABLE [Sales].[SpecialOfferProduct_inmem]  WITH CHECK ADD  CONSTRAINT [IMFK_SpecialOfferProduct_SpecialOffer_SpecialOfferID] FOREIGN KEY([SpecialOfferID])
REFERENCES [Sales].[SpecialOffer_inmem] ([SpecialOfferID])
GO
ALTER TABLE [Sales].[SpecialOfferProduct_inmem] CHECK CONSTRAINT [IMFK_SpecialOfferProduct_SpecialOffer_SpecialOfferID]
GO
