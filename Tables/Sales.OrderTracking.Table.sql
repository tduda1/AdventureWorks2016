USE [AdventureWorks2016CTP3]
GO
/****** Object:  Table [Sales].[OrderTracking]    Script Date: 12/26/2017 2:06:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[OrderTracking](
	[OrderTrackingID] [int] IDENTITY(1,1) NOT NULL,
	[SalesOrderID] [int] NOT NULL,
	[CarrierTrackingNumber] [nvarchar](25) NULL,
	[TrackingEventID] [int] NOT NULL,
	[EventDetails] [nvarchar](2000) NOT NULL,
	[EventDateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrderTracking] PRIMARY KEY CLUSTERED 
(
	[OrderTrackingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderTracking', @level2type=N'COLUMN',@level2name=N'OrderTrackingID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales order identification number.  Foreign key to SalesOrderHeader.SalesOrderID.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderTracking', @level2type=N'COLUMN',@level2name=N'SalesOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Shipment tracking number supplied by the shipper.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderTracking', @level2type=N'COLUMN',@level2name=N'CarrierTrackingNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tracking delivery event for Order shipped to customer. Foreign key to TrackingEvent.TrackingEventID.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderTracking', @level2type=N'COLUMN',@level2name=N'TrackingEventID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Details for a delivery tracking event.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderTracking', @level2type=N'COLUMN',@level2name=N'EventDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date and time that a tracking event has occurred.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderTracking', @level2type=N'COLUMN',@level2name=N'EventDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderTracking', @level2type=N'CONSTRAINT',@level2name=N'PK_OrderTracking'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Individual tracking events associated with a specific sales order.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderTracking'
GO
