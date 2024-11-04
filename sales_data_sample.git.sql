create database sales_data ;
use sales_data ;

select * from sales_data_sample ;

# ps1) Find all unique values in status column
select distinct(status) from sales_data_sample ;

# ps2) Find all the count from each status in descending order
select status , count(status) from sales_data_sample 
group by 1 
order by 2;

# ps3) which productline having the max sales in descending order
select PRODUCTLINE , max(SALES) from sales_data_sample 
group by 1
order by 2 ;

# ps4) which country giving the max sales
select COUNTRY , max(SALES) from sales_data_sample 
group by 1 ;

# ps5) which city , country in 'USA' giving the max sales using descending 
select CITY , COUNTRY , max(sales) from sales_data_sample 
where COUNTRY = 'USA' 
group by 1 
order by 3 ;

# ps6) which productline giving max cancellation 
select PRODUCTLINE , count(STATUS) from sales_data_sample 
where STATUS = 'cancelled' 
group by 1
order by 2 desc ;

# ps7) Find out the max sales and min sales from sales_data_sample 
select max(sales) , min(sales) from sales_data_sample ;

# ps8) find if sales is less than or equal to 5000 ===> low
#           if sales is more than 5000 or less than or equal to 10000 ==> medium
#           if more than 10000 then ==> high 
#           new column as ==> sales_category
select sales ,
	  case 
            when sales < 5000 then 'low'
	        when sales > 5000 or sales <= 10000 then 'medium' 
	        else  'high'
	  end as sales_category  # giving the new name
      from  sales_data_sample ;

# ps9) find if quantityorder is less then 10 then it low
#           greater than 10 and less than 30 then medium 
#           greater than 30 to 50 then high 
#           greater than 50 very high
select QUANTITYORDERED ,
	  case 
            when QUANTITYORDERED <= 10 then 'low'
	        when QUANTITYORDERED > 10 and QUANTITYORDERED <= 30 then 'medium' 
            when QUANTITYORDERED > 30 and QUANTITYORDERED <= 50 then 'high'
	        else  'very_high'
		 end as QUANTITY_ORDERED
         from  sales_data_sample ;

# ps10) find the year , sum sales and avg sales ad group by on year round it
select YEAR_ID , round(sum(SALES)) as tot_sales , round(avg(SALES)) from sales_data_sample
group by 1 ;

# ps11) find the year , productline , sum sales and avg sales round it add groupp by on year and productline
select YEAR_ID , PRODUCTLINE, round(sum(SALES)) as tot_sales , round(avg(SALES)) from sales_data_sample
group by 1 , 2 ;

# ps12) write a query which selects record when status is cancellecd, onhold , disputed, resolved
select * from sales_data_sample
where status in ('cancelled' , 'onhold' , 'disputed' , 'resolved' ) ;















