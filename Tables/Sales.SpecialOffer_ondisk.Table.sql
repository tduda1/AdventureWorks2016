USE [AdventureWorks2016CTP3]
GO
/****** Object:  Table [Sales].[SpecialOffer_ondisk]    Script Date: 12/26/2017 2:06:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[SpecialOffer_ondisk](
	[SpecialOfferID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[DiscountPct] [smallmoney] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[MinQty] [int] NOT NULL,
	[MaxQty] [int] NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [ODPK_SpecialOffer_SpecialOfferID] PRIMARY KEY CLUSTERED 
(
	[SpecialOfferID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SpecialOffer_ondisk] ADD  CONSTRAINT [ODDF_SpecialOffer_DiscountPct]  DEFAULT ((0.00)) FOR [DiscountPct]
GO
ALTER TABLE [Sales].[SpecialOffer_ondisk] ADD  CONSTRAINT [ODDF_SpecialOffer_MinQty]  DEFAULT ((0)) FOR [MinQty]
GO
ALTER TABLE [Sales].[SpecialOffer_ondisk] ADD  CONSTRAINT [ODDF_SpecialOffer_ModifiedDate]  DEFAULT (sysdatetime()) FOR [ModifiedDate]
GO
ALTER TABLE [Sales].[SpecialOffer_ondisk]  WITH CHECK ADD  CONSTRAINT [ODCK_SpecialOffer_DiscountPct] CHECK  (([DiscountPct]>=(0.00)))
GO
ALTER TABLE [Sales].[SpecialOffer_ondisk] CHECK CONSTRAINT [ODCK_SpecialOffer_DiscountPct]
GO
ALTER TABLE [Sales].[SpecialOffer_ondisk]  WITH CHECK ADD  CONSTRAINT [ODCK_SpecialOffer_EndDate] CHECK  (([EndDate]>=[StartDate]))
GO
ALTER TABLE [Sales].[SpecialOffer_ondisk] CHECK CONSTRAINT [ODCK_SpecialOffer_EndDate]
GO
ALTER TABLE [Sales].[SpecialOffer_ondisk]  WITH CHECK ADD  CONSTRAINT [ODCK_SpecialOffer_MaxQty] CHECK  (([MaxQty]>=(0)))
GO
ALTER TABLE [Sales].[SpecialOffer_ondisk] CHECK CONSTRAINT [ODCK_SpecialOffer_MaxQty]
GO
ALTER TABLE [Sales].[SpecialOffer_ondisk]  WITH CHECK ADD  CONSTRAINT [ODCK_SpecialOffer_MinQty] CHECK  (([MinQty]>=(0)))
GO
ALTER TABLE [Sales].[SpecialOffer_ondisk] CHECK CONSTRAINT [ODCK_SpecialOffer_MinQty]
GO
