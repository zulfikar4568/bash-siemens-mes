-- Drop unique indices
DECLARE @cmd VARCHAR(1000);
DECLARE DropIndexCursor CURSOR for
SELECT
	'DROP INDEX ' + o.name + '.' + i.name cmd
FROM
	sys.indexes i
	INNER JOIN sys.objects o ON o.object_id=i.object_id and o.type_desc='USER_TABLE'
	LEFT JOIN sys.key_constraints c ON c.parent_object_id=i.object_id and c.unique_index_id=i.index_id
WHERE
	schema_id()=o.schema_id
	AND i.is_unique=1
	AND c.type is null
OPEN DropIndexCursor
FETCH NEXT FROM DropIndexCursor INTO @cmd
WHILE @@FETCH_STATUS = 0
BEGIN
	EXEC(@cmd)
	FETCH NEXT FROM DropIndexCursor INTO @cmd
END
DEALLOCATE DropIndexCursor