-- Set the client encoding
SET client_encoding = 'UTF8';

-- Create the staging schema
CREATE SCHEMA IF NOT EXISTS staging;










CREATE TABLE IF NOT EXISTS staging.wealthAccountData
(Country_Name character varying(50)
,Country_Code character varying(50)
,Series_Name character varying(100)
,Series_Code character varying(50)
,"1995_[YR1995]" character varying(50)
,"1996_[YR1996]" character varying(50)
,"1997_[YR1997]" character varying(50)
,"1998_[YR1998]" character varying(50)
,"1999_[YR1999]" character varying(50)
,"2000_[YR2000]" character varying(50)
,"2001_[YR2001]" character varying(50)
,"2002_[YR2002]" character varying(50)
,"2003_[YR2003]" character varying(50)
,"2004_[YR2004]" character varying(50)
,"2005_[YR2005]" character varying(50)
,"2006_[YR2006]" character varying(50)
,"2007_[YR2007]" character varying(50)
,"2008_[YR2008]" character varying(50)
,"2009_[YR2009]" character varying(50)
,"2010_[YR2010]" character varying(50)
,"2011_[YR2011]" character varying(50)
,"2012_[YR2012]" character varying(50)
,"2013_[YR2013]" character varying(50)
,"2014_[YR2014]" character varying(50)
,"2015_[YR2015]" character varying(50)
,"2016_[YR2016]" character varying(50)
,"2017_[YR2017]" character varying(50)
,"2018_[YR2018]" character varying(50)
);

