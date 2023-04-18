Theme - Find Business Days Excluding Weekends and Public Holidays from the given data we have find number of days took to ticket close the ticket , given created date and resolved date of ticket
exclude business days and holidays , only we have to consider the business days to took to close the ticket.

# Insert Script 
create table tickets
(
ticket_id varchar(10),
create_date date,
resolved_date date
);
insert into tickets values
(1,'2022-08-01','2022-08-03')
,(2,'2022-08-01','2022-08-12')
,(3,'2022-08-01','2022-08-16');

create table holidays
(
holiday_date date
,reason varchar(100)
);
delete from holidays;
insert into holidays values
('2022-08-11','Rakhi'),('2022-08-15','Independence day');

Solution:

SELECT * ,
datediff(resolved_date , create_date)-2*(week(resolved_date)-week(create_date)) - no_of_holidays as actual_days
-- datediff(resolved_date , create_date) as days_diff
-- week(resolved_date)-week(create_date) as week_diff
FROM
(select ticket_id,create_date,resolved_date ,count(holiday_date) as no_of_holidays
from tickets
left join holidays on holiday_date between create_date 
and resolved_date
group by ticket_id,create_date,resolved_date) A




