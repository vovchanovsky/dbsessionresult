USE SessionResults
GO
CREATE VIEW CStudentListView
AS
SELECT CONCAT(Surname,' ', Name, ' ', MiddleName) AS 'Ï²Á' From Students WHERE GroupOfStudentID IN (SELECT GroupID FROM Groups WHERE Course=2 AND GroupName LIKE 'Ñ%');
GO
SELECT * FROM CStudentListView ORDER BY 'Ï²Á'
GO
CREATE VIEW DisciplineNoExamsVIew
AS
SELECT DisciplineName FROM Disciplines WHERE DisciplineID NOT IN (SELECT StudyDiscipline FROM StudyPlan);
GO
SELECT * From DisciplineNoExamsView ORDER BY DisciplineName;
GO
CREATE VIEW MaxInGroupView
AS
WITH AvgResults AS (SELECT StudNumID, AVG(Result) AS AvgRes FROM Results GROUP BY StudNumID)
SELECT  CONCAT(Surname,' ', Name, ' ', MiddleName) AS 'Ï²Á', GroupName, AvgRes FROM Students 
INNER JOIN Groups ON Students.GroupOfStudentID=Groups.GroupID
INNER JOIN AvgResults ON Students.StudentID=AvgResults.StudNumID
WHERE EXISTS(SELECT * FROM (SELECT GroupOfStudentID , MAX(AvgRes) AS MaxRes FROM Students 
INNER JOIN AvgResults ON Students.StudentID=AvgResults.StudNumID
GROUP BY GroupOfStudentID) GroupMax
WhERE Students.GroupOfStudentID=GroupMax.GroupOfStudentID AND AvgResults.AvgRes=GroupMax.MaxRes);
GO
SELECT * FROM MaxInGroupView ORDER BY AvgRes, 'Ï²Á';