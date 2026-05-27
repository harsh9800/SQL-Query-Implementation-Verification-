SELECT student_id, full_name, email, batch_id, admission_date FROM students WHERE enrollment_status='active';
/* 
This query retrieves comprehensive information about currently active students from the database, including their identification details, contact information, batch assignment, and admission date.

S0001	Vivaan Gupta	vivaan.gupta001@codejudge.edu	B002	2025-02-13
S0002	Harsh Das	harsh.das002@codejudge.edu	B006	2025-04-08
S0004	Ananya Bose	ananya.bose004@codejudge.edu	B003	2025-02-19

The output makes sense because it only includes students with enrollment_status='active', filtering out any graduated, suspended, or withdrawn students. Each row contains the requested fields for active students, showing their current enrollment status is active.
*/

SELECT student_id, full_name, email FROM students WHERE email IS NULL OR TRIM(email) = '' OR email NOT LIKE '%@%';
/*
This query retrieves those students' ID, name, and email whose email is either invalid or missing.

S0005	Ayaan Gupta	
S0018	Anika Patel	ravi.no-at-symbol.codejudge.edu

The output makes sense because it identifies students with either missing email addresses (NULL or empty) or those with improperly formatted emails (missing '@' symbol). This helps in maintaining data integrity and ensuring that all students have valid contact information.
*/

SELECT * FROM problems WHERE difficulty IN ('Easy','Medium');
/*
This query retrieves all problems from the database that are categorized as either 'Easy' or 'Medium' in terms of difficulty.

P0001	C001	CS101_P01	Shortest Path 1	Medium	75	2025-02-12	1
P0002	C001	CS101_P02	Dynamic Programming Basics 2	Easy	50	2025-04-08	1
P0003	C001	CS101_P03	Dynamic Programming Basics 3	Easy	50	2025-03-15	1
P0004	C001	CS101_P04	Normalization Check 4	Easy	50	2025-03-07	0
P0005	C001	CS101_P05	Queue using Stacks 5	Easy	50	2025-04-03	1
P0007	C001	CS101_P07	Graph Traversal 7	Medium	75	2025-04-01	0

The output makes sense because it filters the problems based on their difficulty level, ensuring that only those problems categorized as 'Easy' or 'Medium' are included in the results. This allows users to focus on problems that match their desired difficulty level for practice or assessment.
*/

SELECT * FROM submissions ORDER BY submitted_at DESC LIMIT 20;
/*
This query retrieves the 20 most recent submissions from the database, ordered by the submission timestamp in descending order.

SUB001091	S0074	P0025	CT006	C++	2025-08-12 03:44:00	Runtime Error	12	1870
SUB001593	S0007	P0005	CT003	Go	2025-08-05 20:47:00	Accepted	50	3251
SUB000123	S0002	P0067	CT003	C	2025-08-04 15:30:00	Accepted	50	1855
SUB001144	S0007	P0006	CT010	Go	2025-07-31 02:49:00	Compilation Error	0	3930
SUB000878	S0142	P0066	CT006	Go	2025-07-31 01:38:00	Accepted	75	2339
SUB002438	S0207	P0018	CT009	JavaScript	2025-07-30 11:25:00	Accepted	100	70

The output makes sense because it retrieves the most recent submissions based on the timestamp, allowing users to see the latest activity in terms of problem-solving and code submissions. This is useful for tracking progress, identifying trends, and analyzing recent performance.
*/

