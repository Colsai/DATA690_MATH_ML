'''
student_id    date		score             average_past3
1	         2021-01-01             10                       NULL
1	         2021-01-02             14                       NULL
1	         2021-01-03             20                      (10+14+20)/3
1	         2021-01-04             20                      (14+20+20)/3
1	         2021-01-05             20                      (20+20+20)/3
1	         2021-01-06             15                      (20+20+15)/3
2	         2021-01-01             50                      NULL
2	         2021-01-02             10                      NULL
2	         2021-01-03               5                      (50+10+5)/3
2	         2021-01-04             15                      (10+5+15)/3
2	         2021-01-05             8                        (5+15+8)/3
2	         2021-01-06             79                      (15+8+79)/3

BONUS: 
what about the 3 scores (excluding current date)
What about the future 3 scores (including current date)

DO THIS IN SQL AND PANDAS.
'''

SELECT date, student_id, score, 
AVG(score) OVER(PARTITION BY student_id ORDER BY date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW )
     AS average_past3 FROM student_score
ORDER BY student_id


--3 Preceding Rows/Non-inclusive
SELECT date, student_id, score, 
AVG(score) OVER(PARTITION BY student_id ORDER BY date ROWS BETWEEN 4 PRECEDING AND 1 PRECEDING)
     AS average_past3 FROM student_score
ORDER BY student_id


--3 Following Rows
SELECT date, student_id, score, 
AVG(score) OVER(PARTITION BY student_id ORDER BY date ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING)
     AS average_past3 FROM student_score
ORDER BY student_id

