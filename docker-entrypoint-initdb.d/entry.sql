SET client_encoding = 'UTF8';

USE master;
go

DROP DATABASE if exists WealthDB;
go;

CREATE DATABASE WealthDB;
go;

USE WealthDB;
go;


CREATE SCHEMA staging;


COMMENT ON DATABASE WealthDB
    IS '';



/** DROP TABLE if exists staging.customers cascade;



CREATE TABLE IF NOT EXISTS staging.customers
()
**/