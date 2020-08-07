CREATE TABLE [dbo].[Policy]
(
	[PolicyId] INT IDENTITY(1,1) NOT NULL,
    [ClientId] INT NOT NULL,
    [RiskId] INT NOT NULL,
    [StatusId] INT NOT NULL,
    [Name] NVARCHAR(50) NOT NULL,
    [Description] NVARCHAR(250) NOT NULL,
    [StartDate] DATETIME NOT NULL,
    [Periods] INT NOT NULL,
    [Price] DECIMAL(18,4) NOT NULL,

	CONSTRAINT [PK_Policy] PRIMARY KEY CLUSTERED ([PolicyId] ASC)
);
