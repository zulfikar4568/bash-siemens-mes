-- Run 2 times. First time may have errors.
USE [OpExODS]
GO
DECLARE @cmd VARCHAR(1000);
DECLARE RenameCursor CURSOR for
SELECT
	'ALTER SCHEMA OpExODSSchema TRANSFER ' + s.name + '.' + o.name cmd
FROM
	sys.objects o INNER JOIN sys.schemas s ON s.schema_id = o.schema_id
WHERE
	s.name = 'OpExOLTPSchema';
OPEN RenameCursor
FETCH NEXT FROM RenameCursor INTO @cmd
WHILE @@FETCH_STATUS = 0
BEGIN
	EXEC(@cmd)
	FETCH NEXT FROM RenameCursor INTO @cmd
END
CLOSE RenameCursor
DEALLOCATE RenameCursor
GO
-- DROP SCHEMA OpExOLTPSchema – optional, can be done later if required