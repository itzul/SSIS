USE [master]
GO
/****** Object:  Database [SourceSystems]    Script Date: 5/25/2022 9:53:30 AM ******/
CREATE DATABASE [SourceSystems]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SourceSystems', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SourceSystems.mdf' , SIZE = 15417344KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SourceSystems_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SourceSystems_log.ldf' , SIZE = 3547136KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SourceSystems] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SourceSystems].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SourceSystems] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SourceSystems] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SourceSystems] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SourceSystems] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SourceSystems] SET ARITHABORT OFF 
GO
ALTER DATABASE [SourceSystems] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SourceSystems] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SourceSystems] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SourceSystems] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SourceSystems] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SourceSystems] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SourceSystems] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SourceSystems] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SourceSystems] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SourceSystems] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SourceSystems] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SourceSystems] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SourceSystems] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SourceSystems] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SourceSystems] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SourceSystems] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SourceSystems] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SourceSystems] SET RECOVERY FULL 
GO
ALTER DATABASE [SourceSystems] SET  MULTI_USER 
GO
ALTER DATABASE [SourceSystems] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SourceSystems] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SourceSystems] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SourceSystems] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SourceSystems] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SourceSystems] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SourceSystems', N'ON'
GO
ALTER DATABASE [SourceSystems] SET QUERY_STORE = OFF
GO
USE [SourceSystems]
GO
/****** Object:  UserDefinedFunction [dbo].[DATEKONTROLL]    Script Date: 5/25/2022 9:53:30 AM ******/
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
/****** Object:  UserDefinedFunction [dbo].[DATEKONTROLL1]    Script Date: 5/25/2022 9:53:30 AM ******/
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
/****** Object:  UserDefinedFunction [dbo].[DATEKONTROLL11]    Script Date: 5/25/2022 9:53:30 AM ******/
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
/****** Object:  UserDefinedFunction [dbo].[DATEKONTROLL111]    Script Date: 5/25/2022 9:53:30 AM ******/
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
/****** Object:  UserDefinedFunction [dbo].[Kontrollsiffra]    Script Date: 5/25/2022 9:53:30 AM ******/
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
/****** Object:  UserDefinedFunction [dbo].[kontrolsiffra]    Script Date: 5/25/2022 9:53:30 AM ******/
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
/****** Object:  Table [dbo].[Airports]    Script Date: 5/25/2022 9:53:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airports](
	[iata] [varchar](5) NULL,
	[airport] [varchar](41) NULL,
	[city] [varchar](33) NULL,
	[state] [varchar](2) NULL,
	[country] [varchar](30) NULL,
	[lat] [real] NULL,
	[long] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carrier]    Script Date: 5/25/2022 9:53:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrier](
	[Code] [varchar](15) NULL,
	[Description] [varchar](60) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorDataflight]    Script Date: 5/25/2022 9:53:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorDataflight](
	[Flat File Source Error Output Column] [varchar](max) NULL,
	[ErrorCode] [int] NULL,
	[ErrorColumn] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlightData]    Script Date: 5/25/2022 9:53:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlightData](
	[Year] [smallint] NULL,
	[Month] [smallint] NULL,
	[DayofMonth] [smallint] NULL,
	[DayOfWeek] [smallint] NULL,
	[DepTime] [smallint] NULL,
	[CRSDepTime] [smallint] NULL,
	[ArrTime] [smallint] NULL,
	[CRSArrTime] [smallint] NULL,
	[UniqueCarrier] [varchar](2) NULL,
	[FlightNum] [smallint] NULL,
	[TailNum] [varchar](6) NULL,
	[ActualElapsedTime] [smallint] NULL,
	[CRSElapsedTime] [smallint] NULL,
	[AirTime] [smallint] NULL,
	[ArrDelay] [smallint] NULL,
	[DepDelay] [smallint] NULL,
	[Dest] [varchar](3) NULL,
	[Distance] [smallint] NULL,
	[TaxiIn] [smallint] NULL,
	[TaxiOut] [smallint] NULL,
	[Cancelled] [smallint] NULL,
	[CancellationCode] [varchar](2) NULL,
	[Diverted] [smallint] NULL,
	[CarrierDelay] [varchar](2) NULL,
	[WeatherDelay] [varchar](2) NULL,
	[NASDelay] [varchar](2) NULL,
	[SecurityDelay] [varchar](2) NULL,
	[LateAircraftDelay] [varchar](2) NULL,
	[Origin] [varchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plane-data]    Script Date: 5/25/2022 9:53:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plane-data](
	[tailnum] [varchar](50) NULL,
	[type] [varchar](50) NULL,
	[manufacturer] [varchar](50) NULL,
	[issue_date] [varchar](50) NULL,
	[model] [varchar](50) NULL,
	[status] [varchar](50) NULL,
	[aircraft_type] [varchar](50) NULL,
	[engine_type] [varchar](50) NULL,
	[year] [varchar](50) NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [SourceSystems] SET  READ_WRITE 
GO
