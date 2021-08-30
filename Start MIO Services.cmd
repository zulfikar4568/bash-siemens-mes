@C:\Windows\System32\inetsrv\appcmd start apppool /apppool.name:"CIO Map AppPool"
@REM @C:\Windows\System32\inetsrv\appcmd start apppool /apppool.name:"CIO Router AppPool"
@C:\Windows\System32\inetsrv\appcmd start apppool /apppool.name:"CIOAppPool"
@C:\Windows\System32\inetsrv\appcmd start apppool /apppool.name:"MIO"
@REM C:\Windows\System32\inetsrv\appcmd start apppool /apppool.name:"PcbApi AppPool"
@NET START "Opcenter Connect MOM Channel Adapter Host"
@NET START "Opcenter Connect MOM Client Gateway"
@PAUSE