CREATE TABLE [dbo].[PolicyCoverage]
(
	[PolicyCoverageId] INT IDENTITY(1,1) NOT NULL,
    [PolicyId] INT NOT NULL,
    [CoverageId] INT NOT NULL,
    [Percentage] DECIMAL(18,4) NOT NULL,

	CONSTRAINT [PK_PolicyCoverage] PRIMARY KEY CLUSTERED ([PolicyCoverageId] ASC),
    CONSTRAINT [UK_PolicyCoverage] UNIQUE NONCLUSTERED ([PolicyId] ASC, [CoverageId] ASC)
);
