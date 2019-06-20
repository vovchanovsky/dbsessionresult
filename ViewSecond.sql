USE SessionResults
GO
CREATE VIEW StudentsView
AS
WITH AvgResults AS (SELECT StudNumID, AVG(Result) AS AvgRes FROM Results GROUP BY StudNumID)
SELECT FacultyName, Course, GroupName,  CONCAT(Surname,' ', Name, ' ', MiddleName) AS 'ПІБ', GradeBookNumber, AvgRes FROM Students 
INNER JOIN Groups ON Students.GroupOfStudentID=Groups.GroupID
INNER JOIN Faculties ON Groups.Faculty=Faculties.FacultyID
INNER JOIN AvgResults ON Students.StudentID=AvgResults.StudNumID
GO
SELECT * FROM StudentsView
GO
CREATE VIEW StudentsNumber
AS
SELECT FacultyName, Course, COUNT(*) as NumberOfStundents FROM Students
INNER JOIN Groups ON Students.GroupOfStudentID=Groups.GroupID
INNER JOIN Faculties ON Groups.Faculty=Faculties.FacultyID
WHERE Groups.StudyForm=(SELECT StudyFormID FROM StudyForms WHERE StudyFormName='денна')
GROUP BY FacultyName, Course;
GO
SELECT * FROM StudentsNumber
GO
CREATE VIEW StudentsNumberbyStudyFormView
AS
SELECT StudyFormName, COUNT(*) as NumberOfStundents FROM StudyForms
INNER JOIN Groups ON StudyForms.StudyFormID=Groups.StudyForm
INNER JOIN Students ON Groups.GroupID=Students.GroupOfStudentID
GROUP BY StudyFormName;
GO
SELECT * FROM StudentsNumberbyStudyFormView
GO
CREATE PROC Progress
@Result INT=NULL
AS
SET @Result = ISNULL(@Result, (SELECT AVG(Result) From Results))
SELECT GroupName, AVG(Result), @Result-AVG(Result) AS 'Різниця' FROM Results
INNER JOIN Students ON Results.StudNumID=Students.StudentID
INNER JOIN Groups ON Students.GroupOfStudentID=Groups.GroupID
GROUP BY GroupName
ORDER BY 'Різниця'
GO
EXEC Progress