--POSTGRESQL13

'''
DEFINE TABLE employee(report_from: INT, report_to: INT)

Employee | Manager
Report_from|  Report_to
1		2  == 11,12,13
2		3
3		8
7		8
5		7
10		7
9		10
11		1
12		11
13		11
14		12

1-2-3-8
2-3-8
3-8-
7-8
5-7-8
10-7-8
11-1-2-3-8
12-11-1-2-3-8
13-11-1-2-3-8
14-12-11-1-2-3-8

For each individual, find the total number of employees that report to them. (including direct report and all the indirect reports)
Example, there is 1 employee directly reporting to 1 (#11), but indirectly, #12,#13 and #14 all report to 1. Therefore, #1 should have 1+3 = 4 reports.
Do this for all employees, and if one doesn’t have a direct report, the count is 0.
Do this in SQL and Pandas.

'''

CREATE TABLE if not exists employees (
  report_from integer,
  report_to integer
);

INSERT INTO
  employees (report_from, report_to)
  
VALUES
  (1, 2),
  (2, 3),
  (3, 8),
  (7, 8),
  (5, 7),
  (10, 7),
  (9, 10),
  (11, 1),
  (12, 1),
  (13, 11),
  (14, 12)
  ;

WITH recursive empcte
AS (SELECT report_from, report_to, 1 AS level
FROM employees

UNION ALL

SELECT e.report_from, e.report_to, m.level + 1
FROM employees e
INNER JOIN empcte m ON e.report_from = m.report_to
)

--Subtracts 1 from all values so as not to count employee themselves
SELECT report_from, COUNT(report_from)-1 AS allemployees FROM empcte
GROUP BY report_from
ORDER BY report_from
