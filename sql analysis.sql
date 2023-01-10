Create Table International_breweries(
Sales_id int,
Sales_rep Varchar (255),
Emails varchar(255),
Brands varchar(255),
Plant_cost decimal(10,2),
Unit_price decimal(10,2),
Quantity decimal(10,2),
Cost decimal(10,2),
Profit decimal(10,2),
Countries varchar (255),
Region varchar(255),
Months varchar(255),
Years int,
Primary key (Sales_id)
);
--view the whole dataset
select * from international_breweries;

--section A: Profit analysis
/*1. Within the space of the last three years, what was the profit worth of the breweries,
inclusive of the anglophone and the francophone territories*/

select sum(Profit) from International_breweries;

 /*2. Compare the total profit between these two territories in order for the territory manager,
Mr. Stone made a strategic decision that will aid profit maximization in 2020*/

 select distinct countries from International_breweries;
 
 select sum(profit) AS Anglophone_profit from International_breweries
 where countries IN ('Nigeria','Ghana');
 
 select sum(profit) as Francophone_profit from International_breweries
 where countries in ('Togo','Benin','Senegal');
 
/*3  Country that generated the highest profit in 2019*/
select countries, max(profit) as highest_profit_generated
from International_breweries where years =2019
group by countries
order by max(profit) DESC
limit 1;

/*4. Help him find the year with the highest profit.*/
 select years, max(profit) as highest_profit
from International_breweries 
group by years
order by max(profit) DESC
limit 1;

/*5.Which month in the three years was the least profit generated*/
select months, min(profit) as least_profit
from International_breweries
group by months
order by min(profit)DESC
limit 1;

/*6.What was the minimum profit in the month of December 2018?*/
select min(profit) from International_breweries
where Months = 'December' and Years = '2018';

/*7. Compare the profit in percentage for each of the month in 2019*/
select months, Round(sum(profit) * 0.01) as Profit_Percentage
from International_breweries
where years = 2019
group by months
order by percentage;

/*8.Which particular brand generated the highest profit in Senegal?*/
select Brands, max(profit)as highest_profit
from International_breweries where Countries = 'Senegal'
group by brands
order by max(profit)desc
limit 1;

--Section B: Brand Analysis
/*1.Within the last two years, the brand manager wants to know the top three brands
consumed in the francophone countries*/ 
select brands, sum(Quantity)
from International_breweries 
where years in (2019, 2018)and countries in ('Togo','Benin','Senegal')
group by brands
order by sum(Quantity) DESC
limit 3;

/*2.Find out the top two choice of consumer brands in Ghana*/
select brands, sum(Quantity)
from International_breweries 
where countries = 'Ghana'
group by brands
order by sum(Quantity) DESC
limit 2;

/*3.Find out the details of beers consumed in the past three years in the most oil reached
country in West Africa.*/ 
select brands, sum(quantity) as quantity, sum(profit) as profit
from International_breweries where years in (2017, 2018,2019) and 
countries = 'Nigeria'
group by brands;

/*4. Favorites malt brand in Anglophone region between 2018 and 2019*/
--To view the different brands in the data set
select  distinct brands from International_breweries;

select brands, sum(quantity) 
from International_breweries where years in (2018,2019)
and countries in ('Ghana','Nigeria') and 
brands in ('Beta Malt','Grand Malt')
group by brands;

/*5.Which brands sold the highest in 2019 in Nigeria?*/
select brands, sum(quantity) as quantity_sold
from International_breweries
where years = 2019 and countries = 'Nigeria'
group by brands
order by sum(quantity) desc;

/*6.Favorites brand in South_South region in Nigeria*/
select brands, sum(quantity) as quantity_sold
from International_breweries
where region = 'Southsouth' and countries = 'Nigeria'
group by brands
order by sum(quantity)desc;

/*7.Beer consumption in Nigeria*/
select brands, sum(quantity) as Total_beer_consumed
from International_breweries
where countries = 'Nigeria' and 
brands in ('Eagle Lager', 'Trophy', 'Hero', 'Budweiser', 'Castle Lite')
group by brands
order by sum(quantity)desc;

/*8.Level of consumption of Budweiser in the regions in Nigeria*/
select brands, sum(quantity)as Budweiser_consumption
from International_breweries
where countries = 'Nigeria' and brands = 'Budweiser'
group by brands
order by sum(quantity);

/*9.Level of consumption of Budweiser in the regions in Nigeria in 2019 (Decision on Promo)*/
select region, sum(quantity)
from International_breweries
where countries = 'Nigeria' and years = 2019 and brands = 'Budweiser'
group by region;

--Section C: Countries Analysis
/*1.Country with the highest consumption of beer*/
Select countries,sum(quantity)as amount_consumed
from International_breweries
where brands in ('Eagle Lager', 'Trophy', 'Hero', 'Budweiser', 'Castle Lite')
group by countries
order by sum(quantity);

/*2.Highest sales personnel of Budweiser in Senegal*/
select Sales_rep, sum(quantity) 
from International_breweries
where brands = 'Budweiser' and countries = 'Senegal'
group by Sales_rep
order by sum(quantity)DESC
limit 1;

/*3.Country with the highest profit of the fourth quarter in 2019*/
select countries, sum(profit) as highest_profit
from International_breweries
where years = 2019 and months in ('October','November','December')
group by countries
order by sum(profit) desc
limit 1;



