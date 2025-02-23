USE [master]
GO
/****** Object:  Database [T28-API_JWT_Ex2]    Script Date: 08/02/2021 13:59:24 ******/
CREATE DATABASE [T28-API_JWT_Ex2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'T28-API_JWT_Ex2', FILENAME = N'/var/opt/mssql/data/T28-API_JWT_Ex2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'T28-API_JWT_Ex2_log', FILENAME = N'/var/opt/mssql/data/T28-API_JWT_Ex2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [T28-API_JWT_Ex2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET ARITHABORT OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET RECOVERY FULL 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET  MULTI_USER 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET QUERY_STORE = OFF
GO
USE [T28-API_JWT_Ex2]
GO
/****** Object:  Table [dbo].[Asignado_a]    Script Date: 08/02/2021 13:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignado_a](
	[Cientifico] [varchar](8) NOT NULL,
	[Proyecto] [char](4) NOT NULL,
 CONSTRAINT [PK_Asignado_a] PRIMARY KEY CLUSTERED 
(
	[Cientifico] ASC,
	[Proyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cientificos]    Script Date: 08/02/2021 13:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cientificos](
	[DNI] [varchar](8) NOT NULL,
	[NomApels] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proyecto]    Script Date: 08/02/2021 13:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proyecto](
	[Id] [char](4) NOT NULL,
	[Nombre] [nvarchar](255) NULL,
	[Horas] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 08/02/2021 13:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[UserName] [varchar](30) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Asignado_a] ([Cientifico], [Proyecto]) VALUES (N'10000000', N'0005')
INSERT [dbo].[Asignado_a] ([Cientifico], [Proyecto]) VALUES (N'11000000', N'0010')
INSERT [dbo].[Asignado_a] ([Cientifico], [Proyecto]) VALUES (N'20000000', N'0004')
INSERT [dbo].[Asignado_a] ([Cientifico], [Proyecto]) VALUES (N'30000000', N'0003')
INSERT [dbo].[Asignado_a] ([Cientifico], [Proyecto]) VALUES (N'40000000', N'0006')
INSERT [dbo].[Asignado_a] ([Cientifico], [Proyecto]) VALUES (N'50000000', N'0002')
INSERT [dbo].[Asignado_a] ([Cientifico], [Proyecto]) VALUES (N'60000000', N'0001')
INSERT [dbo].[Asignado_a] ([Cientifico], [Proyecto]) VALUES (N'70000000', N'0007')
INSERT [dbo].[Asignado_a] ([Cientifico], [Proyecto]) VALUES (N'80000000', N'0008')
INSERT [dbo].[Asignado_a] ([Cientifico], [Proyecto]) VALUES (N'90000000', N'0009')
GO
INSERT [dbo].[Cientificos] ([DNI], [NomApels]) VALUES (N'10000000', N'Menganito 1')
INSERT [dbo].[Cientificos] ([DNI], [NomApels]) VALUES (N'11000000', N'Menganito 10')
INSERT [dbo].[Cientificos] ([DNI], [NomApels]) VALUES (N'20000000', N'Menganito 2')
INSERT [dbo].[Cientificos] ([DNI], [NomApels]) VALUES (N'30000000', N'Menganito 3')
INSERT [dbo].[Cientificos] ([DNI], [NomApels]) VALUES (N'40000000', N'Menganito 4')
INSERT [dbo].[Cientificos] ([DNI], [NomApels]) VALUES (N'50000000', N'Menganito 5')
INSERT [dbo].[Cientificos] ([DNI], [NomApels]) VALUES (N'60000000', N'Menganito 6')
INSERT [dbo].[Cientificos] ([DNI], [NomApels]) VALUES (N'70000000', N'Menganito 7')
INSERT [dbo].[Cientificos] ([DNI], [NomApels]) VALUES (N'80000000', N'Menganito 8')
INSERT [dbo].[Cientificos] ([DNI], [NomApels]) VALUES (N'90000000', N'Menganito 9')
GO
INSERT [dbo].[Proyecto] ([Id], [Nombre], [Horas]) VALUES (N'0001', N'Proyecto X', 20)
INSERT [dbo].[Proyecto] ([Id], [Nombre], [Horas]) VALUES (N'0002', N'Proyecto Y', 21)
INSERT [dbo].[Proyecto] ([Id], [Nombre], [Horas]) VALUES (N'0003', N'Proyecto Z', 22)
INSERT [dbo].[Proyecto] ([Id], [Nombre], [Horas]) VALUES (N'0004', N'Proyecto A', 23)
INSERT [dbo].[Proyecto] ([Id], [Nombre], [Horas]) VALUES (N'0005', N'Proyecto B', 24)
INSERT [dbo].[Proyecto] ([Id], [Nombre], [Horas]) VALUES (N'0006', N'Proyecto C', 25)
INSERT [dbo].[Proyecto] ([Id], [Nombre], [Horas]) VALUES (N'0007', N'Proyecto D', 26)
INSERT [dbo].[Proyecto] ([Id], [Nombre], [Horas]) VALUES (N'0008', N'Proyecto E', 27)
INSERT [dbo].[Proyecto] ([Id], [Nombre], [Horas]) VALUES (N'0009', N'Proyecto H', 28)
INSERT [dbo].[Proyecto] ([Id], [Nombre], [Horas]) VALUES (N'0010', N'Proyecto K', 29)
GO
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([UserId], [FirstName], [LastName], [UserName], [Email], [Password], [CreatedDate]) VALUES (1, N'Piezas', N'Admin', N'PiezasAdmin', N'admin@piezas.com', N'$admin@2021', CAST(N'2021-02-08T12:39:26.733' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
GO
ALTER TABLE [dbo].[UserInfo] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Asignado_a]  WITH CHECK ADD FOREIGN KEY([Cientifico])
REFERENCES [dbo].[Cientificos] ([DNI])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Asignado_a]  WITH CHECK ADD FOREIGN KEY([Proyecto])
REFERENCES [dbo].[Proyecto] ([Id])
ON UPDATE CASCADE
GO
USE [master]
GO
ALTER DATABASE [T28-API_JWT_Ex2] SET  READ_WRITE 
GO
