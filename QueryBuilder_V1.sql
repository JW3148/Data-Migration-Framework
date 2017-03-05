
declare @tableName  varchar(100)
declare @dbName		varchar(100)
declare @sqlString  varchar(max)
set @dbName    = 'XXX'
set @tableName = 'XXXX'

/*

select 'select'
union all
(select 'count(distinct '+COLUMN_NAME+') as '+COLUMN_NAME+','  from Act_Detailed_Experience.INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='Large_Accounts_PriceMonitor_AB_View_1_table'
and TABLE_SCHEMA='dbo' 
and DATA_TYPE in ('varchar', 'int','datetime','char','smallint','date')) 
union all
(select 'sum('+COLUMN_NAME+') as '+COLUMN_NAME+','  from Act_Detailed_Experience.INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='Large_Accounts_PriceMonitor_AB_View_1_table'
and TABLE_SCHEMA='dbo' 
and DATA_TYPE not in ('varchar', 'int','datetime','char','smallint','date'))
union all
select 'from Act_Detailed_Experience.dbo.Large_Accounts_PriceMonitor_AB_View_1_table'
*/
set @sqlString=
'select * into #test from (select ''select'' as col
union all
(select ''count(distinct ''+COLUMN_NAME+'') as ''+COLUMN_NAME+'',''  as col from '+@dbName+'.INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='''+@tableName+'''
and TABLE_SCHEMA=''dbo'' 
and DATA_TYPE in (''varchar'', ''int'',''bigint'',''datetime'',''char'',''smallint'',''date'',''time'',''nvarchar'',''nchar'',''datetime2'')) 
union all
(select ''sum(''+COLUMN_NAME+'') as ''+COLUMN_NAME+'',''  as col from '+@dbName+'.INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='''+@tableName+'''
and TABLE_SCHEMA=''dbo'' 
and DATA_TYPE not in (''varchar'', ''int'',''bigint'',''datetime'',''char'',''smallint'',''date'',''time'',''nvarchar'',''nchar'',''datetime2''))
union all
select ''from '+@dbName+'.dbo.'+@tableName+''') a '

print @sqlString
exec (@sqlString)

sp_executesql @sql


execute sp_executesql @sqlstring,N'@Inforce_Date nvarchar(10), @cnt int output', @inforce_date=@inforce_date,@cnt=@count output