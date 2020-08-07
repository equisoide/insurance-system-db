CREATE TABLE [dbo].[PolicyCoverage]
(
	[PolicyCoverageId] INT IDENTITY(1,1) NOT NULL,
	[PolicyId] INT NOT NULL,
	[CoverageId] INT NOT NULL,
	[Percentage] DECIMAL(18,2) NOT NULL,

	CONSTRAINT [PK_PolicyCoverage] PRIMARY KEY CLUSTERED ([PolicyCoverageId] ASC),
	CONSTRAINT [FK_PolicyCoverage_Coverage] FOREIGN KEY([CoverageId]) REFERENCES [dbo].[Coverage] ([CoverageId]),
	CONSTRAINT [FK_PolicyCoverage_Policy] FOREIGN KEY([PolicyId]) REFERENCES [dbo].[Policy] ([PolicyId]),
	CONSTRAINT [UK_PolicyCoverage] UNIQUE ([PolicyId] ASC, [CoverageId] ASC),
	CONSTRAINT [CK_PolicyCoverage_Percentage] CHECK  ([Percentage] > 0 AND [Percentage] <= 100)
);
