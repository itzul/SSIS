USE [master]
GO
/****** Object:  Database [StagingArea]    Script Date: 5/25/2022 9:54:30 AM ******/
CREATE DATABASE [StagingArea]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StagingArea', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StagingArea.mdf' , SIZE = 21614592KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StagingArea_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StagingArea_log.ldf' , SIZE = 9228288KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StagingArea] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StagingArea].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StagingArea] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StagingArea] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StagingArea] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StagingArea] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StagingArea] SET ARITHABORT OFF 
GO
ALTER DATABASE [StagingArea] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StagingArea] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StagingArea] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StagingArea] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StagingArea] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StagingArea] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StagingArea] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StagingArea] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StagingArea] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StagingArea] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StagingArea] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StagingArea] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StagingArea] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StagingArea] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StagingArea] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StagingArea] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StagingArea] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StagingArea] SET RECOVERY FULL 
GO
ALTER DATABASE [StagingArea] SET  MULTI_USER 
GO
ALTER DATABASE [StagingArea] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StagingArea] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StagingArea] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StagingArea] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StagingArea] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StagingArea] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'StagingArea', N'ON'
GO
ALTER DATABASE [StagingArea] SET QUERY_STORE = OFF
GO
USE [StagingArea]
GO
/****** Object:  UserDefinedFunction [dbo].[DATEKONTROLL]    Script Date: 5/25/2022 9:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[DATEKONTROLL] (@SIFFRA VARCHAR(13))
RETURNS VARCHAR(10) AS
BEGIN 
	DECLARE @Date1 DATETIME2, @date VARCHAR(8) =
		CASE 
			WHEN len(@siffra) IN ( 10, 11) 
			THEN lEFT(@siffra, 6)
			WHEN len(@siffra) IN (12,13) 
			THEN LEFT(@siffra, 8)
		END
	DECLARE @siffra1 varchar(6) = 
	CASE 
			WHEN len(@date) = 6 
			THEN @date + right (@siffra, 4)
			WHEN len(@siffra) = 8 
			THEN right(@date,6) + right (@siffra, 4)
		END
		SET @Date1 = convert(DATETIME2, @Date, 102)
		IF (@Date1 <= GetDate() and  DATEADD(yy,-105,Getdate()) <= @DATE1)
		RETURN @siffra1;
		RETURN 0;
END
GO
/****** Object:  UserDefinedFunction [dbo].[DATEKONTROLL1]    Script Date: 5/25/2022 9:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[DATEKONTROLL1] (@SIFFRA VARCHAR(13))
RETURNS VARCHAR(10) AS
BEGIN 
	DECLARE @Date1 DATETIME2, @date VARCHAR(8) =
		CASE 
			WHEN len(@siffra) IN ( 10, 11) 
			THEN lEFT(@siffra, 6)
			WHEN len(@siffra) IN (12,13) 
			THEN LEFT(@siffra, 8)
		END
	DECLARE @siffra1 varchar(6) = 
	CASE 
			WHEN len(@date) = 6 
			THEN @date + right (@siffra, 4)
			WHEN len(@siffra) = 8 
			THEN (right(@date,6) + right (@siffra, 4))
		END
		SET @Date1 = convert(DATETIME2, @Date, 102)
		IF (@Date1 <= GetDate() and  DATEADD(yy,-105,Getdate()) <= @DATE1)
		RETURN @siffra1;
		RETURN 0;
END
GO
/****** Object:  UserDefinedFunction [dbo].[DATEKONTROLL11]    Script Date: 5/25/2022 9:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[DATEKONTROLL11] (@SIFFRA VARCHAR(13))
RETURNS VARCHAR(10) AS
BEGIN 
	DECLARE @Date1 DATETIME2, @date VARCHAR(8) =
		CASE 
			WHEN len(@siffra) IN ( 10, 11) 
			THEN lEFT(@siffra, 6)
			WHEN len(@siffra) IN (12,13) 
			THEN LEFT(@siffra, 8)
		END
	DECLARE @siffra1 varchar(10) = 
	CASE 
			WHEN len(@date) = 6 
			THEN @date + right (@siffra, 4)
			WHEN len(@siffra) = 8 
			THEN (right(@date,6) + right (@siffra, 4))
	END
		SET @Date1 = convert(DATETIME2, @Date, 102)
		IF (@Date1 <= GetDate() and  DATEADD(yy,-105,Getdate()) <= @DATE1)
		RETURN @siffra1;
		RETURN 0;
END
GO
/****** Object:  UserDefinedFunction [dbo].[DATEKONTROLL111]    Script Date: 5/25/2022 9:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[DATEKONTROLL111] (@SIFFRA VARCHAR(13))
RETURNS VARCHAR(10) AS
BEGIN 
	DECLARE @Date1 DATETIME2, @date VARCHAR(8) =
		CASE 
			WHEN len(@siffra) IN ( 10, 11) 
			THEN lEFT(@siffra, 6)
			WHEN len(@siffra) IN (12,13) 
			THEN LEFT(@siffra, 8)
		END
	DECLARE @siffra1 varchar(10) = 
	CASE 
			WHEN len(@date) = 6 
			THEN @date + right(@siffra, 4)
			WHEN len(@date) = 8 
			THEN (right(@date, 6) + right(@siffra, 4))
	END
		SET @Date1 = convert(DATETIME2, @Date, 102)
		IF (@Date1 <= GetDate() and  DATEADD(yy,-105,Getdate()) <= @DATE1)
		RETURN @siffra1;
		RETURN 0;
END
GO
/****** Object:  UserDefinedFunction [dbo].[Kontrollsiffra]    Script Date: 5/25/2022 9:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**********************
KONTROLLSIFFRA
ITZUL L. VERGARA

LITE FAKTA:
-Första delen handlar om datum och kontrollerar att datum stämmer och förbereder siffrorna för att kunna loopa dem. 

-Andra delen är en loop (WHILE) som börjar med om datum är rätt: 
Det betyder att datumet är bra skrivet samt att det handlar om en begränsad tidsperiod mellan nutid och 105 år tillbaka i tiden.

************************/

