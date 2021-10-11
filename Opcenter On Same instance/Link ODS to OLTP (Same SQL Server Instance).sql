USE [master]
EXEC master.dbo.sp_addlinkedserver @server = N'CSILOOPBACK', @srvproduct=N' ', @provider=N'SQLNCLI'
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'CSILOOPBACK', @useself=N'True', @locallogin=NULL, @rmtuser=NULL, @rmtpassword=NULL
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'CSILOOPBACK', @useself=N'False', @locallogin=N'ExCoreODSUser', @rmtuser=N'ExCoreODSUser', @rmtpassword=N'ExCoreODSPass'
GO
EXEC master.dbo.sp_serveroption @server=N'CSILOOPBACK', @optname=N'rpc', @optvalue=N'true'
EXEC master.dbo.sp_serveroption @server=N'CSILOOPBACK', @optname=N'rpc out', @optvalue=N'true'
EXEC master.dbo.sp_serveroption @server=N'CSILOOPBACK', @optname=N'remote proc transaction promotion', @optvalue=N'false'
GO
USE [msdb]
ALTER DATABASE [ExCoreODS] SET AUTO_UPDATE_STATISTICS_ASYNC ON
GO
-- Allow ODS to access OLTP database (for same SQL Server instance)
USE [ExCoreOLTP]
CREATE USER [ExCoreODSUser] FOR LOGIN [ExCoreODSUser]
ALTER USER [ExCoreODSUser] WITH DEFAULT_SCHEMA=[ExCoreOLTP]
GRANT CONNECT, DELETE, SELECT, UPDATE TO [ExCoreODSUser]
GO