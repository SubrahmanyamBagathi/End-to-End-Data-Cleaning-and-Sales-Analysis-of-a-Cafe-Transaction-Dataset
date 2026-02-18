use subbu;

show tables;

select * from dirty_cafe_sales;

desc dirty_cafe_sales;

delimiter $
create procedure dirty()
begin
select * from dirty_cafe_sales;
end $
delimiter ;

call dirty;

ALTER TABLE dirty_cafe_sales
CHANGE COLUMN `Transaction ID` transaction_id TEXT;

ALTER TABLE dirty_cafe_sales
CHANGE COLUMN `Price Per Unit` price_per_unit DOUBLE;

ALTER TABLE dirty_cafe_sales
CHANGE COLUMN `Total Spent` total_spent text;

ALTER TABLE dirty_cafe_sales
CHANGE COLUMN `Payment Method` payment_method text;

ALTER TABLE dirty_cafe_sales
CHANGE COLUMN `Transaction Date` Transaction_date text;

call dirty;

ALTER TABLE dirty_cafe_sales modify transaction_id varchar(50) primary key;	

select transaction_id , count(*) from dirty_cafe_sales 
group by transaction_id having count(*) > 1;

select distinct item from dirty_cafe_sales;

set sql_safe_updates = 0;
update dirty_cafe_sales 
set item= concat(upper(left('item',1)), lower(substr('item',2)));

rollback;






