-- Switch to the accountadmin role
use role accountadmin;

-- Create a new warehouse named dbt_wh with size 'x-small'
create warehouse dbt_wh with warehouse_size='x-small';

-- Create a new database named dbt_db if it does not exist
create database if not exists dbt_db;

-- Create a new role named dbt_role if it does not exist
create role if not exists dbt_role;

-- Show all the grants on the warehouse dbt_wh
show grants on warehouse dbt_wh;

-- Grant usage on the warehouse dbt_wh to the role dbt_role
grant usage on warehouse dbt_wh to role dbt_role;

-- Grant all privileges on the database dbt_db to the role dbt_role
grant all on database dbt_db to role dbt_role;

-- Grant the dbt_role to the user HAUCTDBT
grant role dbt_role to user hauctdbt;

-- Switch to the dbt_role
use role dbt_role;

-- Create a new schema named dbt_schema in the database dbt_db if it does not exist
create schema if not exists dbt_db.dbt_schema;

grant all on schema dbt_schema to role dbt_role;

--- ======================================================== -----
-- Switch back to the accountadmin role
use role accountadmin;

-- Drop the warehouse dbt_wh if it exists
drop warehouse if exists dbt_wh;

-- Drop the database dbt_db if it exists
drop database if exists dbt_db;

-- Drop the role dbt_role if it exists
drop role if exists dbt_role;