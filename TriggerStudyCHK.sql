USE SessionResults
GO
DROP TRIGGER StudyCHK
GO
CREATE TRIGGER StudyCHK ON Results
FOR INSERT, UPDATE
AS
IF NOT EXISTS(SELECT 'True' FROM StudyPlan WHERE CONCAT(StudyDiscipline, StudyGroup)=(SELECT CONCAT(Discipline, GroupOfStudentID) FROM INSERTED INNER JOIN Students ON inserted.StudNumID=Students.StudentID))
BEGIN
	ROLLBACK TRAN
	RAISERROR('Дана дисципліна не передбачена у навчальному плані студента!', 16, 1)
END