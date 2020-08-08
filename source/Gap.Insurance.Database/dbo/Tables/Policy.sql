CREATE TABLE [dbo].[Policy]
(
	[PolicyId] INT IDENTITY(1,1) NOT NULL,
	[RiskId] INT NOT NULL,
	[Name] NVARCHAR(50) NOT NULL,
	[Description] NVARCHAR(250) NOT NULL,
	[Periods] INT NOT NULL,
	[Price] DECIMAL(18,2) NOT NULL,

	CONSTRAINT [PK_Policy] PRIMARY KEY CLUSTERED ([PolicyId] ASC),
	CONSTRAINT [FK_Policy_Risk] FOREIGN KEY([RiskId]) REFERENCES [dbo].[Risk] ([RiskId]),
	CONSTRAINT [UK_Policy_Name] UNIQUE ([Name] ASC),
	CONSTRAINT [CK_Policy_Periods] CHECK ([Periods] > 0)
);
