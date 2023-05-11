@PING LicenseServer -n 1 | FIND /I "Reply from ">nul
@IF ERRORLEVEL 1 (
@ECHO LicenseServer could not be reached. Check Hosts file.
@PAUSE
@EXIT
)
@ECHO.

@C:\WINDOWS\system32\inetsrv\appcmd.exe list APPPOOL "CamstarAppServer" | findstr "Started" > ServersRunningCount.txt
@SET /P RAW=< ServersRunningCount.txt
@SET VALUE=%RAW%
@DEL ServersRunningCount.txt
@IF /I NOT "%VALUE%"=="" GOTO StartServices

:StartServices
@C:\Windows\System32\inetsrv\appcmd start apppool /apppool.name:"CamstarSecurityServices"
@C:\Windows\System32\inetsrv\appcmd start apppool /apppool.name:"CMSAdmin"
@C:\Windows\System32\inetsrv\appcmd start apppool /apppool.name:"CamstarAppServer"
@C:\Windows\System32\inetsrv\appcmd start apppool /apppool.name:"Camstar WCF Services"
@C:\Windows\System32\inetsrv\appcmd start apppool /apppool.name:"Portal"
@C:\Windows\System32\inetsrv\appcmd start apppool /apppool.name:"InlineSPC"
@C:\Windows\System32\inetsrv\appcmd start apppool /apppool.name:"Labels"
@C:\Windows\System32\inetsrv\appcmd start apppool /apppool.name:"Modeling"
@C:\Windows\System32\inetsrv\appcmd start apppool /apppool.name:"PcbApi AppPool"
@C:\Windows\System32\inetsrv\appcmd start apppool /apppool.name:"Query"
@C:\Windows\System32\inetsrv\appcmd start apppool /apppool.name:"Shopfloor"
@C:\Windows\System32\inetsrv\appcmd start apppool /apppool.name:"UMCAgent"
@NET STOP "Camstar Deployment Server"
@NET START "Camstar Notification Server"
@ECHO Starting ODS ...
@sqlcmd -s localhost\mssqlserver -U ExCoreODSUser -P ExCoreODSPass -Q "UPDATE DataStoreSetup SET Value = 'N' WHERE (Parameter = 'DATASTORE_TERMINATE' AND Value = 'Y') OR (Parameter = 'VERIFY_HOST' AND Value = 'Y')"

@ECHO.
@PAUSE
