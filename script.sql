USE [master]
GO
/****** Object:  Database [ChitChat]    Script Date: 28.12.2023 18:46:38 ******/
CREATE DATABASE [ChitChat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChitChat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\ChitChat.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ChitChat_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\ChitChat_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ChitChat] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChitChat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChitChat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChitChat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChitChat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChitChat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChitChat] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChitChat] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChitChat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChitChat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChitChat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChitChat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChitChat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChitChat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChitChat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChitChat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChitChat] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ChitChat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChitChat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChitChat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChitChat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChitChat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChitChat] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChitChat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChitChat] SET RECOVERY FULL 
GO
ALTER DATABASE [ChitChat] SET  MULTI_USER 
GO
ALTER DATABASE [ChitChat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChitChat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChitChat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChitChat] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ChitChat] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ChitChat] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ChitChat', N'ON'
GO
ALTER DATABASE [ChitChat] SET QUERY_STORE = ON
GO
ALTER DATABASE [ChitChat] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ChitChat]
GO
/****** Object:  Table [dbo].[Gruplar]    Script Date: 28.12.2023 18:46:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gruplar](
	[GrupID] [int] IDENTITY(1,1) NOT NULL,
	[GrupAdi] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GrupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GrupMesajlari]    Script Date: 28.12.2023 18:46:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrupMesajlari](
	[GrupMesajID] [int] IDENTITY(1,1) NOT NULL,
	[GrupID] [int] NULL,
	[GonderenID] [int] NULL,
	[MesajTuru] [int] NOT NULL,
	[Icerik] [nvarchar](max) NOT NULL,
	[ZamanDamgasi] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[GrupMesajID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GrupUyeleri]    Script Date: 28.12.2023 18:46:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrupUyeleri](
	[GrupUyeID] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciID] [int] NULL,
	[GrupID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GrupUyeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KullaniciArkadaslar]    Script Date: 28.12.2023 18:46:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KullaniciArkadaslar](
	[ArkadaslikID] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciID1] [int] NULL,
	[KullaniciID2] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ArkadaslikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 28.12.2023 18:46:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[KullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [nvarchar](50) NOT NULL,
	[Sifre] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[ProfilResmi] [nvarchar](255) NULL,
	[IkiFaktorDogrulamaKodu] [nvarchar](10) NULL,
	[IkiFaktorDogrulamaDurumu] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mesajlar]    Script Date: 28.12.2023 18:46:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesajlar](
	[MesajID] [int] IDENTITY(1,1) NOT NULL,
	[GonderenID] [int] NULL,
	[AliciID] [int] NULL,
	[MesajTuru] [int] NOT NULL,
	[Icerik] [nvarchar](max) NOT NULL,
	[ZamanDamgasi] [datetime] NULL,
	[OkunduDurumu] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MesajID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Kullanicilar] ON 

INSERT [dbo].[Kullanicilar] ([KullaniciID], [KullaniciAdi], [Sifre], [Email], [ProfilResmi], [IkiFaktorDogrulamaKodu], [IkiFaktorDogrulamaDurumu]) VALUES (2, N'emre', N'c4265f1f1053ca3588f9934f37deb1fd8d818134e3fd00df9679952e516fdb7b', N'emre@gmail.com', N'', NULL, 0)
SET IDENTITY_INSERT [dbo].[Kullanicilar] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_GrupAdi]    Script Date: 28.12.2023 18:46:39 ******/
ALTER TABLE [dbo].[Gruplar] ADD  CONSTRAINT [UQ_GrupAdi] UNIQUE NONCLUSTERED 
(
	[GrupAdi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Arkadaslik]    Script Date: 28.12.2023 18:46:39 ******/
ALTER TABLE [dbo].[KullaniciArkadaslar] ADD  CONSTRAINT [UQ_Arkadaslik] UNIQUE NONCLUSTERED 
(
	[KullaniciID1] ASC,
	[KullaniciID2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Email]    Script Date: 28.12.2023 18:46:39 ******/
ALTER TABLE [dbo].[Kullanicilar] ADD  CONSTRAINT [UQ_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_KullaniciAdi]    Script Date: 28.12.2023 18:46:39 ******/
ALTER TABLE [dbo].[Kullanicilar] ADD  CONSTRAINT [UQ_KullaniciAdi] UNIQUE NONCLUSTERED 
(
	[KullaniciAdi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GrupMesajlari] ADD  DEFAULT (getdate()) FOR [ZamanDamgasi]
GO
ALTER TABLE [dbo].[Kullanicilar] ADD  DEFAULT ((0)) FOR [IkiFaktorDogrulamaDurumu]
GO
ALTER TABLE [dbo].[Mesajlar] ADD  DEFAULT (getdate()) FOR [ZamanDamgasi]
GO
ALTER TABLE [dbo].[Mesajlar] ADD  DEFAULT ((0)) FOR [OkunduDurumu]
GO
ALTER TABLE [dbo].[GrupMesajlari]  WITH CHECK ADD FOREIGN KEY([GonderenID])
REFERENCES [dbo].[Kullanicilar] ([KullaniciID])
GO
ALTER TABLE [dbo].[GrupMesajlari]  WITH CHECK ADD FOREIGN KEY([GrupID])
REFERENCES [dbo].[Gruplar] ([GrupID])
GO
ALTER TABLE [dbo].[GrupMesajlari]  WITH CHECK ADD  CONSTRAINT [FK_GrupMesajGonderen] FOREIGN KEY([GonderenID])
REFERENCES [dbo].[Kullanicilar] ([KullaniciID])
GO
ALTER TABLE [dbo].[GrupMesajlari] CHECK CONSTRAINT [FK_GrupMesajGonderen]
GO
ALTER TABLE [dbo].[GrupMesajlari]  WITH CHECK ADD  CONSTRAINT [FK_GrupMesajGrup] FOREIGN KEY([GrupID])
REFERENCES [dbo].[Gruplar] ([GrupID])
GO
ALTER TABLE [dbo].[GrupMesajlari] CHECK CONSTRAINT [FK_GrupMesajGrup]
GO
ALTER TABLE [dbo].[GrupUyeleri]  WITH CHECK ADD FOREIGN KEY([GrupID])
REFERENCES [dbo].[Gruplar] ([GrupID])
GO
ALTER TABLE [dbo].[GrupUyeleri]  WITH CHECK ADD FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanicilar] ([KullaniciID])
GO
ALTER TABLE [dbo].[GrupUyeleri]  WITH CHECK ADD  CONSTRAINT [FK_Grup] FOREIGN KEY([GrupID])
REFERENCES [dbo].[Gruplar] ([GrupID])
GO
ALTER TABLE [dbo].[GrupUyeleri] CHECK CONSTRAINT [FK_Grup]
GO
ALTER TABLE [dbo].[GrupUyeleri]  WITH CHECK ADD  CONSTRAINT [FK_GrupKullanici] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanicilar] ([KullaniciID])
GO
ALTER TABLE [dbo].[GrupUyeleri] CHECK CONSTRAINT [FK_GrupKullanici]
GO
ALTER TABLE [dbo].[KullaniciArkadaslar]  WITH CHECK ADD FOREIGN KEY([KullaniciID1])
REFERENCES [dbo].[Kullanicilar] ([KullaniciID])
GO
ALTER TABLE [dbo].[KullaniciArkadaslar]  WITH CHECK ADD FOREIGN KEY([KullaniciID2])
REFERENCES [dbo].[Kullanicilar] ([KullaniciID])
GO
ALTER TABLE [dbo].[KullaniciArkadaslar]  WITH CHECK ADD  CONSTRAINT [FK_Kullanici1] FOREIGN KEY([KullaniciID1])
REFERENCES [dbo].[Kullanicilar] ([KullaniciID])
GO
ALTER TABLE [dbo].[KullaniciArkadaslar] CHECK CONSTRAINT [FK_Kullanici1]
GO
ALTER TABLE [dbo].[KullaniciArkadaslar]  WITH CHECK ADD  CONSTRAINT [FK_Kullanici2] FOREIGN KEY([KullaniciID2])
REFERENCES [dbo].[Kullanicilar] ([KullaniciID])
GO
ALTER TABLE [dbo].[KullaniciArkadaslar] CHECK CONSTRAINT [FK_Kullanici2]
GO
ALTER TABLE [dbo].[Mesajlar]  WITH CHECK ADD FOREIGN KEY([AliciID])
REFERENCES [dbo].[Kullanicilar] ([KullaniciID])
GO
ALTER TABLE [dbo].[Mesajlar]  WITH CHECK ADD FOREIGN KEY([GonderenID])
REFERENCES [dbo].[Kullanicilar] ([KullaniciID])
GO
ALTER TABLE [dbo].[Mesajlar]  WITH CHECK ADD  CONSTRAINT [FK_Alici] FOREIGN KEY([AliciID])
REFERENCES [dbo].[Kullanicilar] ([KullaniciID])
GO
ALTER TABLE [dbo].[Mesajlar] CHECK CONSTRAINT [FK_Alici]
GO
ALTER TABLE [dbo].[Mesajlar]  WITH CHECK ADD  CONSTRAINT [FK_Gonderen] FOREIGN KEY([GonderenID])
REFERENCES [dbo].[Kullanicilar] ([KullaniciID])
GO
ALTER TABLE [dbo].[Mesajlar] CHECK CONSTRAINT [FK_Gonderen]
GO
USE [master]
GO
ALTER DATABASE [ChitChat] SET  READ_WRITE 
GO
