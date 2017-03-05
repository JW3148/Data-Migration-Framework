declare @dbName varchar(50)='ADE'
declare @spName varchar(200)='usp_abc.sql'
declare @cmdString varchar(max)

set @cmdString='sqlcmd -S %1 -d '+@dbName+' -i '+@spName+' -E'
print @cmdString 

