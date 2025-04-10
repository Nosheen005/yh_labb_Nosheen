-- Target the correct schema
SET search_path TO project;

-- VocationalUniversity
INSERT INTO VocationalUniversity (name, establishment_date) VALUES
  ('YrkesCo Academy', '2015-08-20');

-- Address
INSERT INTO Address (street, zipcode, city, country) VALUES
  ('Sveavägen 10', '11120', 'Stockholm', 'Sweden'),
  ('Lindholmsplatsen 1', '41756', 'Göteborg', 'Sweden'),
  ('Stortorget 2', '21134', 'Malmö', 'Sweden');

-- Location
INSERT INTO Location (address_id, university_id) VALUES
  (1, 1),
  (2, 1),
  (3, 1);

-- Program
INSERT INTO Program (name, description, location_id) VALUES
  ('Fullstack Development', 'Frontend and backend technologies', 1),
  ('Cloud Engineering', 'Cloud infrastructure and DevOps', 2);

-- Course
INSERT INTO Course (course_name, course_code, points, short_description, independent_course) VALUES
  ('Web Development', 'WD101', 20, 'HTML, CSS, JavaScript', false),
  ('Database Systems', 'DB201', 15, 'SQL and relational models', false),
  ('Agile Practices', 'AG303', 5, 'Scrum, Kanban, agile teamwork', true);

-- CourseProgram
INSERT INTO CourseProgram (program_id, course_id) VALUES
  (1, 1),
  (1, 2),
  (2, 2),
  (2, 3);

-- Employee
INSERT INTO Employee (first_name, last_name, email, phone_number, role, employment_type, hired_date) VALUES
  ('Emma', 'Svensson', 'emma.svensson@yrkesco.se', '0701122334', 'Coordinator', 'Permanent', '2021-01-15'),
  ('Lars', 'Johansson', 'lars.johansson@yrkesco.se', '0709988776', 'Teacher', 'Consultant', '2022-05-10'),
  ('Anna', 'Lindgren', 'anna.lindgren@yrkesco.se', '0701234567', 'Coordinator', 'Permanent', '2023-03-01');

-- ConsultantCompany
INSERT INTO ConsultantCompany (name, org_number, f_skatt, address_id) VALUES
  ('TechPartner AB', '556123-7890', true, 2);

-- Consultant
INSERT INTO Consultant (employee_id, company_id, hourly_rate) VALUES
  (2, 1, 850.00);

-- ClassCoordinator
INSERT INTO ClassCoordinator (employee_id, classes_managed) VALUES
  (1, 2),
  (3, 3);

-- Class
INSERT INTO Class (name, start_date, end_date, program_id, coordinator_id, location_id, course_id) VALUES
  ('FS24-1', '2024-08-15', '2026-06-10', 1, 1, 1, 1),
  ('FS24-2', '2024-09-01', '2026-06-30', 1, 3, 2, 2),
  ('CE24-1', '2024-08-15', '2026-06-10', 2, 3, 3, 2);

-- Student
INSERT INTO Student (first_name, last_name, email, phone_number, date_of_birth, gender, address_id) VALUES
  ('Ali', 'Rahimi', 'ali.rahimi@student.se', '0734455667', '1996-04-22', 'Male', 1),
  ('Ella', 'Bergström', 'ella.bergstrom@student.se', '0723344556', '1999-09-12', 'Female', 2),
  ('Sara', 'Nordin', 'sara.nordin@student.se', '0707894561', '1998-03-12', 'Female', 3);

-- Enrollment
INSERT INTO Enrollment (student_id, class_id, enrollment_date) VALUES
  (1, 1, '2024-08-10'),
  (2, 2, '2024-08-12'),
  (3, 3, '2024-08-13');

-- PersonalInformation
INSERT INTO PersonalInformation (
  personnummer, phone_number, emergency_contact_name, emergency_contact_phone, student_id, employee_id
) VALUES
  ('960422-1234', '0734455667', 'Layla Rahimi', '0701234567', 1, NULL),
  ('990912-5678', '0723344556', 'Anna Bergström', '0709876543', 2, NULL),
  ('980312-4567', '0707894561', 'Eva Nordin', '0701231234', 3, NULL),
  ('750101-1111', '0701122334', 'Mikael Svensson', '0705556666', NULL, 1),
  ('830501-2222', '0701234567', 'Erik Lindgren', '0704445555', NULL, 3);
