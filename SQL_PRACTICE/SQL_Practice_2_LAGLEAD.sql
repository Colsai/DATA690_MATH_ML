'''
Sep 22, 2021

DEFINE TABLE electricity_use(date: DATE, usage: DOUBLE)

Question: query the total usage of the last 30 days from today (including today), say today is Sep 22, 2021.

Bonus Question:

Query the date(s) where its usage is less than the previous one but more than the trailing one.

For Example:

Date                   Usage

2021/1/1            100
2021/1/2            200
2021/1/3            150        ← get this record
2021/1/4            100
'''

SELECT date from
(SELECT usage, date , lag(usage, 1) OVER (ORDER BY date asc) as lag_date, 
lead(usage,1) OVER(ORDER BY date asc AS lead_date)
FROM electricity_use
ORDER by date) AS subquery
WHERE usage < lag_date 
AND usage > lead_date