SELECT * FROM submissions WHERE status In('Runtime Error','Compilation Error','Time Limit Exceeded','Wrong Answer');
/*
This query retrieves all submissions that resulted in an error or incorrect outcome, including runtime errors, compilation errors, time limit exceeded, and wrong answers.

SUB000001	S0282	P0043	CT011	C	2025-05-14 13:48:00	Wrong Answer	46	1976
SUB000002	S0289	P0028		JavaScript	2025-03-21 17:59:00	Wrong Answer	46	3257
SUB000003	S0001	P0005	CT001	C++	2025-04-09 19:01:00	Wrong Answer	19	1822
SUB000006	S0154	P0012	CT003	Go	2025-04-15 12:36:00	Compilation Error	0	2664
SUB000007	S0248	P0023	CT010	Python	2025-05-06 22:44:00	Wrong Answer	6	4725
SUB000008	S0196	P0011		JavaScript	2025-02-08 10:22:00	Compilation Error	0	992
SUB000013	S9999	P0066	CT007	JavaScript	2025-03-28 22:08:00	Runtime Error	61	3243
SUB000014	S0293	P0026	CT003	C++	2025-04-13 19:47:00	Wrong Answer	31	3528
SUB000016	S0177	P0004	CT005	JavaScript	2025-05-06 05:22:00	Wrong Answer	28	372
SUB000017	S0120	P0026	CT004	Go	2025-04-29 11:09:00	Runtime Error	10	451
SUB000018	S0125	P0019	CT010	JavaScript	2025-05-15 00:21:00	Wrong Answer	14	3864
SUB000022	S0035	P0051	CT012	Python	2025-04-26 08:42:00	Compilation Error	0	161
SUB000023	S0150	P0051	CT011	JavaScript	2025-03-02 12:32:00	Time Limit Exceeded	6	4896

The output makes sense because it filters the submissions based on their status, allowing users to identify and analyze submissions that did not succeed. This can help in understanding common errors, improving code quality, and learning from mistakes.
*/

SELECT full_name, title, language, status, score, submitted_at FROM students LEFT JOIN submissions ON students.student_id=submissions.student_id LEFT JOIN problems ON submissions.problem_id=problems.problem_id;
/*
This query retrieves a comprehensive list of students along with their submission details, including the problem title, programming language used, submission status, score, and submission timestamp. It uses LEFT JOIN to ensure that all students are included in the results, even if they have not made any submissions.

Isha Gupta	Dynamic Programming Basics 43	C	Wrong Answer	46	2025-05-14 13:48:00
Kunal Singh	Valid Parentheses 28	JavaScript	Wrong Answer	46	2025-03-21 17:59:00
Vivaan Gupta	Queue using Stacks 5	C++	Wrong Answer	19	2025-04-09 19:01:00
Saanvi Bose	Two Sum 42	Python	Accepted	50	2025-02-03 22:52:00
Rahul Gupta	Topological Sort 47	Java	Accepted	50	2025-02-16 04:16:00

The output makes sense because it combines data from the students, submissions, and problems tables to provide a complete view of each student's activity and performance. This allows for a better understanding of how students are engaging with the problems and their overall progress.
*/ 

SELECT students.student_id,full_name,email,enrollments.enrollment_status FROM students LEFT JOIN enrollments ON students.student_id=enrollments.student_id;
/*
This query retrieves all students along with their enrollment details, including batch information. It uses LEFT JOIN to ensure that all students are included in the results, even if they are not currently enrolled in any batch.

S0001	Vivaan Gupta	vivaan.gupta001@codejudge.edu	active
S0001	Vivaan Gupta	vivaan.gupta001@codejudge.edu	active
S0002	Harsh Das	harsh.das002@codejudge.edu	active
S0002	Harsh Das	harsh.das002@codejudge.edu	active
S0003	Ira Pillai	ira.pillai003@codejudge.edu	active
S0004	Ananya Bose	ananya.bose004@codejudge.edu	active
S0004	Ananya Bose	ananya.bose004@codejudge.edu	completed
S0004	Ananya Bose	ananya.bose004@codejudge.edu	active
S0005	Ayaan Gupta		dropped
S0006	Isha Mehta	isha.mehta006@codejudge.edu	active
S0006	Isha Mehta	isha.mehta006@codejudge.edu	active

The output makes sense because it provides a comprehensive view of each student's enrollment status and their associated batch information. The LEFT JOIN ensures that all students are included in the results, even if they do not have any enrollment records, allowing for a complete overview of the student population and their enrollment details.
*/

SELECT course_title, COUNT(DISTINCT enrollments.student_id) AS no_of_enrolled_students FROM courses LEFT JOIN enrollments ON courses.course_id = enrollments.course_id GROUP BY courses.course_title;
/*
This query retrieves the course title along with the count of distinct students enrolled in each course. It uses LEFT JOIN to ensure that all courses are included in the results, even if they have no enrolled students. The GROUP BY clause groups the results by course title to provide a count of enrolled students

Algorithms	94
Computer Networks	90
Data Structures	101
Database Management Systems	80
Distributed Systems	0
Object Oriented Programming	89
Operating Systems	99
Programming Fundamentals	83
Software Engineering	81
Web Backend Engineering	0

The output makes sense because it provides a clear count of how many distinct students are enrolled in each course, allowing for an understanding of the popularity and engagement levels of different courses. The LEFT JOIN ensures that even courses with no enrollments are included in the results, giving a complete picture of all available courses and their enrollment status.
*/

