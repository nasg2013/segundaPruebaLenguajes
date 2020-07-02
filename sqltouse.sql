SELECT * FROM [dbo].[Inquiry];
SELECT * FROM [dbo].[InquiryResponse];
SELECT * FROM [dbo].[AspNetUsers];
SELECT * FROM [dbo].[AspNetUserRoles];
SELECT * FROM [dbo].[AspNetRoles];

SELECT	AspNetUsers.Id, 
		AspNetUsers.Name, 
		AspNetUsers.LastName,
		AspNetUsers.IdentityCard,
		AspNetUsers.Status,
		AspNetUsers.UserName FROM AspNetUsers
		INNER JOIN AspNetUserRoles
		ON AspNetUserRoles.UserId= AspNetUsers.Id
		INNER JOIN AspNetRoles
		ON AspNetRoles.Id=AspNetUserRoles.RoleId
		where AspNetRoles.Name='Admin'or AspNetRoles.Name='Teacher';
		
CREATE TABLE Users(
	Users_id int primary key identity(1,1),
	Name varchar(max),
	Lastname varchar(max),
	Email varchar(256),
	Password varchar(128)
);

 Create table Role(
	Role_id int primary key identity(1,1),
	Name varchar(32) check (Name='Admin' or Name='Teacher' or Name = 'Student')
);

CREATE TABLE UsersRole(
	Users_id int,
	Role_id int
	PRIMARY key(Users_id,Role_id)
);

Create table Inquiry(
	Inquiry_id int primary key identity(1,1),
	Type varchar(32),
	Content varchar(max),
	CreationUsersId int,
	TeacherId int
);

Create table InquiryResponse(
	InquiryResponse_id int primary key identity(1,1),
	Content varchar(max),
	InquiryId int
);

Alter table UsersRole
ADD FOREIGN KEY (Users_id) References Users(Users_id);
Alter table UsersRole
ADD FOREIGN KEY (Role_id) References Role(Role_id);

Alter table Inquiry
ADD FOREIGN KEY (CreationUsersId) References Users(Users_id);
Alter table Inquiry
ADD FOREIGN KEY (TeacherId) References Users(Users_id);

Alter table InquiryResponse
ADD FOREIGN KEY (InquiryId) References Inquiry(Inquiry_id);

select Role.Name from Users
inner join UsersRole
on UsersRole.Users_id=Users.Users_id
inner join Role
on Role.Role_id=UsersRole.Role_id
where Users.Users_id='3'

select Users.Users_id, Users.Name,Users.Lastname,Users.Email, Users.Users_id as 'Password'
from Users
inner join UsersRole
on UsersRole.Users_id=Users.Users_id
inner join Role
on Role.Role_id=UsersRole.Role_id
where Role.Name='student'

select *
from Users







