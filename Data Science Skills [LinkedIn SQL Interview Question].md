Qns:
Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job. 
You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.Write a query to list the candidates who possess 
all of the required skills for the job. Sort the output by candidate ID in ascending order

[QNS LINK](https://datalemur.com/questions/matching-skills)

Assumption: There are no duplicates in the candidates table.

---------------------------------------
| Column Name      | Type             | 
| ---------------- | ---------------- | 
| candidate_id     | integer          | 
| skill            | varchar          | 
---------------------------------------
Input:
-----------------------------
| candidate_id | skill      |
| ------------ | -----------|
| 123          | Python     |
| 123          | Tableau    |
| 123          | PostgreSQL |
| 234          | R          |
| 234          | PowerBI    |
| 234          | SQL Server |
| 345          | Python     |
| 345          | Tableau    |
-----------------------------

Output:

---------------
| candidate_id |
| ------------ |
| 123          |
----------------

Solution:


```sql
#1
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id;

#2
SELECT candidate_id
  FROM candidates
  GROUP BY candidate_id
  HAVING SUM(CASE skill
            WHEN 'Python' THEN 1 
            WHEN 'Tableau' THEN 1 
            WHEN 'PostgreSQL' THEN 1 
            ELSE 0
          END)=3
  ORDER BY candidate_id ASC;

```