SELECT students.full_name as student_name,
 problems.title as problem_title,
 test_results.submission_id,
 test_results.test_case_id,
 test_results.result_status,
 test_results.awarded_points,
 test_results.runtime_ms,
 test_results.memory_kb
FROM test_results
JOIN submissions ON test_results.submission_id=submissions.submission_id  
JOIN students ON submissions.student_id = students.student_id
JOIN problems ON submissions.problem_id = problems.problem_id
ORDER BY students.full_name, problems.title, test_results.test_case_id;
/*
This query retrieves detailed information about each student's submissions and their corresponding test results. It joins the test_results table with the submissions, students, and problems tables to provide a comprehensive view of each student's performance on different problems, including the status of each test case, awarded points, runtime, and memory usage.

Aadhya Gupta	Binary Search 60	SUB002273	TC00290	Passed	15	3992	44404
Aadhya Gupta	Binary Search 60	SUB002273	TC00291	Failed	0	1011	115465
Aadhya Gupta	Binary Search 60	SUB002273	TC00292	Time Limit Exceeded	0	3619	15850
Aadhya Gupta	Binary Search 60	SUB002273	TC00293	Failed	0	1059	2382
Aadhya Gupta	Binary Search 60	SUB002273	TC00294	Failed	0	590	84160
Aadhya Gupta	Deadlock Detection 45	SUB000608	TC00215	Passed	8	1550	36415
Aadhya Gupta	Deadlock Detection 45	SUB000608	TC00216	Passed	8	3894	93700
Aadhya Gupta	Deadlock Detection 45	SUB000608	TC00217	Passed	8	2611	60326
Aadhya Gupta	Dynamic Programming Basics 44	SUB002253	TC00210	Passed	18	792	97088
Aadhya Gupta	Dynamic Programming Basics 44	SUB002253	TC00211	Passed	18	2349	16067
Aadhya Gupta	Dynamic Programming Basics 44	SUB002253	TC00213	Passed	21	2388	93549
Aadhya Gupta	Graph Traversal 33	SUB001520	TC00155	Passed	12	898	61394
Aadhya Gupta	Graph Traversal 33	SUB002054	TC00155	Passed	12	2947	17759
Aadhya Gupta	Graph Traversal 33	SUB002054	TC00156	Time Limit Exceeded	0	1943	7295
Aadhya Gupta	Graph Traversal 33	SUB001520	TC00156	Passed	12	2112	64255
Aadhya Gupta	Graph Traversal 33	SUB002054	TC00157	Failed	0	2322	46541
Aadhya Gupta	Graph Traversal 33	SUB001520	TC00157	Passed	12	3939	45156
Aadhya Gupta	Graph Traversal 33	SUB001520	TC00158	Passed	14	3016	46925
Aadhya Gupta	Normalization Check 35	SUB001752	TC00164	Passed	12	3313	90990
Aadhya Gupta	Normalization Check 35	SUB000585	TC00164	Passed	12	3141	12090
Aadhya Gupta	Normalization Check 35	SUB000585	TC00165	Passed	12	534	5570
Aadhya Gupta	Normalization Check 35	SUB001752	TC00165	Failed	0	33	69326
Aadhya Gupta	Normalization Check 35	SUB000585	TC00166	Passed	12	433	60460
Aadhya Gupta	Normalization Check 35	SUB001752	TC00166	Time Limit Exceeded	0	2418	77562
Aadhya Gupta	Normalization Check 35	SUB000585	TC00167	Passed	14	1640	30394
Aadhya Gupta	Normalization Check 35	SUB001752	TC00167	Failed	0	368	31493
Aadhya Gupta	SQL Joins 14	SUB001443	TC00064	Passed	10	3695	93987
Aadhya Gupta	SQL Joins 14	SUB001443	TC00065	Passed	10	1626	16691
Aadhya Gupta	SQL Joins 14	SUB001443	TC00066	Passed	10	2914	102359
Aadhya Gupta	SQL Joins 14	SUB001443	TC00068	Passed	10	784	10426
Aadhya Gupta	Shortest Path 1	SUB002390	TC00001	Failed	0	2859	63667
Aadhya Gupta	Shortest Path 1	SUB002390	TC00002	Time Limit Exceeded	0	1048	57788
Aadhya Gupta	Shortest Path 1	SUB002390	TC00004	Failed	0	515	22448
Aadhya Gupta	Shortest Path 1	SUB002390	TC00005	Failed	0	3551	50840
Aadhya Gupta	Tree Diameter 17	SUB001109	TC00077	Passed	20	1386	1685
Aadhya Gupta	Tree Diameter 17	SUB000625	TC00078	Passed	20	42	80700
Aadhya Gupta	Tree Diameter 17	SUB001109	TC00078	Passed	20	3516	104819
Aadhya Gupta	Tree Diameter 17	SUB000625	TC00079	Passed	20	913	32168
Aadhya Gupta	Tree Diameter 17	SUB001109	TC00079	Passed	20	3740	64879
Aadhya Gupta	Tree Diameter 17	SUB001109	TC00080	Failed	0	3609	106949
Aadhya Gupta	Tree Diameter 17	SUB000625	TC00080	Passed	20	3730	94326
Aadhya Gupta	Tree Diameter 17	SUB001109	TC00081	Failed	0	2868	82933
Aadhya Gupta	Tree Diameter 17	SUB000625	TC00081	Passed	20	3109	4838
Aadhya Gupta	Two Sum 42	SUB001557	TC00199	Passed	10	3465	111588
Aadhya Gupta	Two Sum 42	SUB001557	TC00200	Passed	10	1918	124327
Aadhya Gupta	Two Sum 42	SUB001557	TC00201	Passed	10	3298	59531
Aadhya Jain	Binary Search 54	SUB001904	TC00260	Skipped	0	2474	58930
Aadhya Jain	Binary Search 54	SUB001904	TC00261	Skipped	0	50	89918
Aadhya Jain	Binary Search 54	SUB001904	TC00262	Skipped	0	2124	26539
Aadhya Jain	Binary Search 54	SUB001904	TC00263	Skipped	0	2298	79484
Aadhya Jain	Binary Search 54	SUB001904	TC00264	Skipped	0	3498	9842
Aadhya Jain	Dynamic Programming Basics 43	SUB002375	TC00204	Passed	8	2040	100769
Aadhya Jain	Dynamic Programming Basics 43	SUB002375	TC00205	Passed	8	3262	87667
Aadhya Jain	Dynamic Programming Basics 43	SUB002375	TC00206	Passed	8	3936	22886
Aadhya Jain	Dynamic Programming Basics 43	SUB002375	TC00209	Passed	10	2113	86407
Aadhya Jain	Queue using Stacks 5	SUB002271	TC00023	Passed	12	365	73206
Aadhya Jain	Queue using Stacks 5	SUB002271	TC00024	Failed	0	577	112453
Aadhya Jain	Queue using Stacks 5	SUB002271	TC00025	Passed	14	2434	56372
Aadhya Jain	Reverse String 67	SUB001609	TC00325	Passed	8	2191	29616
Aadhya Jain	Reverse String 67	SUB001609	TC00326	Passed	8	804	55932
Aadhya Jain	Reverse String 67	SUB001609	TC00327	Passed	8	2549	64118
Aadhya Jain	Two Sum 42	SUB001983	TC00200	Time Limit Exceeded	0	1475	3719
Aadhya Jain	Two Sum 42	SUB001983	TC00201	Failed	0	3854	50866
Aadhya Jain	Two Sum 42	SUB001983	TC00202	Failed	0	1746	100415
Aadhya Jain	Two Sum 42	SUB001983	TC00203	Failed	0	3964	66174
Aadhya Pillai	Binary Search 60	SUB000130	TC00290	Failed	0	1606	70032
Aadhya Pillai	Binary Search 60	SUB000130	TC00291	Failed	0	2826	93642
Aadhya Pillai	Binary Search 60	SUB000130	TC00292	Time Limit Exceeded	0	683	91960
Aadhya Pillai	Binary Search 60	SUB000130	TC00293	Failed	0	3653	28202
Aadhya Pillai	Binary Search 60	SUB000130	TC00294	Failed	0	2379	116780
Aadhya Pillai	Database Indexing 11	SUB002222	TC00049	Skipped	0	182	35869
Aadhya Pillai	Database Indexing 11	SUB002222	TC00050	Skipped	0	2023	44476
Aadhya Pillai	Database Indexing 11	SUB002222	TC00051	Skipped	0	1174	104800
Aadhya Pillai	Database Indexing 11	SUB002222	TC00052	Skipped	0	2148	105617
Aadhya Pillai	Deadlock Detection 45	SUB000535	TC00214	Failed	0	1224	45956
Aadhya Pillai	Deadlock Detection 45	SUB000535	TC00215	Runtime Error	0	328	69047
Aadhya Pillai	Deadlock Detection 45	SUB000535	TC00217	Failed	0	2092	43939
Aadhya Pillai	Deadlock Detection 45	SUB000535	TC00218	Failed	0	1543	30874
Aadhya Pillai	Deadlock Detection 45	SUB000535	TC00219	Failed	0	1336	93396
Aadhya Pillai	Dynamic Programming Basics 3	SUB001933	TC00012	Time Limit Exceeded	0	1405	23108
Aadhya Pillai	Dynamic Programming Basics 3	SUB001933	TC00013	Failed	0	2846	64909
Aadhya Pillai	Dynamic Programming Basics 3	SUB001933	TC00014	Failed	0	2388	109904
Aadhya Pillai	Dynamic Programming Basics 3	SUB001933	TC00016	Passed	10	1820	121803
Aadhya Pillai	Graph Traversal 40	SUB002263	TC00191	Runtime Error	0	1070	59001
Aadhya Pillai	Graph Traversal 40	SUB002263	TC00192	Failed	0	2874	47503
Aadhya Pillai	Graph Traversal 40	SUB002263	TC00193	Passed	18	3838	84258
Aadhya Pillai	Graph Traversal 40	SUB002263	TC00194	Time Limit Exceeded	0	3545	130411
Aadhya Pillai	Merge Intervals 29	SUB001445	TC00138	Time Limit Exceeded	0	3856	116777

The output makes sense because it combines data from multiple tables to give a detailed overview of each student's performance on their submissions. By ordering the results by student name, problem title, and test case ID, it allows for easy analysis of how each student performed on specific problems and test cases.
*/

