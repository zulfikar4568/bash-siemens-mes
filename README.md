# Using PowerShell Windows

## 1. Get all command on Server Manager
```
Get-Command -module ServerManager
```
## 2. Check the feature has been installed
```
Get-WindowsFeature | Where installed
```

## 3. Check All list the Feature
```
Get-WindowsFeature
```

## 4. Get list feature in certain feature
```
Get-WindowsFeature FileAndStorage-Services
```

## 5. Install Dependencies feature for MES SIEMENS
```
 Add-WindowsFeature FileAndStorage-Services, Storage-Services,  Web-Server,  Web-WebServer, Web-Common-Http, Web-Default-Doc, Web-Dir-Browsing, Web-Http-Errors, Web-Static-Content, Web-Http-Redirect, Web-DAV-Publishing, Web-Health, Web-Custom-Logging, Web-Log-Libraries, Web-ODBC-Logging, Web-Request-Monitor, Web-Http-Tracing, Web-Performance, Web-Stat-Compression, Web-Dyn-Compression, Web-Security, Web-Filtering, Web-Digest-Auth, Web-Url-Auth, Web-Windows-Auth, Web-App-Dev, Web-Net-Ext45, Web-AppInit, Web-Asp-Net45,  Web-ISAPI-Ext, Web-ISAPI-Filter, Web-Includes, Web-Mgmt-Tools, Web-Mgmt-Console, Web-Mgmt-Compat, Web-Metabase, Web-Lgcy-Mgmt-Console, Web-Scripting-Tools, NET-Framework-45-Features,  NET-Framework-45-Core, NET-Framework-45-ASPNET, NET-WCF-Services45, NET-WCF-HTTP-Activation45, NET-WCF-MSMQ-Activation45, NET-WCF-Pipe-Activation45, NET-WCF-TCP-Activation45, NET-WCF-TCP-PortSharing45, MSMQ, MSMQ-Services, MSMQ-Server, FS-SMB1,PowerShellRoot, PowerShell, PowerShell-ISE, WAS, WAS-Process-Model, WAS-Config-APIs, WoW64-Support
```

### Opcenter 2210
```
 Add-WindowsFeature FileAndStorage-Services, Storage-Services,
 Web-Server,  
 Web-WebServer, 
 Web-Common-Http, Web-Default-Doc, Web-Dir-Browsing, Web-Http-Errors, Web-Static-Content, Web-Http-Redirect, Web-DAV-Publishing, 
 Web-Health, 
 Web-Http-Logging, Web-Custom-Logging, Web-Log-Libraries, Web-ODBC-Logging, Web-Request-Monitor, Web-Http-Tracing, 
 Web-Performance, 
 Web-Stat-Compression, Web-Dyn-Compression, 
 Web-Security, 
 Web-Filtering, Web-Digest-Auth, Web-Url-Auth, Web-Windows-Auth, 
 Web-App-Dev, 
 Web-Net-Ext45, Web-AppInit, Web-Asp-Net45,  Web-ISAPI-Ext, Web-ISAPI-Filter, Web-Includes, 
 Web-Mgmt-Tools, 
 Web-Mgmt-Console, Web-Mgmt-Compat, 
 Web-Metabase, Web-Lgcy-Mgmt-Console, 
 Web-Scripting-Tools, Web-Mgmt-Service,
 NET-Framework-Features,
 NET-Framework-Core,
 NET-Framework-45-Features,  
 NET-Framework-45-Core, NET-Framework-45-ASPNET, 
 NET-WCF-Services45, 
 NET-WCF-HTTP-Activation45, NET-WCF-MSMQ-Activation45, NET-WCF-Pipe-Activation45, NET-WCF-TCP-Activation45, NET-WCF-TCP-PortSharing45, 
 MSMQ, 
 MSMQ-Services, 
 MSMQ-Server, 
 FS-SMB1,
 PowerShellRoot, 
 PowerShell, PowerShell-V2, PowerShell-ISE, 
 WAS, 
 WAS-Process-Model, WAS-Config-APIs, 
 WoW64-Support
```

## 6. Restart Computer
```
Restart-Computer
```
