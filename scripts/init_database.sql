/*
CREATE DATABASE AND SCHEMAS


warning:
	Running this script will delete the entire 'DataWarehouse' database if exist

*/

use master;
go

-- Drop and recreate the 'DataWarehouse' database

if exists (select 1 from sys.databases where name = 'DataWarehouse')
begin
	alter database DataWarehouse set single_user with rollback immediate;
	drop database DataWarehouse;
end;
go

-- Create and use the 'DataWarehouse' database

create database DataWarehouse;
go

use DataWarehouse;
go

-- Create Schema

create schema bronze;
go

create schema silver;
go

create schema gold;
go