SELECT submissions.status, COUNT(*) AS no_of_submissons FROM submissions GROUP BY submissions.status;
/*
This query retrieves the count of submissions for each unique status in the submissions table. It groups the results by the status column to provide a summary of how many submissions fall under each status category.

OK	1
Wrong Answer	729
Runtime Error	277
Compilation Error	196
Time Limit Exceeded	171
Accepted	1127

The output makes sense because it provides a clear summary of the distribution of submission statuses, allowing for an understanding of how many submissions were successful (Accepted) versus those that encountered issues (Wrong Answer, Runtime Error, Compilation Error, Time Limit Exceeded). This information can be useful for analyzing overall performance and identifying common issues in submissions.
*/

SELECT problems.title, AVG(DISTINCT problems.max_score) AS avg_score_per_problem FROM problems GROUP BY problems.title;
/*
This query retrieves the average maximum score for each problem title. It groups the results by the problem title to provide a summary of the average score that can be achieved for each problem.

Binary Search 34	50.0000000000000000
Binary Search 37	75.0000000000000000
Binary Search 54	50.0000000000000000
Binary Search 57	50.0000000000000000
Binary Search 60	75.0000000000000000
Database Indexing 11	75.0000000000000000
Database Indexing 18	100.0000000000000000
Database Indexing 20	50.0000000000000000
Database Indexing 66	75.0000000000000000
Deadlock Detection 16	50.0000000000000000
Deadlock Detection 45	50.0000000000000000
Deadlock Detection 58	50.0000000000000000
Dynamic Programming Basics 13	75.0000000000000000
Dynamic Programming Basics 19	75.0000000000000000

The output makes sense because it calculates the average maximum score for each problem title, providing insight into the scoring potential of each problem. This can help students understand which problems may offer higher rewards and can guide their practice and preparation strategies.
*/

