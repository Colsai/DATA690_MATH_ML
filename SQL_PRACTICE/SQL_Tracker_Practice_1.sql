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

'''

Followup: we don’t observe student_id, each individual is ordered within each subject

Generate your own student_id

Student  Subject    student_id

A             Math          1
B             Math          2
A            English       1
B            English       2
'''

WITH score_id AS 
  (SELECT *, ROW_NUMBER() OVER (PARTITION BY subject) student_id 
     FROM scores)

SELECT subject, AVG(score) score FROM score_id
     WHERE ( student_id % 2 ) = 0 GROUP BY subject;
