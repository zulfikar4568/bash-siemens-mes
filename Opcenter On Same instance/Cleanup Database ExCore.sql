USE [MASTER]
-- Drop Database OLTP
IF DB_ID('ExCoreOLTP') IS NOT NULL
BEGIN 
	DROP DATABASE [ExCoreOLTP]; 
END

-- Drop Database ODS
IF DB_ID('ExCoreODS') IS NOT NULL
BEGIN 
	DROP DATABASE [ExCoreODS]; 
END

GO
USE [msdb]
DROP USER IF EXISTS ExCoreOLTPUser;
DROP USER IF EXISTS ExCoreODSUser;

DECLARE @jobId BINARY(16)

-- Drop Job ExCoreOLTP if exists!
SELECT @jobId = job_id FROM msdb.dbo.sysjobs WHERE (name = N'Camstar Summary Tables (ExCoreOLTP)')
IF (@jobId IS NOT NULL)
BEGIN
	EXEC msdb.dbo.sp_delete_job @jobId
END

-- Drop Job ExCoreODS if exists!
SELECT @jobId = job_id FROM msdb.dbo.sysjobs WHERE (name = N'Camstar Summary Tables (ExCoreODS)')
IF (@jobId IS NOT NULL)
BEGIN
	EXEC msdb.dbo.sp_delete_job @jobId
END

GO
USE [MASTER]
-- Drop Login
IF EXISTS 
    (SELECT name  
     FROM master.sys.server_principals
     WHERE name = 'ExCoreOLTPUser')
BEGIN
    DROP LOGIN ExCoreOLTPUser
END
IF EXISTS 
    (SELECT name  
     FROM master.sys.server_principals
     WHERE name = 'ExCoreODSUser')
BEGIN
    DROP LOGIN ExCoreODSUser
END

IF EXISTS (SELECT * FROM sys.servers WHERE name = N'CSILOOPBACK')
BEGIN
	EXEC master.dbo.sp_dropserver @server=N'CSILOOPBACK', @droplogins='droplogins'
END