SELECT students.full_name, COUNT(submissions.submission_id) AS submission_count FROM submissions INNER JOIN students ON students.student_id = submissions.student_id GROUP BY students.student_id HAVING COUNT(submissions.submission_id)>5;
/*
This query retrieves the full name of students along with the count of their submissions, but only includes those students who have made more than 5 submissions. It uses an INNER JOIN to connect the submissions table with the students table based on the student_id, and then groups the results by student_id to count the number of submissions for each student.

Anika Roy	7
Amit Pillai	6
Aarav Reddy	12
Saanvi Sharma	7
Meera Nair	9
Kunal Kulkarni	8
Arjun Gupta	9
Rahul Roy	8
Ishaan Mehta	12
Sai Chatterjee	9
Nitin Singh	8
Dhruv Patel	16

The output makes sense because it identifies students who are highly active in terms of submissions, allowing for an analysis of their engagement and performance. By filtering for students with more than 5 submissions, it highlights those who are consistently practicing and submitting solutions, which can be useful for recognizing dedicated learners and providing targeted support or recognition.
*/

SELECT problems.title, ROUND(100* SUM(CASE WHEN submissions.status='Accepted' THEN 1 ELSE 0 END)/COUNT(*),2) AS success_rate FROM problems LEFT JOIN submissions ON problems.problem_id=submissions.problem_id GROUP BY problems.problem_id, problems.title HAVING 100.0 * SUM(CASE WHEN submissions.status = 'Accepted' THEN 1 ELSE 0 END)/COUNT(*) < 40 ORDER BY success_rate ASC;
/*
This query retrieves the title of each problem along with its success rate, which is calculated as the percentage of submissions that were accepted for that problem. It uses a LEFT JOIN to connect the problems table with the submissions table based on the problem_id, and then groups the results by problem_id and title. The HAVING clause filters for problems with a success rate of less than 40%, and the results are ordered by success rate in ascending order.

Trie Search 36	0.00
Trie Search 64	30.00
Valid Parentheses 28	31.00
LRU Cache 8	33.00
Merge Intervals 55	33.00
Dynamic Programming Basics 44	34.00
Database Indexing 20	34.00
Binary Search 57	34.00

The output makes sense because it identifies problems that have a low success rate, indicating that they may be particularly challenging for students. This information can be useful for educators to understand which problems may require additional instruction or support, and for students to identify areas where they may need to focus their practice.
*/

