USE [AdventureWorks2016CTP3]
GO
/****** Object:  Table [Sales].[SpecialOfferProduct_ondisk]    Script Date: 12/26/2017 2:06:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[SpecialOfferProduct_ondisk](
	[SpecialOfferID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [ODPK_SpecialOfferProduct_SpecialOfferID_ProductID] PRIMARY KEY NONCLUSTERED 
(
	[SpecialOfferID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SpecialOfferProduct_ondisk] ADD  CONSTRAINT [ODDF_SpecialOfferProduct_ModifiedDate]  DEFAULT (sysdatetime()) FOR [ModifiedDate]
GO
ALTER TABLE [Sales].[SpecialOfferProduct_ondisk]  WITH CHECK ADD  CONSTRAINT [ODFK_SpecialOfferProduct_Product_ProductID] FOREIGN KEY([ProductID])
REFERENCES [Production].[Product_ondisk] ([ProductID])
GO
ALTER TABLE [Sales].[SpecialOfferProduct_ondisk] CHECK CONSTRAINT [ODFK_SpecialOfferProduct_Product_ProductID]
GO
ALTER TABLE [Sales].[SpecialOfferProduct_ondisk]  WITH CHECK ADD  CONSTRAINT [ODFK_SpecialOfferProduct_SpecialOffer_SpecialOfferID] FOREIGN KEY([SpecialOfferID])
REFERENCES [Sales].[SpecialOffer_ondisk] ([SpecialOfferID])
GO
ALTER TABLE [Sales].[SpecialOfferProduct_ondisk] CHECK CONSTRAINT [ODFK_SpecialOfferProduct_SpecialOffer_SpecialOfferID]
GO
