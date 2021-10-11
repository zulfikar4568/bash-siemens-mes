USE [MASTER]
CREATE DATABASE ExCoreOLTP;
ALTER DATABASE ExCoreOLTP SET RECOVERY SIMPLE;
CREATE LOGIN ExCoreOLTPUser WITH PASSWORD = 'ExCoreOLTPPass', DEFAULT_DATABASE = [ExCoreOLTP], DEFAULT_LANGUAGE = ENGLISH, CHECK_EXPIRATION = OFF, CHECK_POLICY = OFF;
GO
USE [ExCoreOLTP]
CREATE USER [ExCoreOLTPUser] FOR LOGIN [ExCoreOLTPUser];
GO
CREATE SCHEMA [ExCoreOLTPSchema] AUTHORIZATION [ExCoreOLTPUser];
GO
ALTER USER [ExCoreOLTPUser] WITH DEFAULT_SCHEMA=[ExCoreOLTPSchema];
GO
GRANT ALTER, ALTER ANY SCHEMA, AUTHENTICATE, BACKUP DATABASE, BACKUP LOG, CHECKPOINT, CONNECT, CONTROL, CREATE DEFAULT, CREATE FUNCTION, CREATE PROCEDURE, CREATE SCHEMA, CREATE SYNONYM, CREATE TABLE, CREATE TYPE, CREATE VIEW, DELETE, EXECUTE, INSERT, REFERENCES, SELECT, SHOWPLAN, TAKE OWNERSHIP, UPDATE, VIEW DATABASE STATE, VIEW DEFINITION TO [ExCoreOLTPUser];
GO
USE [msdb]
CREATE USER [ExCoreOLTPUser] FOR LOGIN [ExCoreOLTPUser]
ALTER USER [ExCoreOLTPUser] WITH DEFAULT_SCHEMA=[dbo]
ALTER ROLE [SQLAgentUserRole] ADD MEMBER [ExCoreOLTPUser]
GRANT SELECT ON msdb.[dbo].[sysjobs] TO [ExCoreOLTPUser]
GRANT SELECT ON msdb.[dbo].[sysjobs_view] TO [ExCoreOLTPUser]
GRANT SELECT ON msdb.[dbo].[sysjobhistory] TO [ExCoreOLTPUser]
GRANT SELECT ON msdb.[dbo].[sysjobactivity] TO [ExCoreOLTPUser]
GO