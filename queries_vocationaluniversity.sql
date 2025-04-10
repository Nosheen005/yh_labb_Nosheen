-- Use the correct schema
SET search_path TO project;

-- 1. Coordinators and their classes
SELECT 
  e.first_name || ' ' || e.last_name AS coordinator_name,
  c.name AS class_name,
  c.start_date,
  c.end_date
FROM Class c
JOIN Employee e ON c.coordinator_id = e.employee_id
WHERE e.role = 'Coordinator';

-- 2. Classes in each program and their courses
SELECT 
  p.name AS program_name,
  cl.name AS class_name,
  co.course_name,
  cl.start_date
FROM Class cl
JOIN Program p ON cl.program_id = p.program_id
JOIN Course co ON cl.course_id = co.course_id
ORDER BY p.name, cl.name;

-- 3. Courses in each program via CourseProgram (excluding independent courses)
SELECT 
  pr.name AS program_name,
  cr.course_name,
  cr.course_code,
  cr.independent_course
FROM CourseProgram cp
JOIN Program pr ON cp.program_id = pr.program_id
JOIN Course cr ON cp.course_id = cr.course_id
WHERE cr.independent_course = false
ORDER BY pr.name;

-- 4. Students enrolled in each class
SELECT 
  st.first_name || ' ' || st.last_name AS student_name,
  cl.name AS class_name,
  en.enrollment_date
FROM Enrollment en
JOIN Student st ON en.student_id = st.student_id
JOIN Class cl ON en.class_id = cl.class_id
ORDER BY cl.name, student_name;

-- 5. Personal info for students and employees
SELECT 
  pi.personnummer,
  pi.phone_number,
  pi.emergency_contact_name,
  pi.student_id,
  pi.employee_id
FROM PersonalInformation pi
ORDER BY pi.student_id NULLS LAST, pi.employee_id NULLS LAST;
