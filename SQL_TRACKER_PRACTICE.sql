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
AS (SELECT report_from, report_to, 1 AS subordinate_count
FROM employees

UNION ALL

SELECT e.report_from, e.report_to, m.subordinate_count + 1
FROM employees e
INNER JOIN empcte m ON e.report_from = m.report_to
)

--Subtracts 1 from all values so as not to count employee themselves
SELECT report_from, COUNT(report_from)-1 AS allemployees FROM empcte
GROUP BY report_from
ORDER BY report_from
