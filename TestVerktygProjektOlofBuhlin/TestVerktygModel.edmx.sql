
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/17/2016 11:54:07
-- Generated from EDMX file: c:\users\tidus_000\documents\visual studio 2015\Projects\TestVerktygProjektOlofBuhlin\TestVerktygProjektOlofBuhlin\TestVerktygModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [TestVerktygDb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Students'
CREATE TABLE [dbo].[Students] (
    [StudentId] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [AdminAdminId] int  NULL
);
GO

-- Creating table 'QuizSet'
CREATE TABLE [dbo].[QuizSet] (
    [QuizId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Grade] nvarchar(max)  NOT NULL,
    [StudentStudentId] int  NOT NULL,
    [TeacherTeacherId] int  NOT NULL,
    [Admin_AdminId] int  NOT NULL
);
GO

-- Creating table 'Admins'
CREATE TABLE [dbo].[Admins] (
    [AdminId] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Teacher_TeacherId] int  NOT NULL
);
GO

-- Creating table 'Teachers'
CREATE TABLE [dbo].[Teachers] (
    [TeacherId] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [StudentId] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [PK_Students]
    PRIMARY KEY CLUSTERED ([StudentId] ASC);
GO

-- Creating primary key on [QuizId] in table 'QuizSet'
ALTER TABLE [dbo].[QuizSet]
ADD CONSTRAINT [PK_QuizSet]
    PRIMARY KEY CLUSTERED ([QuizId] ASC);
GO

-- Creating primary key on [AdminId] in table 'Admins'
ALTER TABLE [dbo].[Admins]
ADD CONSTRAINT [PK_Admins]
    PRIMARY KEY CLUSTERED ([AdminId] ASC);
GO

-- Creating primary key on [TeacherId] in table 'Teachers'
ALTER TABLE [dbo].[Teachers]
ADD CONSTRAINT [PK_Teachers]
    PRIMARY KEY CLUSTERED ([TeacherId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [StudentStudentId] in table 'QuizSet'
ALTER TABLE [dbo].[QuizSet]
ADD CONSTRAINT [FK_StudentQuiz]
    FOREIGN KEY ([StudentStudentId])
    REFERENCES [dbo].[Students]
        ([StudentId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentQuiz'
CREATE INDEX [IX_FK_StudentQuiz]
ON [dbo].[QuizSet]
    ([StudentStudentId]);
GO

-- Creating foreign key on [Admin_AdminId] in table 'QuizSet'
ALTER TABLE [dbo].[QuizSet]
ADD CONSTRAINT [FK_AdminQuiz]
    FOREIGN KEY ([Admin_AdminId])
    REFERENCES [dbo].[Admins]
        ([AdminId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AdminQuiz'
CREATE INDEX [IX_FK_AdminQuiz]
ON [dbo].[QuizSet]
    ([Admin_AdminId]);
GO

-- Creating foreign key on [TeacherTeacherId] in table 'QuizSet'
ALTER TABLE [dbo].[QuizSet]
ADD CONSTRAINT [FK_TeacherQuiz]
    FOREIGN KEY ([TeacherTeacherId])
    REFERENCES [dbo].[Teachers]
        ([TeacherId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TeacherQuiz'
CREATE INDEX [IX_FK_TeacherQuiz]
ON [dbo].[QuizSet]
    ([TeacherTeacherId]);
GO

-- Creating foreign key on [Teacher_TeacherId] in table 'Admins'
ALTER TABLE [dbo].[Admins]
ADD CONSTRAINT [FK_AdminTeacher]
    FOREIGN KEY ([Teacher_TeacherId])
    REFERENCES [dbo].[Teachers]
        ([TeacherId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AdminTeacher'
CREATE INDEX [IX_FK_AdminTeacher]
ON [dbo].[Admins]
    ([Teacher_TeacherId]);
GO

-- Creating foreign key on [AdminAdminId] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [FK_AdminStudent]
    FOREIGN KEY ([AdminAdminId])
    REFERENCES [dbo].[Admins]
        ([AdminId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AdminStudent'
CREATE INDEX [IX_FK_AdminStudent]
ON [dbo].[Students]
    ([AdminAdminId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------