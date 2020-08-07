CREATE TABLE [dbo].[Client]
(
	[ClientId] INT IDENTITY(1,1) NOT NULL,
	[Document] NVARCHAR(50) NOT NULL,
    [Name] NVARCHAR(50) NOT NULL,
    [Email] NVARCHAR(250) NOT NULL,
    [CellPhone] NVARCHAR(250) NOT NULL,
    [BirthDate] DATETIME NOT NULL,

	CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED ([ClientId] ASC),
    CONSTRAINT [UK_Client_Document] UNIQUE ([Document] ASC)
);
