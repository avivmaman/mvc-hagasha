﻿/*
Deployment script for MyAppDb

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "MyAppDb"
:setvar DefaultFilePrefix "MyAppDb"
:setvar DefaultDataPath "C:\Users\mmnav\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB"
:setvar DefaultLogPath "C:\Users\mmnav\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Rename refactoring operation with key 14d12c55-f98f-4b80-a05d-70ef4a49796e is skipped, element [dbo].[Courses].[Students] (SqlSimpleColumn) will not be renamed to teacher';


GO
PRINT N'Creating [dbo].[Courses]...';


GO
CREATE TABLE [dbo].[Courses] (
    [Id]        INT           NOT NULL,
    [teacher]   INT           NOT NULL,
    [startTime] INT           NOT NULL,
    [duration]  INT           NOT NULL,
    [name]      NVARCHAR (50) NOT NULL,
    [day]       INT           NOT NULL,
    [aDate]     DATETIME      NOT NULL,
    [bDate]     DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Grades]...';


GO
CREATE TABLE [dbo].[Grades] (
    [Id]        INT NOT NULL,
    [CourseID]  INT NOT NULL,
    [StudentID] INT NOT NULL,
    [aGrade]    INT NOT NULL,
    [bGrade]    INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[scLink]...';


GO
CREATE TABLE [dbo].[scLink] (
    [Id]        INT NOT NULL,
    [courseID]  INT NOT NULL,
    [studetnID] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
-- Refactoring step to update target server with deployed transaction logs
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '14d12c55-f98f-4b80-a05d-70ef4a49796e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('14d12c55-f98f-4b80-a05d-70ef4a49796e')

GO

GO
PRINT N'Update complete.';


GO