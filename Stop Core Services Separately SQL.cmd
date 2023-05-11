@C:\Windows\System32\inetsrv\appcmd stop apppool /apppool.name:"CMSAdmin"
@C:\Windows\System32\inetsrv\appcmd stop apppool /apppool.name:"CamstarAppServer"
@C:\Windows\System32\inetsrv\appcmd stop apppool /apppool.name:"Camstar WCF Services"
@C:\Windows\System32\inetsrv\appcmd stop apppool /apppool.name:"Portal"
@C:\Windows\System32\inetsrv\appcmd stop apppool /apppool.name:"InlineSPC"
@C:\Windows\System32\inetsrv\appcmd stop apppool /apppool.name:"Labels"
@C:\Windows\System32\inetsrv\appcmd stop apppool /apppool.name:"Modeling"
@C:\Windows\System32\inetsrv\appcmd stop apppool /apppool.name:"PcbApi AppPool"
@C:\Windows\System32\inetsrv\appcmd stop apppool /apppool.name:"Query"
@C:\Windows\System32\inetsrv\appcmd stop apppool /apppool.name:"Shopfloor"
@C:\Windows\System32\inetsrv\appcmd stop apppool /apppool.name:"UMCAgent"
@NET STOP "Camstar Notification Server"
@NET STOP "Camstar Deployment Server"

@SET /P INPUT1="Do you want to stop Security Server & Security LM Server (Y/N)?: "
@IF /I "%INPUT1%"=="y" GOTO StopSecurityServers
@IF /I "%INPUT1%"=="" GOTO StopSecurityServers
@IF /I NOT "%INPUT1%"=="y" GOTO AskForODS

:StopSecurityServers
@ECHO.
@C:\Windows\System32\inetsrv\appcmd stop apppool /apppool.name:"CamstarSecurityServices"

:EndOfScript
@ECHO.
@PAUSE
