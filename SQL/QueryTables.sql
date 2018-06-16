-- W1 Database
select name from CRONUS.sys.tables where name like '%$Book%'
select name from CRONUS.sys.tables where name like '%$Customer%'
select * from CRONUS.dbo.[CRONUS International Ltd_$Customer$dd8f0489-91f5-43e1-bb6c-e7d852f4eef3]

-- US Database
select name from FinancialsUS.sys.tables where name like '%$Book%'
select name from FinancialsUS.sys.tables where name like '%$Customer%'
select * from FinancialsUS.dbo.[CRONUS USA, Inc_$Customer$a0f38c90-8313-47ae-a0d1-cca576c782e5]