CREATE FUNCTION [dbo].[Kontrollsiffra] (@SIFFRA VARCHAR(13))
RETURNS CHAR(1) AS 
BEGIN 
	DECLARE @Count INT 
	, @Part INT, @Div INT
	, @Rest INT
	, @Total INT =0, @Suma INT
	, @Sista TINYINT
	, @Control INT
	, @Date1 DATETIME2
	, @personalnum VARCHAR(10)
	, @date VARCHAR(8) =
		CASE 
			WHEN LEN(@siffra) IN ( 10, 11) 
			THEN LEFT(@siffra, 6)
			WHEN LEN(@siffra) IN (12,13) 
			THEN LEFT(@siffra, 8)
		END
	DECLARE @Siffra1 VARCHAR(10) =  
	CASE 
			WHEN LEN(@date) = 6 
			   THEN @Date + RIGHT(@siffra, 4)
			WHEN LEN(@date) = 8 
			   THEN RIGHT(@date,6) + RIGHT(@siffra, 4)
		END
		SET @Date1 = CONVERT(DATETIME2, @Date, 102) 
		SET @Sista= (10 - RIGHT(@total,1))
		SET @Count = 1
		SET @Control = (RIGHT(@Personalnum, 1))
		SET @personalnum = 
			CASE 
			  WHEN (@Date1 <= GETDATE() AND  DATEADD(yy,-105,GETDATE()) <= @Date1)
			  THEN CONVERT(BIGINT,(@siffra1))
			  WHEN (@Date1 > GETDATE() AND  DATEADD(yy,-105,GETDATE()) > @Date1)
			  THEN 0
		END
SET @Count = 1
	WHILE(@Count  <  10) 
	BEGIN
			SET @Part = (CAST(SUBSTRING(@Personalnum,LEN(@personalnum) - @Count, 1)AS TINYINT)) * (1 + @Count % 2)
	IF 1 + @Count % 2 = 2
	BEGIN
		SET @Div = @part % 10
		SET @Rest = @part / 10
		SET @Suma = @Rest +  @Div
	END
	   ELSE IF 1 + @Count % 2 = 1
			BEGIN
			    SET @Suma = @part * 1
			END
	    SET @total = @total + @Suma
	    SET @Count = @Count + 1
	END

	SET @Sista =(10 - RIGHT(@total,1));
	SET @Control  = (RIGHT(@personalnum,1));
 IF(@Sista = @Control) OR (@Sista = 10 and @Control = 0) 
 --Extra villkor finns för personnummner som slutar med 0, då det blir fel om man inte tar hänsyn till det.
	RETURN  1;
 ELSE
	RETURN  0;
RETURN 0;
END

