USE [ASSIGNMENT]
GO

/****** Object:  Table [dbo].[FRESHER]    Script Date: 3/15/2017 10:22:13 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CUSTOMER](
	[CUSTOMER_ID] [int] IDENTITY(1,1) NOT NULL,
	[FIRST_NAME] [nvarchar](500) NOT NULL,
	[LAST_NAME] [nvarchar](500) NOT NULL,
	[EMAIl] [nvarchar](500) NULL,
	[AGE] [int] NULL,
	[ADDRESS] [nvarchar](500) NULL,
 CONSTRAINT [PK_CUSTOMER] PRIMARY KEY CLUSTERED 
(
	[CUSTOMER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
