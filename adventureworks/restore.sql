use master;
go

RESTORE FILELISTONLY
FROM disk = 'AdventureWorks2017.bak';

restore database AdventureWorks2017
from disk = 'AdventureWorks2017.bak'
with
move 'AdventureWorks2017' to '/var/opt/mssql/data/aw2017.mdf',
move 'AdventureWorks2017_log' to '/var/opt/mssql/data/aw2017_log.ldf';
