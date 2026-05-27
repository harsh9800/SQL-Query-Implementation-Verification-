1-> One query where using LEFT JOIN is more appropriate than INNER JOIN

I used LEFT JOIN to find problems that were never attempted.
LEFT JOIN is more appropriate here because it keeps all problems from the problems table, even if no matching submission exists.
If I used INNER JOIN, only problems with at least one submission would appear, and unattempted problems would be missing from the result.

2-> One query where HAVING is required instead of WHERE

I used HAVING to find students who submitted in both Python and Java.
HAVING is required because COUNT() is an aggregate function calculated after grouping.
WHERE filters rows before grouping

3->One query where a subquery helped solve the problem

I used a subquery to find students whose average score is greater than the overall average score.

4->One situation where output could be misleading if duplicate records exist

SELECT p.problem_id, p.title, COUNT(s.submission_id) AS attempts
FROM problems p
JOIN submissions s
ON p.problem_id = s.problem_id
GROUP BY p.problem_id, p.title
ORDER BY attempts DESC
LIMIT 10;

5->One edge case considered while writing a query

While finding the second-highest score
SELECT DISTINCT score
FROM submissions
WHERE problem_id = 'P0001'
ORDER BY score DESC
LIMIT 1 OFFSET 1;
I considered the edge case where a problem has only one unique score

