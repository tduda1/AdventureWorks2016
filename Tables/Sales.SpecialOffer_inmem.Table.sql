USE [AdventureWorks2016CTP3]
GO
/****** Object:  Table [Sales].[SpecialOffer_inmem]    Script Date: 12/26/2017 2:06:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[SpecialOffer_inmem]
(
	[SpecialOfferID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DiscountPct] [smallmoney] NOT NULL,
	[Type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Category] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[MinQty] [int] NOT NULL,
	[MaxQty] [int] NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,

 CONSTRAINT [IMPK_SpecialOffer_SpecialOfferID]  PRIMARY KEY NONCLUSTERED HASH 
(
	[SpecialOfferID]
)WITH ( BUCKET_COUNT = 1048576)
)WITH ( MEMORY_OPTIMIZED = ON , DURABILITY = SCHEMA_AND_DATA )
GO
ALTER TABLE [Sales].[SpecialOffer_inmem] ADD  CONSTRAINT [IMDF_SpecialOffer_DiscountPct]  DEFAULT ((0.00)) FOR [DiscountPct]
GO
ALTER TABLE [Sales].[SpecialOffer_inmem] ADD  CONSTRAINT [IMDF_SpecialOffer_MinQty]  DEFAULT ((0)) FOR [MinQty]
GO
ALTER TABLE [Sales].[SpecialOffer_inmem] ADD  CONSTRAINT [IMDF_SpecialOffer_ModifiedDate]  DEFAULT (sysdatetime()) FOR [ModifiedDate]
GO
ALTER TABLE [Sales].[SpecialOffer_inmem]  WITH CHECK ADD  CONSTRAINT [IMCK_SpecialOffer_DiscountPct] CHECK  (([DiscountPct]>=(0.00)))
GO
ALTER TABLE [Sales].[SpecialOffer_inmem] CHECK CONSTRAINT [IMCK_SpecialOffer_DiscountPct]
GO
ALTER TABLE [Sales].[SpecialOffer_inmem]  WITH CHECK ADD  CONSTRAINT [IMCK_SpecialOffer_EndDate] CHECK  (([EndDate]>=[StartDate]))
GO
ALTER TABLE [Sales].[SpecialOffer_inmem] CHECK CONSTRAINT [IMCK_SpecialOffer_EndDate]
GO
ALTER TABLE [Sales].[SpecialOffer_inmem]  WITH CHECK ADD  CONSTRAINT [IMCK_SpecialOffer_MaxQty] CHECK  (([MaxQty]>=(0)))
GO
ALTER TABLE [Sales].[SpecialOffer_inmem] CHECK CONSTRAINT [IMCK_SpecialOffer_MaxQty]
GO
ALTER TABLE [Sales].[SpecialOffer_inmem]  WITH CHECK ADD  CONSTRAINT [IMCK_SpecialOffer_MinQty] CHECK  (([MinQty]>=(0)))
GO
ALTER TABLE [Sales].[SpecialOffer_inmem] CHECK CONSTRAINT [IMCK_SpecialOffer_MinQty]
GO