GO
/****** Object:  UserDefinedFunction [dbo].[kontrolsiffra]    Script Date: 5/25/2022 9:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[kontrolsiffra] (@siffra varchar(10))
RETURNS INT
	AS 
	BEGIN 
	DECLARE @math1 VARCHAR(10) = dbo.DATEKONTROLL(@Siffra)
	DECLARE @math INT = cast (substring(@math1, 1,1) AS INT)*2,
	 @MATH2 INT =  cast(substring(@math1, 2,1) AS INT), 
	 @MATH3 INT  =  CAST (SUBSTRING(@math1, 3, 1)AS INT)*2,
	 @MATH4 INT =  cast(substring(@math1, 4,1) AS INT),
	 @math5 INT = cast (substring(@math1, 5,1) AS INT)*2,
	 @MATH6 INT =  cast(substring(@math1, 6,1) AS INT), 
	 @MATH7 INT  =  CAST (SUBSTRING(@math1, 7, 1)AS INT)*2,
	 @MATH8 INT =  cast(substring(@math1, 8,1) AS INT), 
	 @MATH9 INT  =  CAST (SUBSTRING(@math1, 9, 1)AS INT)*2,
	 @MATH10 INT =  cast(substring(@math1, 10, 1) AS INT)
		DECLARE @siffra1 int  =
					CASE
						WHEN  @math < 9 THEN  @math
						WHEN  @Math   between 10 and 18 then  cast(LEFT(@math, 1) as tinyint) + convert (tinyint, RIGHT(@math,1))  
					END
		DECLARE @siffra2 int  =
					CASE
						WHEN  @math2 < 9 THEN  @math2
						WHEN  @Math2 between 10 and 18 then cast(LEFT(@math2, 1) as tinyint) + convert (tinyint, RIGHT(@math2,1))  
					END
		DECLARE @siffra3 int  =
					CASE
						WHEN  @math3 < 9 THEN  @math3
						WHEN  @Math3   between 10 and 18 then  cast(LEFT(@math3, 1) as tinyint) + convert (tinyint, RIGHT(@math3,1)) 
					END
	    DECLARE @siffra4 int  =
					CASE
						WHEN  @math4 < 9 THEN  @math4
						WHEN  @Math4   between 10 and 18 then  cast(LEFT(@math4, 1) as tinyint) + convert (tinyint, RIGHT(@math4,1))  
					END
		DECLARE @siffra5 int  =
					CASE
						WHEN  @math5 < 9 THEN  @math5
						WHEN  @Math5 between 10 and 18 then cast(LEFT(@math5, 1) as tinyint) + convert (tinyint, RIGHT(@math5,1))  
					END
		DECLARE @siffra6 int  =
					CASE
						WHEN  @math6 < 9 THEN  @math6
						WHEN  @Math6   between 10 and 18 then  cast(LEFT(@math6, 1) as tinyint) + convert (tinyint, RIGHT(@math6,1)) 
					END
		DECLARE @siffra7 int  =
					CASE
						WHEN  @math7 < 9 THEN  @math7
						WHEN  @Math7   between 10 and 18 then  cast(LEFT(@math7, 1) as tinyint) + convert (tinyint, RIGHT(@math7,1))  
					END
		DECLARE @siffra8 int  =
					CASE
						WHEN  @math8 < 9 THEN  @math8
						WHEN  @Math8 between 10 and 18 then cast(LEFT(@math8, 1) as tinyint) + convert (tinyint, RIGHT(@math8,1))  
					END
		DECLARE @siffra9 int  =
					CASE
						WHEN  @math9 < 9 THEN  @math9
						WHEN  @Math9   between 10 and 18 then  cast(LEFT(@math9, 1) as tinyint) + convert (tinyint, RIGHT(@math9,1)) 
					END
		DECLARE @siffra10 int  =
					CASE
						WHEN  @math10 < 9 THEN  @math10
						WHEN  @Math10   between 10 and 18 then  cast(LEFT(@math10, 1) as tinyint) + convert (tinyint, RIGHT(@math10,1)) 
					END
	DECLARE @siffraT INT =
					( @siffra1 + @siffra2 + @siffra3 + @siffra4 + @siffra5 + @siffra6 + @siffra7 + @siffra8 + @siffra9 + @siffra10)
	
	IF (@siffraT %10 = 0)
	RETURN @siffraT; 
	RETURN 0; 
END
GO
/****** Object:  Table [dbo].[AirportData]    Script Date: 5/25/2022 9:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AirportData](
	[AirportID] [varchar](5) NULL,
	[AirportName] [varchar](41) NULL,
	[City] [varchar](33) NULL,
	[State] [varchar](2) NULL,
	[Country] [varchar](30) NULL,
	[Latitude] [real] NULL,
	[Longitude] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carrier]    Script Date: 5/25/2022 9:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrier](
	[CarrierID] [varchar](15) NULL,
	[Description] [varchar](60) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimPlane]    Script Date: 5/25/2022 9:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPlane](
	[Tailnumber] [varchar](10) NULL,
	[OwnerType] [varchar](50) NULL,
	[Manufacturer] [varchar](50) NULL,
	[IssueDate] [varchar](50) NULL,
	[Model] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[AircraftType] [varchar](50) NULL,
	[EngineType] [varchar](50) NULL,
	[Year] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlightData]    Script Date: 5/25/2022 9:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlightData](
	[Date] [date] NULL,
	[Dateint] [int] NULL,
	[Year] [smallint] NULL,
	[Month] [tinyint] NULL,
	[DayofMonth] [tinyint] NULL,
	[DayOfWeek] [tinyint] NULL,
	[UniqueCarrier] [varchar](5) NULL,
	[FlightNum] [varchar](5) NULL,
	[TailNum] [varchar](10) NULL,
	[Origin] [varchar](5) NULL,
	[Dest] [varchar](5) NULL,
	[Distance] [varchar](10) NULL,
	[TaxiIn] [varchar](3) NULL,
	[TaxiOut] [varchar](3) NULL,
	[Cancelled] [varchar](2) NULL,
	[CancellationCode] [varchar](5) NULL,
	[Diverted] [varchar](5) NULL,
	[CarrierDelay] [varchar](5) NULL,
	[WeatherDelay] [varchar](5) NULL,
	[NASDelay] [varchar](5) NULL,
	[SecurityDelay] [varchar](5) NULL,
	[LateAircraftDelay] [varchar](5) NULL,
	[ActualElapsedTime_int] [int] NULL,
	[AirTime] [int] NULL,
	[ArrDelay] [int] NULL,
	[DepDelay_int] [int] NULL,
	[CRSDepTime] [time](0) NULL,
	[ArrTime] [time](0) NULL,
	[DepTime] [time](0) NULL,
	[CRSArrTime] [time](0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NA]    Script Date: 5/25/2022 9:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NA](
	[Year] [varchar](50) NULL,
	[Month] [varchar](50) NULL,
	[DayofMonth] [varchar](50) NULL,
	[DayOfWeek] [varchar](50) NULL,
	[DepTime] [varchar](50) NULL,
	[CRSDepTime] [varchar](50) NULL,
	[ArrTime] [varchar](50) NULL,
	[CRSArrTime] [varchar](50) NULL,
	[UniqueCarrier] [varchar](50) NULL,
	[FlightNum] [varchar](50) NULL,
	[TailNum] [varchar](50) NULL,
	[ActualElapsedTime] [varchar](50) NULL,
	[CRSElapsedTime] [varchar](50) NULL,
	[AirTime] [varchar](50) NULL,
	[ArrDelay] [varchar](50) NULL,
	[DepDelay] [varchar](50) NULL,
	[Origin] [varchar](50) NULL,
	[Dest] [varchar](50) NULL,
	[Distance] [varchar](50) NULL,
	[TaxiIn] [varchar](50) NULL,
	[TaxiOut] [varchar](50) NULL,
	[Cancelled] [varchar](50) NULL,
	[CancellationCode] [varchar](50) NULL,
	[Diverted] [varchar](50) NULL,
	[CarrierDelay] [varchar](2) NULL,
	[WeatherDelay] [varchar](50) NULL,
	[NASDelay] [varchar](50) NULL,
	[SecurityDelay] [varchar](50) NULL,
	[LateAircraftDelay] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaneData]    Script Date: 5/25/2022 9:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaneData](
	[TailNumber] [varchar](10) NULL,
	[OwnerType] [varchar](50) NULL,
	[Manufacturer] [varchar](50) NULL,
	[IssueDate] [varchar](50) NULL,
	[Model] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[AircraftType] [varchar](50) NULL,
	[EngineType] [varchar](50) NULL,
	[Year] [varchar](50) NULL,
	[Copy of TailNumber] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Routes]    Script Date: 5/25/2022 9:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Routes](
	[Origin] [varchar](3) NULL,
	[Destination] [varchar](10) NULL,
	[Distance] [varchar](10) NULL,
	[RouteID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [StagingArea] SET  READ_WRITE 
GO