SELECT problems.problem_id, problems.title, COUNT(submissions.submission_id) AS attempts FROM problems LEFT JOIN submissions ON submissions.problem_id=problems.problem_id GROUP BY problems.problem_id, problems.title ORDER BY attempts DESC LIMIT 10;
/*
This query retrieves the problem ID, title, and the count of submissions (attempts) for each problem. It uses a LEFT JOIN to connect the problems table with the submissions table based on the problem_id, and then groups the results by problem_id and title. The results are ordered by the number of attempts in descending order, and only the top 10 problems with the most attempts are included in the results.

P0040	Graph Traversal 40	55
P0019	Dynamic Programming Basics 19	53
P0001	Shortest Path 1	53
P0043	Dynamic Programming Basics 43	49
P0045	Deadlock Detection 45	49
P0024	Tree Diameter 24	48
P0032	Valid Parentheses 32	47
P0013	Dynamic Programming Basics 13	47
P0016	Deadlock Detection 16	47
P0006	Graph Traversal 6	46

The output makes sense because it identifies the problems that have been attempted the most by students, which can indicate their popularity or perceived difficulty. This information can be useful for educators to understand which problems are engaging students and may require additional resources or support, and for students to see which problems are commonly attempted by their peers.
*/

SELECT students.student_id, students.full_name, AVG(submissions.score) as avg_score FROM students LEFT JOIN submissions ON students.student_id=submissions.student_id GROUP BY students.student_id,students.full_name HAVING AVG(submissions.score)>(SELECT AVG(score) FROM submissions);
/*
This query retrieves the student ID, full name, and average score for each student, but only includes those students whose average score is greater than the overall average score of all submissions. It uses a LEFT JOIN to connect the students table with the submissions table based on the student_id, and then groups the results by student_id and full_name. The HAVING clause filters for students whose average score exceeds the average score calculated from all submissions.

S0131	Anika Roy	45.7142857142857143
S0267	Amit Pillai	59.3333333333333333
S0091	Aarav Reddy	62.9166666666666667
S0244	Saanvi Sharma	46.4285714285714286
S0243	Kunal Kulkarni	47.2500000000000000
S0208	Ira Dutta	47.5555555555555556
S0113	Shaurya Roy	46.4000000000000000
S0280	Isha Nair	59.2500000000000000
S0138	Nitin Nair	50.4285714285714286
S0142	Amit Gupta	52.8000000000000000
S0241	Ayaan Patel	73.0000000000000000
S0112	Aditya Sharma	97.5000000000000000
S0115	Isha Chatterjee	54.5454545454545455

The output makes sense because it identifies students who have an average score that is higher than the overall average score of all submissions, indicating that they are performing better than their peers. This information can be useful for recognizing high-performing students and providing them with additional opportunities or support to further enhance their skills.
*/

