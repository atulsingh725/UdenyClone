USE [master]
GO
/****** Object:  Database [UdemyCloneDb]    Script Date: 2024-03-15 12:52:40 ******/
CREATE DATABASE [UdemyCloneDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UdemyCloneDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\UdemyCloneDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UdemyCloneDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\UdemyCloneDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UdemyCloneDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UdemyCloneDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UdemyCloneDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UdemyCloneDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UdemyCloneDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UdemyCloneDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UdemyCloneDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [UdemyCloneDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [UdemyCloneDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UdemyCloneDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UdemyCloneDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UdemyCloneDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UdemyCloneDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UdemyCloneDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UdemyCloneDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UdemyCloneDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UdemyCloneDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UdemyCloneDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UdemyCloneDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UdemyCloneDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UdemyCloneDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UdemyCloneDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UdemyCloneDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UdemyCloneDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UdemyCloneDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UdemyCloneDb] SET  MULTI_USER 
GO
ALTER DATABASE [UdemyCloneDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UdemyCloneDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UdemyCloneDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UdemyCloneDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UdemyCloneDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UdemyCloneDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [UdemyCloneDb] SET QUERY_STORE = OFF
GO
USE [UdemyCloneDb]
GO
/****** Object:  Table [dbo].[tbl_login]    Script Date: 2024-03-15 12:52:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_login](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[tbl_Register_id] [int] NULL,
	[Password] [nvarchar](32) NULL,
	[EntryDate] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_loginlog]    Script Date: 2024-03-15 12:52:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_loginlog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Remark] [nvarchar](256) NULL,
	[Latitude] [varchar](16) NULL,
	[Longitude] [varchar](16) NULL,
	[EntryDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Otp]    Script Date: 2024-03-15 12:52:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Otp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[tbl_Register_id] [int] NULL,
	[Otp] [varchar](8) NULL,
	[Remark] [varchar](16) NULL,
	[IsVerified] [bit] NULL,
	[EntryDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Registration]    Script Date: 2024-03-15 12:52:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Registration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Uid] [varchar](64) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[MobileNumber] [nvarchar](16) NULL,
	[ProfileImage] [varchar](256) NULL,
	[RegisterDate] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
	[isServiceProvider] [bit] NULL,
	[isVerified] [bit] NULL,
	[isActive] [bit] NULL,
	[isDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Otp] ON 

INSERT [dbo].[tbl_Otp] ([Id], [tbl_Register_id], [Otp], [Remark], [IsVerified], [EntryDate]) VALUES (1, 1, N'999999', N'New Registration', 0, CAST(N'2024-03-14T15:32:56.993' AS DateTime))
INSERT [dbo].[tbl_Otp] ([Id], [tbl_Register_id], [Otp], [Remark], [IsVerified], [EntryDate]) VALUES (2, 2, N'999999', N'New Registration', 0, CAST(N'2024-03-14T15:41:01.573' AS DateTime))
INSERT [dbo].[tbl_Otp] ([Id], [tbl_Register_id], [Otp], [Remark], [IsVerified], [EntryDate]) VALUES (3, 3, N'999999', N'New Registration', 0, CAST(N'2024-03-14T15:42:14.430' AS DateTime))
INSERT [dbo].[tbl_Otp] ([Id], [tbl_Register_id], [Otp], [Remark], [IsVerified], [EntryDate]) VALUES (4, 4, N'999999', N'New Registration', 0, CAST(N'2024-03-14T15:43:22.477' AS DateTime))
INSERT [dbo].[tbl_Otp] ([Id], [tbl_Register_id], [Otp], [Remark], [IsVerified], [EntryDate]) VALUES (5, 5, N'999999', N'New Registration', 0, CAST(N'2024-03-14T19:49:59.933' AS DateTime))
INSERT [dbo].[tbl_Otp] ([Id], [tbl_Register_id], [Otp], [Remark], [IsVerified], [EntryDate]) VALUES (6, 6, N'999999', N'New Registration', 0, CAST(N'2024-03-14T20:27:36.577' AS DateTime))
INSERT [dbo].[tbl_Otp] ([Id], [tbl_Register_id], [Otp], [Remark], [IsVerified], [EntryDate]) VALUES (7, 7, N'6043', N'New Registration', 0, CAST(N'2024-03-15T12:07:28.747' AS DateTime))
INSERT [dbo].[tbl_Otp] ([Id], [tbl_Register_id], [Otp], [Remark], [IsVerified], [EntryDate]) VALUES (8, 8, N'7006', N'New Registration', 0, CAST(N'2024-03-15T12:14:38.153' AS DateTime))
INSERT [dbo].[tbl_Otp] ([Id], [tbl_Register_id], [Otp], [Remark], [IsVerified], [EntryDate]) VALUES (9, 9, N'1856', N'New Registration', 0, CAST(N'2024-03-15T12:20:48.187' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_Otp] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Registration] ON 

INSERT [dbo].[Tbl_Registration] ([Id], [Uid], [FirstName], [LastName], [Email], [MobileNumber], [ProfileImage], [RegisterDate], [LastUpdateDate], [isServiceProvider], [isVerified], [isActive], [isDelete]) VALUES (1, N'00000000-0000-0000-0000-000000000000', N'harsu', N'sr', N'hsrivastava544@gmail.com', NULL, NULL, CAST(N'2024-03-14T15:32:56.987' AS DateTime), NULL, NULL, 0, 0, 0)
INSERT [dbo].[Tbl_Registration] ([Id], [Uid], [FirstName], [LastName], [Email], [MobileNumber], [ProfileImage], [RegisterDate], [LastUpdateDate], [isServiceProvider], [isVerified], [isActive], [isDelete]) VALUES (2, N'00000000-0000-0000-0000-000000000000', N'harsu', N'sr', N'hsrivastava544@gmail.com', NULL, NULL, CAST(N'2024-03-14T15:41:01.530' AS DateTime), NULL, NULL, 0, 0, 0)
INSERT [dbo].[Tbl_Registration] ([Id], [Uid], [FirstName], [LastName], [Email], [MobileNumber], [ProfileImage], [RegisterDate], [LastUpdateDate], [isServiceProvider], [isVerified], [isActive], [isDelete]) VALUES (3, N'00000000-0000-0000-0000-000000000000', N'harsu', N'sr', N'hsrivastava544@gmail.com', NULL, NULL, CAST(N'2024-03-14T15:42:14.430' AS DateTime), NULL, NULL, 0, 0, 0)
INSERT [dbo].[Tbl_Registration] ([Id], [Uid], [FirstName], [LastName], [Email], [MobileNumber], [ProfileImage], [RegisterDate], [LastUpdateDate], [isServiceProvider], [isVerified], [isActive], [isDelete]) VALUES (4, N'00000000-0000-0000-0000-000000000000', N'harsu', N'sr', N'hsrivastava544@gmail.com', NULL, NULL, CAST(N'2024-03-14T15:43:22.433' AS DateTime), NULL, NULL, 0, 0, 0)
INSERT [dbo].[Tbl_Registration] ([Id], [Uid], [FirstName], [LastName], [Email], [MobileNumber], [ProfileImage], [RegisterDate], [LastUpdateDate], [isServiceProvider], [isVerified], [isActive], [isDelete]) VALUES (5, N'00000000-0000-0000-0000-000000000000', N'vinay', N'kumar ', N'itsvinaykumar19@gmail.com', NULL, NULL, CAST(N'2024-03-14T19:49:59.930' AS DateTime), NULL, NULL, 0, 0, 0)
INSERT [dbo].[Tbl_Registration] ([Id], [Uid], [FirstName], [LastName], [Email], [MobileNumber], [ProfileImage], [RegisterDate], [LastUpdateDate], [isServiceProvider], [isVerified], [isActive], [isDelete]) VALUES (6, N'00000000-0000-0000-0000-000000000000', N'rtyui', N'tyuio', N'atulsinghrbl725@gmail.com', NULL, NULL, CAST(N'2024-03-14T20:27:36.577' AS DateTime), NULL, NULL, 0, 0, 0)
INSERT [dbo].[Tbl_Registration] ([Id], [Uid], [FirstName], [LastName], [Email], [MobileNumber], [ProfileImage], [RegisterDate], [LastUpdateDate], [isServiceProvider], [isVerified], [isActive], [isDelete]) VALUES (7, N'00000000-0000-0000-0000-000000000000', N'ajeet ', N'maurya', N'mrajeet2021@gmail.com', NULL, NULL, CAST(N'2024-03-15T12:07:28.747' AS DateTime), NULL, NULL, 0, 0, 0)
INSERT [dbo].[Tbl_Registration] ([Id], [Uid], [FirstName], [LastName], [Email], [MobileNumber], [ProfileImage], [RegisterDate], [LastUpdateDate], [isServiceProvider], [isVerified], [isActive], [isDelete]) VALUES (8, N'00000000-0000-0000-0000-000000000000', N'ajeet ', N'maurya', N'ajeetkumarmaurya.rbl@gmail.com', NULL, NULL, CAST(N'2024-03-15T12:14:38.153' AS DateTime), NULL, NULL, 0, 0, 0)
INSERT [dbo].[Tbl_Registration] ([Id], [Uid], [FirstName], [LastName], [Email], [MobileNumber], [ProfileImage], [RegisterDate], [LastUpdateDate], [isServiceProvider], [isVerified], [isActive], [isDelete]) VALUES (9, N'00000000-0000-0000-0000-000000000000', N'ajeet ', N'maurya', N'mrajeet2021@gmail.com', NULL, NULL, CAST(N'2024-03-15T12:20:48.183' AS DateTime), NULL, NULL, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Tbl_Registration] OFF
GO
ALTER TABLE [dbo].[tbl_login] ADD  DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [dbo].[tbl_loginlog] ADD  DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [dbo].[tbl_Otp] ADD  DEFAULT ((0)) FOR [IsVerified]
GO
ALTER TABLE [dbo].[tbl_Otp] ADD  DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [dbo].[Tbl_Registration] ADD  DEFAULT (getdate()) FOR [RegisterDate]
GO
ALTER TABLE [dbo].[Tbl_Registration] ADD  DEFAULT ((0)) FOR [isVerified]
GO
ALTER TABLE [dbo].[Tbl_Registration] ADD  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[Tbl_Registration] ADD  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[tbl_login]  WITH CHECK ADD FOREIGN KEY([tbl_Register_id])
REFERENCES [dbo].[Tbl_Registration] ([Id])
GO
ALTER TABLE [dbo].[tbl_Otp]  WITH CHECK ADD FOREIGN KEY([tbl_Register_id])
REFERENCES [dbo].[Tbl_Registration] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[sp_Register]    Script Date: 2024-03-15 12:52:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_Register]
@Uid varchar(64), 
@FirstName varchar(50),
@LastName nvarchar(50),
@Email varchar(100),
@Otp varchar(8),
@Password nvarchar(32)=null
as
begin
	--if exists(select 1 from Tbl_Registration where Email=@Email)
	--begin
	--     select  '0' as flag , 'Email Already Registered !!!' as msg;
	--	 return;
	--end
  declare @RegisterId int;
  insert into Tbl_Registration(Uid,FirstName,LastName,Email) values(@Uid,@FirstName,@LastName,@Email);
  set @RegisterId=@@IDENTITY;
  insert into tbl_Otp (tbl_Register_id,Otp,Remark) values(@RegisterId,@Otp,'New Registration');
  select  '1' as flag , 'Otp Save Successfully' as msg 
end
GO
USE [master]
GO
ALTER DATABASE [UdemyCloneDb] SET  READ_WRITE 
GO
