USE [OpExODS]
GO
ALTER USER [OpExODSUser] WITH DEFAULT_SCHEMA=[OpExODSSchema];
GO
GRANT ALTER, ALTER ANY SCHEMA, AUTHENTICATE, BACKUP DATABASE, BACKUP LOG, CHECKPOINT,
CONNECT, CONTROL, CREATE DEFAULT, CREATE FUNCTION, CREATE PROCEDURE, CREATE SCHEMA,
CREATE SYNONYM, CREATE TABLE, CREATE TYPE, CREATE VIEW, DELETE, EXECUTE, INSERT,
REFERENCES, SELECT, SHOWPLAN, TAKE OWNERSHIP, UPDATE, VIEW DATABASE STATE, VIEW DEFINITION
TO [OpExODSUser];
GO