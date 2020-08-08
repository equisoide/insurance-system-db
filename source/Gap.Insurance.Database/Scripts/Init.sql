/*
	Feeds the database with initial data.
*/
BEGIN TRY
    BEGIN TRAN
		-- Coverage
		INSERT INTO [dbo].[Coverage]([CoverageId], [Description]) VALUES (1, 'Earthquake');
		INSERT INTO [dbo].[Coverage]([CoverageId], [Description]) VALUES (2, 'Fire');
		INSERT INTO [dbo].[Coverage]([CoverageId], [Description]) VALUES (3, 'Lost');
		INSERT INTO [dbo].[Coverage]([CoverageId], [Description]) VALUES (4, 'Theft');

		-- Risk
		INSERT INTO [dbo].[Risk]([RiskId], [Description], [MaxCoverage]) VALUES (1, 'Low', 100);
		INSERT INTO [dbo].[Risk]([RiskId], [Description], [MaxCoverage]) VALUES (2, 'Medium', 100);
		INSERT INTO [dbo].[Risk]([RiskId], [Description], [MaxCoverage]) VALUES (3, 'Medium-High', 100);
		INSERT INTO [dbo].[Risk]([RiskId], [Description], [MaxCoverage]) VALUES (4, 'High', 50);

		-- PolicyStatus
		INSERT INTO [dbo].[PolicyStatus]([PolicyStatusId], [Description]) VALUES (1, 'Active');
		INSERT INTO [dbo].[PolicyStatus]([PolicyStatusId], [Description]) VALUES (2, 'Expired');
		INSERT INTO [dbo].[PolicyStatus]([PolicyStatusId], [Description]) VALUES (3, 'Cancelled');

		-- Policy
		INSERT INTO [dbo].[Policy]([RiskId], [Name], [Description], [Periods], [Price]) VALUES (1, 'All Low 12 Vip', 'All covered 100%, low risk, 1 year', 12, 700);
		INSERT INTO [dbo].[Policy]([RiskId], [Name], [Description], [Periods], [Price]) VALUES (1, 'All Low 6 Vip', 'All covered 100%, low risk, 6 months', 6, 300);
		INSERT INTO [dbo].[Policy]([RiskId], [Name], [Description], [Periods], [Price]) VALUES (4, 'All High 12 50%', 'All covered 50%, high risk, 1 year', 12, 1000);
		INSERT INTO [dbo].[Policy]([RiskId], [Name], [Description], [Periods], [Price]) VALUES (4, 'All High 6 40%', 'All covered 40%, high risk, 6 months', 6, 600);
		
		-- PolicyCoverage
		DECLARE @AllLow12Id INT; SELECT @AllLow12Id = [PolicyId] FROM [dbo].[Policy] WHERE [Name] = 'All Low 12 Vip';
		DECLARE @AllLow6Id INT; SELECT @AllLow6Id = [PolicyId] FROM [dbo].[Policy] WHERE [Name] = 'All Low 6 Vip';
		DECLARE @AllHigh12Id INT; SELECT @AllHigh12Id = [PolicyId] FROM [dbo].[Policy] WHERE [Name] = 'All High 12 50%';
		DECLARE @AllHigh6Id INT; SELECT @AllHigh6Id = [PolicyId] FROM [dbo].[Policy] WHERE [Name] = 'All High 6 40%';

		INSERT INTO [dbo].[PolicyCoverage]([PolicyId], [CoverageId], [Percentage]) VALUES (@AllLow12Id, 1, 100);
		INSERT INTO [dbo].[PolicyCoverage]([PolicyId], [CoverageId], [Percentage]) VALUES (@AllLow12Id, 2, 100);
		INSERT INTO [dbo].[PolicyCoverage]([PolicyId], [CoverageId], [Percentage]) VALUES (@AllLow12Id, 3, 100);
		INSERT INTO [dbo].[PolicyCoverage]([PolicyId], [CoverageId], [Percentage]) VALUES (@AllLow12Id, 4, 100);

		INSERT INTO [dbo].[PolicyCoverage]([PolicyId], [CoverageId], [Percentage]) VALUES (@AllLow6Id, 1, 100);
		INSERT INTO [dbo].[PolicyCoverage]([PolicyId], [CoverageId], [Percentage]) VALUES (@AllLow6Id, 2, 100);
		INSERT INTO [dbo].[PolicyCoverage]([PolicyId], [CoverageId], [Percentage]) VALUES (@AllLow6Id, 3, 100);
		INSERT INTO [dbo].[PolicyCoverage]([PolicyId], [CoverageId], [Percentage]) VALUES (@AllLow6Id, 4, 100);

		INSERT INTO [dbo].[PolicyCoverage]([PolicyId], [CoverageId], [Percentage]) VALUES (@AllHigh12Id, 1, 50);
		INSERT INTO [dbo].[PolicyCoverage]([PolicyId], [CoverageId], [Percentage]) VALUES (@AllHigh12Id, 2, 50);
		INSERT INTO [dbo].[PolicyCoverage]([PolicyId], [CoverageId], [Percentage]) VALUES (@AllHigh12Id, 3, 50);
		INSERT INTO [dbo].[PolicyCoverage]([PolicyId], [CoverageId], [Percentage]) VALUES (@AllHigh12Id, 4, 50);

		INSERT INTO [dbo].[PolicyCoverage]([PolicyId], [CoverageId], [Percentage]) VALUES (@AllHigh6Id, 1, 40);
		INSERT INTO [dbo].[PolicyCoverage]([PolicyId], [CoverageId], [Percentage]) VALUES (@AllHigh6Id, 2, 40);
		INSERT INTO [dbo].[PolicyCoverage]([PolicyId], [CoverageId], [Percentage]) VALUES (@AllHigh6Id, 3, 40);
		INSERT INTO [dbo].[PolicyCoverage]([PolicyId], [CoverageId], [Percentage]) VALUES (@AllHigh6Id, 4, 40);

		-- Client
		INSERT INTO [dbo].[Client]([Document], [Name], [Email], [CellPhone], [BirthDate]) VALUES ('00001', 'Eric Cartman', 'cartman@southpark.com', '300-000-0001', '1992-01-01');
		INSERT INTO [dbo].[Client]([Document], [Name], [Email], [CellPhone], [BirthDate]) VALUES ('00002', 'Randy Marsh', 'randy@southpark.com', '300-000-0002', '1969-03-01');
		INSERT INTO [dbo].[Client]([Document], [Name], [Email], [CellPhone], [BirthDate]) VALUES ('00003', 'Butters Stotch', 'butters@southpark.com', '300-000-0003', '1990-01-01');
		INSERT INTO [dbo].[Client]([Document], [Name], [Email], [CellPhone], [BirthDate]) VALUES ('00004', 'Mr. Garrison', 'garrison@southpark.com', '300-000-0004', '1970-01-01');

		-- Client Policy
		DECLARE @CartamnId INT;
		SELECT @CartamnId = [ClientId] FROM [dbo].[Client] WHERE [Document] = '00001';
		DECLARE @RandyId INT;
		SELECT @RandyId = [ClientId] FROM [dbo].[Client] WHERE [Document] = '00002';

		INSERT INTO [dbo].[ClientPolicy]([ClientId], [PolicyId], [PolicyStatusId], [StartDate]) VALUES (@CartamnId, @AllLow12Id, 2, '2019-01-01');
		INSERT INTO [dbo].[ClientPolicy]([ClientId], [PolicyId], [PolicyStatusId], [StartDate]) VALUES (@CartamnId, @AllLow12Id, 1, '2020-01-01');
		INSERT INTO [dbo].[ClientPolicy]([ClientId], [PolicyId], [PolicyStatusId], [StartDate]) VALUES (@RandyId, @AllHigh6Id, 1, '2020-06-01');

    COMMIT TRAN
END TRY
BEGIN CATCH
    IF(@@TRANCOUNT > 0)
        ROLLBACK TRAN;
    THROW;
END CATCH