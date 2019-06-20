USE SessionResults
GO
DROP PROC AddStudent
GO
CREATE PROC AddStudent
	@Surname VARCHAR(15),
	@Name VARCHAR(15),
	@Middlename VARCHAR(15),
	@Group VARCHAR(4),
	@GradeBook VARCHAR(6)=NULL
AS
	IF (@GradeBook IS NULL)
		IF ((IDENT_CURRENT('Students'))<10)
			SET @GradeBook=@Group+'0'+CONVERT(varchar(1), (IDENT_CURRENT('Students')+1))
		ELSE
			SET @GradeBook=@Group+CONVERT(varchar(2), (IDENT_CURRENT('Students')+1))
	INSERT INTO Students(Surname, Name, MiddleName, GroupOfStudentID, GradeBookNumber) VALUES (@Surname, @Name, @Middlename, (SELECT GroupID From Groups WHERE GroupName=@Group), @GradeBook)