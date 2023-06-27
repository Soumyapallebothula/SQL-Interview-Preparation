
Question: 

Write an SQL query to show the second most recent activity of each user.
If the user only has one activity, return that one. A user cannot perform more than one activity at the
same time.
Return the result table in any order

Input Table: activities table

| username | activity | start_date  | end_date    |
|----------|----------|-------------|-------------|
| Alice    | Travel   | 2020-02-12  | 2020-02-20  |
| Alice    | Dancing  | 2020-02-21  | 2020-02-23  |
| Alice    | Travel   | 2020-02-24  | 2020-02-28  |
| Bob      | Travel   | 2020-02-11  | 2020-02-18  |


DDL & DML
```SQL
--DDL:
CREATE TABLE activities (
    username VARCHAR(255),
    activity VARCHAR(255),
    start_date DATE,
    end_date DATE
);

--DML:
INSERT INTO activities (username, activity, start_date, end_date)
VALUES ('Alice', 'Travel', '2020-02-12', '2020-02-20');

INSERT INTO activities (username, activity, start_date, end_date)
VALUES ('Alice', 'Dancing', '2020-02-21', '2020-02-23');

INSERT INTO activities (username, activity, start_date, end_date)
VALUES ('Alice', 'Travel', '2020-02-24', '2020-02-28');

INSERT INTO activities (username, activity, start_date, end_date)
VALUES ('Bob', 'Travel', '2020-02-11', '2020-02-18');

```


```SQL
--Solution:
with cte as (select distinct * from activities),

cte2 as (select *, rank() over (partition by username order by start_date desc) as rnk,
count(activity) over(partition by username) as num_of_activity
from cte)

select username,activity,start_date,end_date from cte2
where rnk = 2 or num_of_activity =1
```

