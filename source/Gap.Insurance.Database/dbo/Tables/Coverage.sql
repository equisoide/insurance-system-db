﻿CREATE TABLE [dbo].[Coverage]
(
	[CoverageId] INT NOT NULL,
	[Description] NVARCHAR(50) NOT NULL,
	CONSTRAINT [PK_Coverage] PRIMARY KEY CLUSTERED ([CoverageId] ASC)
);
