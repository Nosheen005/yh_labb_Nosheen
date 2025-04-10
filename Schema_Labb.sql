CREATE TABLE VocationalUniversity (
    university_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    establishment_date DATE
);


CREATE TABLE Address (
    address_id SERIAL PRIMARY KEY,
    street VARCHAR(100),
    zipcode VARCHAR(10),
    city VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE Location (
    location_id SERIAL PRIMARY KEY,
    address_id INT REFERENCES Address(address_id),
    university_id INT REFERENCES VocationalUniversity(university_id)
);

CREATE TABLE Program (
    program_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    location_id INT REFERENCES Location(location_id)
);

CREATE TABLE Course (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(20) NOT NULL,
    points INT,
    short_description TEXT,
    independent_course BOOLEAN DEFAULT FALSE
);

CREATE TABLE CourseProgram (
    course_program_id SERIAL PRIMARY KEY,
    program_id INT REFERENCES Program(program_id),
    course_id INT REFERENCES Course(course_id),
    UNIQUE(program_id, course_id)  -- Optional: avoid duplicates
);

CREATE TABLE Employee (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    role VARCHAR(50),            -- "Coordinator", "Teacher"
    employment_type VARCHAR(20), -- "Permanent", "Consultant"
    hired_date DATE
);

CREATE TABLE ConsultantCompany (
    company_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    org_number VARCHAR(20),
    f_skatt BOOLEAN,
    address_id INT REFERENCES Address(address_id)
);

CREATE TABLE Consultant (
    consultant_id SERIAL PRIMARY KEY,
    employee_id INT UNIQUE REFERENCES Employee(employee_id),
    company_id INT REFERENCES ConsultantCompany(company_id),
    hourly_rate DECIMAL(10,2)
);

CREATE TABLE Class (
    class_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    start_date DATE,
    end_date DATE,
    program_id INT REFERENCES Program(program_id),
    coordinator_id INT REFERENCES Employee(employee_id),
    location_id INT REFERENCES Location(location_id),
     course_id INT REFERENCES Course(course_id)
);

CREATE TABLE Student (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    date_of_birth DATE,
    gender VARCHAR(10),
    address_id INT REFERENCES Address(address_id)
);

CREATE TABLE Enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES Student(student_id),
    class_id INT REFERENCES Class(class_id),
    enrollment_date DATE
);


CREATE TABLE PersonalInformation (
    personal_info_id SERIAL PRIMARY KEY,
    personnummer VARCHAR(20),
    phone_number VARCHAR(20),
    emergency_contact_name VARCHAR(100),
    emergency_contact_phone VARCHAR(20),
    student_id INT UNIQUE REFERENCES Student(student_id),
    employee_id INT UNIQUE REFERENCES Employee(employee_id)
);
