USE SessionResults
GO
INSERT INTO ScholarshipTypes(ScholarshipTypeID, ScholarshipName, ScholarshipAmount) VALUES ('1', 'звичайна', '1300'), ('2', 'підвищена', '1800');
INSERT INTO StudyForms(StudyFormName) VALUES ('денна'), ('заочна'), ('дистанційна'), ('вечірня');
INSERT INTO Faculties(FacultyName) VALUES ('Фізико-технічний інститут'), ('Інститут спеціального зв*язку та захисту інформації'), ('Факультет лінгвістики'), ('Інститут оборонних технологій');
INSERT INTO Disciplines(DisciplineName) VALUES ('Вища математика'), ('Криптографія'), ('Бази даних'), ('Іноземна мова'), ('Економіка'), ('Фізика'), ('Політологія');
INSERT INTO Groups(GroupName, Course, Faculty, StudyForm) VALUES ('С61', '2', '2', '1'), ('С52', '3', '2', '1'), ('Сз61', '2', '2', '2'), ('С71', '1', '2', '1'), ('ФБ61', '2', '1', '1');
INSERT INTO StudyPlan(StudyGroup, StudyDiscipline) VALUES (1, 2), (1, 4), (1, 7), (1, 5), (2, 1), (2, 5), (2, 3), (2, 4),  (3, 3), (3, 1), (3, 6), (3, 2), (4, 2), (4, 4), (4, 7), (5, 4), (5, 1), (5, 7);