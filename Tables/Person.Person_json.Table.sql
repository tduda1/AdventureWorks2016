USE [AdventureWorks2016CTP3]
GO
/****** Object:  Table [Person].[Person_json]    Script Date: 12/26/2017 2:06:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[Person_json](
	[PersonID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PersonType] [nchar](2) NOT NULL,
	[NameStyle] [dbo].[NameStyle] NOT NULL,
	[Title] [nvarchar](8) NULL,
	[FirstName] [dbo].[Name] NOT NULL,
	[MiddleName] [dbo].[Name] NULL,
	[LastName] [dbo].[Name] NOT NULL,
	[Suffix] [nvarchar](10) NULL,
	[EmailPromotion] [int] NOT NULL,
	[AdditionalContactInfo] [nvarchar](max) NULL,
	[Demographics] [nvarchar](max) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Person_json_PersonID] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Person].[Person_json] ADD  DEFAULT ((0)) FOR [NameStyle]
GO
ALTER TABLE [Person].[Person_json] ADD  DEFAULT ((0)) FOR [EmailPromotion]
GO
ALTER TABLE [Person].[Person_json] ADD  DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [Person].[Person_json] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Person].[Person_json]  WITH CHECK ADD  CONSTRAINT [AdditionalContactInfo must be formatted as JSON] CHECK  ((isjson([AdditionalContactInfo])>(0)))
GO
ALTER TABLE [Person].[Person_json] CHECK CONSTRAINT [AdditionalContactInfo must be formatted as JSON]
GO
ALTER TABLE [Person].[Person_json]  WITH CHECK ADD  CONSTRAINT [Demographics must be formatted as JSON] CHECK  ((isjson([Demographics])>(0)))
GO
ALTER TABLE [Person].[Person_json] CHECK CONSTRAINT [Demographics must be formatted as JSON]
GO
