USE SessionResults
GO
INSERT INTO ScholarshipTypes(ScholarshipTypeID, ScholarshipName, ScholarshipAmount) VALUES ('1', '��������', '1300'), ('2', '��������', '1800');
INSERT INTO StudyForms(StudyFormName) VALUES ('�����'), ('������'), ('�����������'), ('�������');
INSERT INTO Faculties(FacultyName) VALUES ('Գ����-�������� ��������'), ('�������� ������������ ��*���� �� ������� ����������'), ('��������� ���������'), ('�������� ��������� ���������');
INSERT INTO Disciplines(DisciplineName) VALUES ('���� ����������'), ('������������'), ('���� �����'), ('�������� ����'), ('��������'), ('Գ����'), ('���������');
INSERT INTO Groups(GroupName, Course, Faculty, StudyForm) VALUES ('�61', '2', '2', '1'), ('�52', '3', '2', '1'), ('��61', '2', '2', '2'), ('�71', '1', '2', '1'), ('��61', '2', '1', '1');
INSERT INTO StudyPlan(StudyGroup, StudyDiscipline) VALUES (1, 2), (1, 4), (1, 7), (1, 5), (2, 1), (2, 5), (2, 3), (2, 4),  (3, 3), (3, 1), (3, 6), (3, 2), (4, 2), (4, 4), (4, 7), (5, 4), (5, 1), (5, 7);