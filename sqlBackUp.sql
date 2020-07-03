USE [master]
GO
/****** Object:  Database [LaboratorioMVC_SPRING_BOOT_A95777_2020]    Script Date: 2/7/2020 11:45:33 ******/
CREATE DATABASE [LaboratorioMVC_SPRING_BOOT_A95777_2020]
GO
CREATE TABLE [dbo].[Inquiry](
	[Inquiry_id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Type] [varchar](32) NULL CHECK (Type='Private' OR Type='Public'),
	[Content] [varchar](max) NULL,
	[CreationUsersId] [int] NULL,
	[TeacherId] [int] NULL
)
GO
CREATE TABLE [dbo].[Inquiryresponse](
	[InquiryResponse_id] [int] IDENTITY(1,1) PRIMARY KEY,
	[Content] [varchar](max) NULL,
	[InquiryId] [int] NULL,
)
GO
CREATE TABLE [dbo].[Role](
	[Role_id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](32) check (Name='Admin' or Name='Teacher' or Name = 'Student')
)
GO
CREATE TABLE [dbo].[Users](
	[Users_id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] [varchar](max) NULL,
	[Lastname] [varchar](max) NULL,
	[Email] [varchar](256) NULL,
	[Password] [varchar](128) NULL
)
GO
CREATE TABLE [dbo].[UsersRole](
	[Users_id] [int] NOT NULL,
	[Role_id] [int] NOT NULL
	PRIMARY KEY(Users_id,Role_id)
)
GO
ALTER TABLE [dbo].[Inquiry]  WITH CHECK ADD FOREIGN KEY([CreationUsersId])
REFERENCES [dbo].[Users] ([Users_id])
GO
ALTER TABLE [dbo].[Inquiry]  WITH CHECK ADD FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Users] ([Users_id])
GO
ALTER TABLE [dbo].[Inquiryresponse]  WITH CHECK ADD FOREIGN KEY([InquiryId])
REFERENCES [dbo].[Inquiry] ([Inquiry_id])
GO
ALTER TABLE [dbo].[UsersRole]  WITH CHECK ADD FOREIGN KEY([Role_id])
REFERENCES [dbo].[Role] ([Role_id])
GO
ALTER TABLE [dbo].[UsersRole]  WITH CHECK ADD FOREIGN KEY([Users_id])
REFERENCES [dbo].[Users] ([Users_id])

/****** Stored Procedures ******/
GO
CREATE PROCEDURE [dbo].[SelectUsersByEmail] (@Email  varchar(256),@Password varchar(128)) 
AS 
  BEGIN 
    select Users.Users_id,
	Users.Name,
	Users.Lastname,
	Users.Email,
	Role.Name as 'Password'
	from Users
	inner join UsersRole
	on UsersRole.Users_id=Users.Users_id
	inner join Role
	on Role.Role_id=UsersRole.Role_id
	where Users.Email=@Email
	and Users.Password = @Password
END
/****** Object:  StoredProcedure [dbo].[SelectUsersById]    Script Date: 2/7/2020 11:45:37 ******/
GO
CREATE PROCEDURE [dbo].[SelectUsersById] (@UsersId  INTEGER) 
AS 
  BEGIN 
    select Users.Users_id,
	Users.Name,
	Users.Lastname,
	Users.Email,
	Role.Name as 'Password'
	from Users
	inner join UsersRole
	on UsersRole.Users_id=Users.Users_id
	inner join Role
	on Role.Role_id=UsersRole.Role_id
	where Users.Users_id=@UsersId
END
GO
