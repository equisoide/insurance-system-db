CREATE TABLE [dbo].[Risk]
(
	[RiskId] INT NOT NULL,
	[Description] NVARCHAR(50) NOT NULL,
	[MaxCoverage] DECIMAL(18,2) NOT NULL,

	CONSTRAINT [PK_Risk] PRIMARY KEY CLUSTERED ([RiskId] ASC),
	CONSTRAINT [UK_Risk_Description] UNIQUE ([Description] ASC),
	CONSTRAINT [CK_Risk_MaxCoverage] CHECK  ([MaxCoverage] > 0 AND [MaxCoverage] <= 100)
);
