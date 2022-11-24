--inspecting data
select*
from `first-project-355119.customer_sales.purchase_sales`

--checking for unique values
select distinct status
from `first-project-355119.customer_sales.purchase_sales`

select distinct year_id
from `first-project-355119.customer_sales.purchase_sales`

select year_id
from `first-project-355119.customer_sales.purchase_sales`
group by year_id

select distinct PRODUCTLINE 
from `first-project-355119.customer_sales.purchase_sales` ---Nice to plot

select distinct country 
from `first-project-355119.customer_sales.purchase_sales` ---Nice to plot

select distinct dealsize 
from `first-project-355119.customer_sales.purchase_sales` ---Nice to plot

select distinct territory 
from `first-project-355119.customer_sales.purchase_sales` ---Nice to plot

--checking for specific month
select distinct MONTH_ID
from `first-project-355119.customer_sales.purchase_sales`
where year_id=2003

--USING SQL TO ANALYZE
--i start by grouping sales by the productline
select productline, sum(sales) Revenue
from `first-project-355119.customer_sales.purchase_sales`
group by productline
order by 2 desc

--for year and grouping
select year_id, sum(sales) as Revenue
from `first-project-355119.customer_sales.purchase_sales`
group by YEAR_ID
order by 2 desc

--for deal size
select dealsize, sum(sales) as Revenue
from `first-project-355119.customer_sales.purchase_sales`
group by DEALSIZE
order by 2 desc

--finding the best month for sales in a specific year and how much earned that month
select month_id, sum(sales) as Revenue
from `first-project-355119.customer_sales.purchase_sales`
where year_id=2004
group by month_id
order by 2 desc

select  MONTH_ID, sum(sales) Revenue, count(ORDERNUMBER) Frequency
from `first-project-355119.customer_sales.purchase_sales`
where YEAR_ID = 2004 --change year to see the rest
group by  MONTH_ID
order by 2 desc

--in this case, november is the month (what do they sell in november)
select productline, sum(sales) Revenue, count(ordernumber) frequency
from `first-project-355119.customer_sales.purchase_sales`
where year_id=2004 and month_id=11
group by productline
order by 2 desc

--what is the best product in the united states
select country, year_id, productline, sum(sales) Revenue
from `first-project-355119.customer_sales.purchase_sales`
where country="USA"
group by productline, year_id, country
order by 4 desc

--which city has the highest sales in a single country
select city, sum(sales) as Revenue
from `first-project-355119.customer_sales.purchase_sales`
where country="Canada"
group by city
order by 2 desc




--who is the best customer(answered with RFM)recency frequency monetary
select 
		CUSTOMERNAME, 
		sum(sales) MonetaryValue,
		avg(sales) AvgMonetaryValue,
		count(ORDERNUMBER) Frequency,
		max(ORDERDATE) last_order_date,
		(select max(ORDERDATE) from `first-project-355119.customer_sales.purchase_sales`) max_order_date ,
		DATE_DIFF(max(ORDERDATE), (select max(ORDERDATE) from `first-project-355119.customer_sales.purchase_sales`), DAY) Recency
	from `first-project-355119.customer_sales.purchase_sales`
	group by CUSTOMERNAME