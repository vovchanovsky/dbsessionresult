USE SessionResults
GO
CREATE VIEW ScholarsView
AS
WITH ScholarsDef AS (SELECT StudNumID FROM  Results
GROUP BY StudNumID
HAVING SUM(CASE WHEN Result>=60 THEN 1 ELSE 0 END)=(SELECT COUNT(*) FROM StudyPlan 
INNER JOIN Students ON StudyPlan.StudyGroup=Students.GroupOfStudentID
WHERE StudentID=StudNumID) AND AVG(Result)>=75),

ScholarsAdv AS (SELECT StudNumID FROM  Results
GROUP BY StudNumID
HAVING SUM(CASE WHEN Result>=95 THEN 1 ELSE 0 END)=(SELECT COUNT(*) FROM StudyPlan 
INNER JOIN Students ON StudyPlan.StudyGroup=Students.GroupOfStudentID
WHERE StudentID=StudNumID))

SELECT StudNumID,  
(CASE WHEN StudNumID IN (SELECT * FROM ScholarsAdv) THEN (SELECT ScholarshipAmount FROM ScholarshipTypes WHERE ScholarshipTypeID=2) 
ELSE (SELECT ScholarshipAmount FROM ScholarshipTypes WHERE ScholarshipTypeID=1) END) 
AS Scholarship FROM ScholarsDef
GO
CREATE VIEW MoneyByGroupView
AS
SELECT GroupName, SUM(Scholarship) AS 'Стипендіальний фонд' FROM ScholarsView
INNER JOIN Students ON ScholarsView.StudNumID=Students.StudentID
INNER JOIN Groups ON Students.GroupOfStudentID=Groups.GroupID
GROUP BY GroupName
GO
CREATE VIEW MoneyByCourseView
AS
SELECT Course, SUM(Scholarship) AS 'Стипендіальний фонд' FROM ScholarsView
INNER JOIN Students ON ScholarsView.StudNumID=Students.StudentID
INNER JOIN Groups ON Students.GroupOfStudentID=Groups.GroupID
GROUP BY Course
GO
CREATE VIEW MoneyByFacultyView
AS
SELECT FacultyName, SUM(Scholarship) AS 'Стипендіальний фонд' FROM ScholarsView
INNER JOIN Students ON ScholarsView.StudNumID=Students.StudentID
INNER JOIN Groups ON Students.GroupOfStudentID=Groups.GroupID
INNER JOIN Faculties ON Groups.GroupID=Faculties.FacultyID
GROUP BY FacultyName