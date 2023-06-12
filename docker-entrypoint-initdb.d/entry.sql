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

CREATE TABLE IF NOT EXISTS staging.wealthAccountCountry
(Code character varying(10)
,Long_Name character varying(50)
,Income_Group character varying(50)
,Region character varying(50)
,Lending_Category character varying(50)
,Other_Groups character varying(50)
,Currency_Unit character varying(10)
,Latest_Population_Census character varying(100)
,Latest_Household_Survey character varying(50)
,Special_Notes character varying(250)
,National_Accounts_Base year character varying(70)
,National_Accounts_Reference_Year character varying(10)
,System_Of_National_Accounts character varying(50)
,SNA_Price_Valuation character varying(50)
,Alternative_Conversion_Factor character varying(50)
,PPP_Survey_Years character varying(20)
,Balance_Of_Payments_Manual_In _Use character varying(50)
,External_Debt_Reporting_Status character varying(20)
,System_Of_Trade character varying(20)
,Government_Accounting_Concept character varying(50)
,IMF_Data_Dissemination_Standard character varying(70)
,Source_Of_Most_Recent_Income_And_Expenditure_Data character varying(50)
,Vital_Registration_Complete character varying(5)
,Latest_Agricultural_Census character varying(200)
,Latest_Industrial_Data character varying(10)
,Latest_Trade_Data character varying(10)
,Latest_Water_Withdrawal_Data character varying(10)
,"2-Alpha_Code" character varying(2)
,Table_Name character varying(20)
,Short_Name character varying(20)
)

CREATE TABLE IF NOT EXISTS staging.wealthAccountSeries
(Code character varying(10)
,Indicator_Name character varying(50)
,Long_Definition character varying(250)
,Source character varying(250)
,Topic character varying(20)
,unit_Of_Measure character varying(20)
,Periodicity character varying(10)
,Reference_Period character varying(20)
,Statistical_Concept_And_Methodology character varying(250)
,Previous_Indicator_Code character varying(20)
,Previous_Indicator_Name character varying(25)
)