SELECT problems.problem_id, problems.title FROM problems LEFT JOIN submissions ON problems.problem_id = submissions.problem_id WHERE submissions.problem_id IS NULL;
/*
This query retrieves the problem ID and title of problems that have not received any submissions. It uses a LEFT JOIN to connect the problems table with the submissions table based on the problem_id, and then filters for cases where the problem_id in the submissions table is NULL, indicating that there have been no submissions for those problems.

P0036	Trie Search 36

The output makes sense because it identifies problems that have not been attempted by any students, which can indicate that they may be new, less popular, or potentially too difficult. This information can be useful for educators to understand which problems may need additional promotion or support to encourage student engagement.
*/

SELECT students.student_id, students.full_name FROM students LEFT JOIN submissions ON students.student_id=submissions.student_id WHERE submissions.student_id IS NULL;
/*
This query retrieves the student ID and full name of students who have not made any submissions. It uses a LEFT JOIN to connect the students table with the submissions table based on the student_id, and then filters for cases where the student_id in the submissions table is NULL, indicating that those students have not made any submissions.

The output makes sense because it identifies students who have not engaged with the submission process, which can indicate that they may be new, less active, or potentially facing challenges in participating. This information can be useful for educators to reach out to these students and provide support or encouragement to help them get started with their submissions.
*/

SELECT students.student_id, students.full_name FROM students LEFT JOIN submissions ON students.student_id=submissions.student_id WHERE submissions."language" IN ('Python', 'Java') GROUP BY students.student_id,students.full_name HAVING COUNT(DISTINCT submissions."language") = 2;
/*
This query retrieves the student ID and full name of students who have made submissions in both Python and Java programming languages. It uses a LEFT JOIN to connect the students table with the submissions table based on the student_id, and then filters for cases where the language in the submissions table is either 'Python' or 'Java'. The results are grouped by student_id and full_name, and the HAVING clause ensures that only students who have made submissions in both languages (count of distinct languages equals 2) are included in the results.

S0002	Harsh Das
S0003	Ira Pillai
S0005	Ayaan Gupta
S0006	Isha Mehta
S0007	Reyansh Kulkarni
S0008	Gaurav Das
S0009	Meera Gupta
S0011	Sai Chatterjee
S0013	Harsh Roy
S0014	Ira Verma
S0020	Nisha Chatterjee
S0024	Sneha Reddy
S0027	Rohan Iyer

The output makes sense because it identifies students who have demonstrated proficiency in both Python and Java by making submissions in both languages. This can indicate a higher level of programming skill and versatility, which can be useful for educators to recognize and provide additional opportunities for these students to further develop their skills.
*/

SELECT MAX(score) AS second_highest_score FROM submissions WHERE problem_id = 'P0001' AND score < (SELECT MAX(score) FROM submissions WHERE problem_id = 'P0001');
/*
This query retrieves the second highest score for the problem with ID 'P0001'. It does this by first finding the maximum score for that problem and then selecting the maximum score that is less than that maximum score.

72

The output makes sense because it correctly identifies the second highest score for the specified problem by filtering out the highest score and then finding the maximum of the remaining scores. This is a common approach to finding the second highest value in a dataset.
*/






