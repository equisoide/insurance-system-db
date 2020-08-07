CREATE TABLE [dbo].[Policy]
(
	[PolicyId] INT IDENTITY(1,1) NOT NULL,
    [ClientId] INT NOT NULL,
    [RiskId] INT NOT NULL,
    [PolicyStatusId] INT NOT NULL,
    [Name] NVARCHAR(50) NOT NULL,
    [Description] NVARCHAR(250) NOT NULL,
    [StartDate] DATETIME NOT NULL,
    [Periods] INT NOT NULL,
    [Price] DECIMAL(18,4) NOT NULL,

	CONSTRAINT [PK_Policy] PRIMARY KEY CLUSTERED ([PolicyId] ASC),
    CONSTRAINT [FK_Policy_Client] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Client] ([ClientId]),
    CONSTRAINT [FK_Policy_PolicyStatus] FOREIGN KEY([PolicyStatusId]) REFERENCES [dbo].[PolicyStatus] ([PolicyStatusId]),
    CONSTRAINT [FK_Policy_Risk] FOREIGN KEY([RiskId]) REFERENCES [dbo].[Risk] ([RiskId]),
    CONSTRAINT [CK_Policy_Periods] CHECK ([Periods] > (0))
);
