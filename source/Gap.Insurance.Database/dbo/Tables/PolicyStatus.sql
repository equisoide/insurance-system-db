﻿CREATE TABLE [dbo].[PolicyStatus]
(
	[PolicyStatusId] INT NOT NULL,
	[Description] NVARCHAR(50) NOT NULL,
	CONSTRAINT [PK_PolicyStatus] PRIMARY KEY CLUSTERED ([PolicyStatusId] ASC)
);
