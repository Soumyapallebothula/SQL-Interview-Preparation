Qns :
Assume you're given the tables below about Facebook Page and Page likes (as in "Like a Facebook Page").
Write a query to return the IDs of the Facebook pages which do not possess any likes. The output should be sorted in ascending order.

[Qns Link](https://datalemur.com/questions/sql-page-with-no-likes)

pages Table:

| Column Name | Type    |
| ----------- | ------- |
| page_id     | integer |
| page_name   | varchar |

Examples Input : pages Table

| page_id | page_name             |
| ------- | ----------------------|
| 20001   | SQL Solutions         |
| 20045   | Brain Exercises       |
| 20701   | Tips for Data Analysts|

page_likes Table:

| Column Name | Type     |
| ----------- | -------- |
| user_id     | integer  |
| page_id     | integer  |
| liked_date  | datetime |

page_likes Example Input:

| user_id | page_id | liked_date           |
| ------- | ------- | ---------------------|
| 111     | 20001   | 04/08/2022 00:00:00  |
| 121     | 20045   | 03/12/2022 00:00:00  |
| 156     | 20001   | 07/25/2022 00:00:00  |

Output:
| page_id |
| ------- |
| 20701   |

```sql
#1
select page_id from pages p left join page_likes pl using (page_id)
where liked_date is null
order by page_id asc

#2
SELECT page_id
FROM pages
WHERE page_id NOT IN (
  SELECT DISTINCT page_id
  FROM page_likes
);
