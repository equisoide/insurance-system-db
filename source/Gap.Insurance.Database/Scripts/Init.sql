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
		INSERT INTO [dbo].[Risk]([RisId], [Description]) VALUES (1, 'Low');
		INSERT INTO [dbo].[Risk]([RisId], [Description]) VALUES (2, 'Medium');
		INSERT INTO [dbo].[Risk]([RisId], [Description]) VALUES (3, 'Medium-High');
		INSERT INTO [dbo].[Risk]([RisId], [Description]) VALUES (4, 'High');

		-- PolicyStatus
		INSERT INTO [dbo].[PolicyStatus]([PolicyStatusId], [Description]) VALUES (1, 'Active');
		INSERT INTO [dbo].[PolicyStatus]([PolicyStatusId], [Description]) VALUES (2, 'Cancelled');

		-- Client
		INSERT INTO [dbo].[Client]([Document], [Name], [Email], [CellPhone], [BirthDate]) VALUES ('00001', 'Eric Cartman', 'cartman@southpark.com', '300-000-0001', '1992-01-01');
		INSERT INTO [dbo].[Client]([Document], [Name], [Email], [CellPhone], [BirthDate]) VALUES ('00002', 'Randy Marsh', 'randy@southpark.com', '300-000-0002', '1969-03-01');
		INSERT INTO [dbo].[Client]([Document], [Name], [Email], [CellPhone], [BirthDate]) VALUES ('00003', 'Butters Stotch', 'butters@southpark.com', '300-000-0003', '1990-01-01');
		INSERT INTO [dbo].[Client]([Document], [Name], [Email], [CellPhone], [BirthDate]) VALUES ('00004', 'Mr. Garrison', 'garrison@southpark.com', '300-000-0004', '1970-01-01');

		DECLARE @CartamnId INT;
		SELECT @CartamnId = [ClientId] FROM [dbo].[Client] WHERE [Document] = '00001';
		DECLARE @RandyId INT;
		SELECT @RandyId = [ClientId] FROM [dbo].[Client] WHERE [Document] = '00002';

		-- Policy
		INSERT INTO [dbo].[Policy]([ClientId], [RiskId], [PolicyStatusId], [Name], [Description], [StartDate], [Periods], [Price]) VALUES (@CartamnId, 2, 1, 'The coon', 'All risk policy for his superhero character', '2020-08-07', 12, 2500);
		INSERT INTO [dbo].[Policy]([ClientId], [RiskId], [PolicyStatusId], [Name], [Description], [StartDate], [Periods], [Price]) VALUES (@RandyId, 4, 2, 'Policeman', 'All risk policy for his policeman character', '2020-08-07', 6, 5000);
    
		DECLARE @CartamnPolicyId INT;
		SELECT @CartamnPolicyId = [PolicyId] FROM [dbo].[Policy] WHERE [ClientId] = @CartamnId;
		DECLARE @RandyPolicyId INT;
		SELECT @RandyPolicyId = [PolicyId] FROM [dbo].[Policy] WHERE [ClientId] = @RandyId;

		-- PolicyCoverage
		INSERT INTO [dbo].[PolicyCoverage]([PolicyId], [CoverageId], [Percentage]) VALUES (@CartamnPolicyId, 2, 90);
		INSERT INTO [dbo].[PolicyCoverage]([PolicyId], [CoverageId], [Percentage]) VALUES (@CartamnPolicyId, 3, 70);
		INSERT INTO [dbo].[PolicyCoverage]([PolicyId], [CoverageId], [Percentage]) VALUES (@CartamnPolicyId, 4, 85);

		INSERT INTO [dbo].[PolicyCoverage]([PolicyId], [CoverageId], [Percentage]) VALUES (@RandyPolicyId, 1, 40);
		INSERT INTO [dbo].[PolicyCoverage]([PolicyId], [CoverageId], [Percentage]) VALUES (@RandyPolicyId, 2, 35);

    COMMIT TRAN
END TRY
BEGIN CATCH
    IF(@@TRANCOUNT > 0)
        ROLLBACK TRAN;
    THROW;
END CATCH