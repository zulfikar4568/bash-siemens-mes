-- To see the Configuration of ODS and the Status ON or OFF
Select * from OpExODSSchema.DataStoreSetup

-- To see what the log of ODS, for example if ODS suddenly stopped we can check on the log
Select * from OpExODSSchema.DataStoreLog 

/* To See the last execution of 
	OpExOLTPSchema.DataStoreInserts1Master, 
	OpExOLTPSchema.DataStoreInserts2Master, 
	OpExOLTPSchema.DataStoreUpdatesMaster, 
if the ProcessId it's different with ID on DataStore OLTP than condition of OLTP and ODS Out Of Sync */
Select * from OpExODSSchema.DataStoreSessionTracking

/*
To See what the Missing ID that not available on
	OpExOLTPSchema.DataStoreInserts1Master, 
	OpExOLTPSchema.DataStoreInserts2Master, 
	OpExOLTPSchema.DataStoreUpdatesMaster, 
*/
Select * from OpExODSSchema.DataStoreMissingTxns

-- To See what error that happened on ODS
Select * from OpExODSSchema.DataStoreErrors


-- To run ODS
UPDATE OpExODSSchema.DataStoreSetup SET VALUE = 'N' WHERE Parameter = 'DATASTORE_TERMINATE'