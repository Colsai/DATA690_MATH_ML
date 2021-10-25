--SQL Old Practice

'''
DEFINE TABLE scores (student_id: INT64, score: INT64, subject: STRING)

| student_id | score | subject | 
	
Question: query 'the average score across students with even student_ids (2,4,6,...) by subject'
Function:
'''

SELECT AVG(score) AS ave_score 
FROM scores 
WHERE student_id % 2 = 0 
GROUP BY subject
