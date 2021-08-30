@NET STOP "Opcenter Connect MOM Channel Adapter Host"
@NET STOP "Opcenter Connect MOM Client Gateway"
@C:\Windows\System32\inetsrv\appcmd stop apppool /apppool.name:"MIO"
@REM C:\Windows\System32\inetsrv\appcmd stop apppool /apppool.name:"PcbApi AppPool"
@C:\Windows\System32\inetsrv\appcmd stop apppool /apppool.name:"CIOAppPool"
@REM @C:\Windows\System32\inetsrv\appcmd stop apppool /apppool.name:"CIO Router AppPool"
@C:\Windows\System32\inetsrv\appcmd stop apppool /apppool.name:"CIO Map AppPool"
@PAUSE