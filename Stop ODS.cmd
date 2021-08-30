@sqlcmd -s localhost\mssqlserver -U ExCoreODSUser -P ExCoreODSPass -Q "UPDATE DataStoreSetup SET Value = 'Y' WHERE Parameter = 'DATASTORE_TERMINATE' AND Value = 'N'"
@ECHO.

@sqlcmd -s localhost\mssqlserver -U ExCoreODSUser -P ExCoreODSPass -Q "SELECT CAST(Parameter + ' = ' + Value AS NVARCHAR) Settings FROM DataStoreSetup"
@ECHO.

@sqlcmd -s localhost\mssqlserver -U ExCoreOLTPUser -P ExCoreOLTPPass -Q "SELECT CAST('INSERTS1 = ' + CAST((SELECT COUNT(*) FROM DataStoreInserts1) AS VARCHAR) + ', INSERT2 = ' + CAST((SELECT COUNT(*) FROM DataStoreInserts2) AS VARCHAR) + ', UPDATES = ' + CAST((SELECT COUNT(*) FROM DataStoreUpdates) AS VARCHAR) AS VARCHAR(50)) OutstandingRecords"
@PAUSE