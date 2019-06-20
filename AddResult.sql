USE SessionResults
GO
DROP PROC AddResult
GO
CREATE PROC AddResult
	@Discipline INT,
	@GradeBookNumber VARCHAR(6),
	@Result INT,
	@DateOfResults DATE = NULL
	AS
	SET @DateOfResults=ISNULL(@DateOfResults, GETDATE());
	IF EXISTS (SELECT * FROM Results WHERE Discipline=@Discipline AND StudNumID=(SELECT StudentID From Students WHERE GradeBookNumber=@GradeBookNumber))
		UPDATE Results SET Result=@Result, DateOfResults=@DateOfResults WHERE Discipline=@Discipline AND StudNumID=(SELECT StudentID From Students WHERE GradeBookNumber=@GradeBookNumber);
	ELSE
	INSERT INTO Results(Discipline, StudNumID, Result, DateOfResults) VALUES (@Discipline, (SELECT StudentID From Students WHERE GradeBookNumber=@GradeBookNumber), @Result, @DateOfResults);
GO
EXEC AddResult 1, '‘¡6101', 70;
GO
EXEC AddResult 1, '‘¡6102', 80;
GO
EXEC AddResult 1, '—6103', 95;
GO
EXEC AddResult 1, '—6104', 53;
GO
EXEC AddResult 1, '‘≤6109', 88;
GO
EXEC AddResult 1, '—5206', 87;
GO
EXEC AddResult 1, '—5207', 64;
GO
EXEC AddResult 2, '—6103', 63;
GO
EXEC AddResult 2, '—6104', 71;
GO
EXEC AddResult 2, '‘≤6109', 66;
GO
EXEC AddResult 2, '—Á6108', 72, '2018-11-23';
GO
EXEC AddResult 2, '—Á6109', 85, '2018-11-23';*/
GO
EXEC AddResult 2, '—7111', 99, '2018-11-27';
GO
EXEC AddResult 2, '—7112', 63, '2018-11-27';
GO
EXEC AddResult 3, '—5206', 99;
GO
EXEC AddResult 3, '—5207', 55;
GO
EXEC AddResult 3, '—Á6108', 79, '2018-12-23';
GO
EXEC AddResult 3, '—Á6109', 78, '2018-12-23';
GO
EXEC AddResult 4, '—6103', 92;
GO
EXEC AddResult 4, '—6104', 84;
GO
EXEC AddResult 4, '‘≤6109', 64;
GO
EXEC AddResult 4, '—5206', 57;
GO
EXEC AddResult 4, '—7111', 73;
GO
EXEC AddResult 4, '—7112', 71;
GO
EXEC AddResult 4, '‘¡6101', 78;
GO
EXEC AddResult 4, '‘¡6102', 84;
GO
EXEC AddResult 5, '—6103', 75;
GO
EXEC AddResult 5, '—6104', 64;
GO
EXEC AddResult 5, '‘≤6109', 90;
GO
EXEC AddResult 5, '—5206', 90;
GO
EXEC AddResult 5, '—5207', 81;
GO
EXEC AddResult 7, '—6103', 79;
GO
EXEC AddResult 7, '—6104', 99;
GO
EXEC AddResult 7, '‘≤6109', 98;
GO
EXEC AddResult 7, '—7111', 74;
GO
EXEC AddResult 7, '—7112', 60;
GO
EXEC AddResult 7, '‘¡6101', 70;
GO
EXEC AddResult 7, '‘¡6102', 84;
GO