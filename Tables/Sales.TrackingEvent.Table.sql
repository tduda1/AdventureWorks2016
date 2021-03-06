USE [AdventureWorks2016CTP3]
GO
/****** Object:  Table [Sales].[TrackingEvent]    Script Date: 12/26/2017 2:06:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[TrackingEvent](
	[TrackingEventID] [int] IDENTITY(1,1) NOT NULL,
	[EventName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_TrackingEvent_TrackingEventID] PRIMARY KEY CLUSTERED 
(
	[TrackingEventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'TrackingEvent', @level2type=N'COLUMN',@level2name=N'TrackingEventID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tracking event name.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'TrackingEvent', @level2type=N'COLUMN',@level2name=N'EventName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'TrackingEvent', @level2type=N'CONSTRAINT',@level2name=N'PK_TrackingEvent_TrackingEventID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tracking event lookup table.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'TrackingEvent'
GO
