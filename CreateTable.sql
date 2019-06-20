USE SessionResults
GO
CREATE TABLE Faculties(
	FacultyID INT IDENTITY PRIMARY KEY,
	FacultyName VARCHAR(70) NOT NULL UNIQUE,
);
CREATE TABLE StudyForms(
	StudyFormID INT IDENTITY PRIMARY KEY,
	StudyFormName VARCHAR(20) NOT NULL UNIQUE,
);
CREATE TABLE Groups(
	GroupID INT IDENTITY PRIMARY KEY,
	GroupName VARCHAR(4) NOT NULL UNIQUE,
	Course INT NOT NULL,
	Faculty INT NOT NULL,
	StudyForm INT NOT NULL,
	CONSTRAINT CourseCheck CHECK(Course between 1 and 6),
	CONSTRAINT fk_faculty FOREIGN KEY (Faculty) 
		REFERENCES Faculties(FacultyID) ON DELETE CASCADE,
	CONSTRAINT fk_studyform FOREIGN KEY (StudyForm) 
		REFERENCES StudyForms(StudyFormID) ON DELETE CASCADE,
);
CREATE TABLE Students(
	StudentID INT IDENTITY PRIMARY KEY,
	Surname VARCHAR(15) NOT NULL,
	Name VARCHAR(15) NOT NULL,
	MiddleName VARCHAR(15) NOT NULL,
	GradeBookNumber VARCHAR(6) NOT NULL UNIQUE,
	GroupOfStudentID INT NOT NULL,
	CONSTRAINT fk_group_studID FOREIGN KEY (GroupOfStudentID) 
		REFERENCES Groups(GroupID) ON DELETE CASCADE,
);
CREATE TABLE Disciplines(
	DisciplineID INT IDENTITY PRIMARY KEY,
	DisciplineName VARCHAR(30) NOT NULL,
);
CREATE TABLE Results(
	ResultID INT IDENTITY PRIMARY KEY,
	Discipline INT NOT NULL,
	StudNumID INT NOT NULL,
	Result INT NOT NULL,
	DateOfResults DATE NOT NULL,
	CONSTRAINT ResultCheck check(Result between 0 and 100),
	CONSTRAINT DateOfResultCheck CHECK (DateOfResults BETWEEN '2000.01.01' AND GETDATE()),
	CONSTRAINT uc_ResultData UNIQUE(StudNumID, DateOfResults, Discipline),
	CONSTRAINT fk_stud_numID FOREIGN KEY (StudNumID) 
		REFERENCES Students(StudentID) ON DELETE CASCADE,
	CONSTRAINT fk_discipline_ID FOREIGN KEY (Discipline) 
		REFERENCES Disciplines(DisciplineID) ON DELETE CASCADE,
);
CREATE TABLE ScholarshipTypes(
	ScholarshipTypeID INT PRIMARY KEY,
	ScholarshipName VARCHAR(20) NOT NULL UNIQUE,
	ScholarshipAmount INT NOT NULL,
);
CREATE TABLE StudyPlan(
	StudyGroup INT NOT NULL,
	StudyDiscipline INT NOT NULL,
	PRIMARY KEY (StudyGroup, StudyDiscipline),
	CONSTRAINT fk_group_studyplan FOREIGN KEY (StudyGroup) 
		REFERENCES Groups(GroupID) ON DELETE CASCADE,
	CONSTRAINT fk_discipline_studyplan FOREIGN KEY (StudyDiscipline) 
		REFERENCES Disciplines(DisciplineID) ON DELETE CASCADE,
);