CREATE TABLE [dbo].[ClientPolicy]
(
	[ClientPolicyId] INT IDENTITY(1,1) NOT NULL,
	[ClientId] INT NOT NULL,
	[PolicyId] INT NOT NULL,
	[PolicyStatusId] INT NOT NULL,
	[StartDate] DATETIME NOT NULL,

	CONSTRAINT [PK_ClientPolicy] PRIMARY KEY CLUSTERED ([ClientPolicyId] ASC),
	CONSTRAINT [FK_ClientPolicy_ClientId] FOREIGN KEY([ClientId]) REFERENCES [dbo].[Client] ([ClientId]),
	CONSTRAINT [FK_ClientPolicy_PolicyId] FOREIGN KEY([PolicyId]) REFERENCES [dbo].[Policy] ([PolicyId]),
	CONSTRAINT [FK_ClientPolicy_PolicyStatusId] FOREIGN KEY([PolicyStatusId]) REFERENCES [dbo].[PolicyStatus] ([PolicyStatusId])
);
