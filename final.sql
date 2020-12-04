WHENEVER SQLERROR CONTINUE NONE
DROP TABLE student_info;
DROP TABLE module_instructor;
DROP TABLE module_info;
DROP TABLE specification;
DROP TABLE courses;
DROP TABLE accommodation;
DROP TABLE instructor_info;
DROP TABLE email_info;
DROP TABLE person;
DROP TABLE addresses;

CREATE TABLE addresses(
    address_id INT,
    country VARCHAR(15),
    provience VARCHAR(15),
    city VARCHAR(15),
    street VARCHAR(15),
    house_no INT,
    address_phone VARCHAR(10),
    address_fax VARCHAR(15),
    CONSTRAINT address_pk PRIMARY KEY (address_id)
);

CREATE TABLE person(
    person_id INT,
    fist_name VARCHAR(15),
    last_name VARCHAR(15),
    age INT,
    DOB DATE,
    sex VARCHAR(6),
    mobile_number VARCHAR(10),
    address_id INT,
    CONSTRAINT person_pk PRIMARY KEY (person_id),
    CONSTRAINT person_fk FOREIGN KEY (address_id) REFERENCES addresses(address_id)
);

CREATE TABLE email_info(
    email_id INT,
    email VARCHAR(30),
    person_id INT,
    CONSTRAINT email_pk PRIMARY KEY (email_id),
    CONSTRAINT email_fk FOREIGN KEY (person_id) REFERENCES person(person_id)
);

CREATE TABLE instructor_info(
    instructor_id INT,
    person_id INT,
    exp_year INT,
    CONSTRAINT instructor_pk PRIMARY KEY (instructor_id),
    CONSTRAINT instructor_fk FOREIGN KEY (person_id) REFERENCES person(person_id)
);

CREATE TABLE accommodation(
    accommodation_id INT,
    accommodation_type VARCHAR(10),
    accommodation_price INT,
    accommodation_location INT,
    CONSTRAINT accommodation_pk PRIMARY KEY (accommodation_id),
    CONSTRAINT accommodation_fk FOREIGN KEY (accommodation_location) REFERENCES addresses(address_id)
);

CREATE TABLE courses(
    course_id INT,
    course_name VARCHAR(30),
    course_price INT,
    course_type VARCHAR(10),
    leader_id INT,
    CONSTRAINT courses_pk PRIMARY KEY (course_id),
    CONSTRAINT courses_fk FOREIGN KEY(leader_id) REFERENCES instructor_info(instructor_id)
);

CREATE TABLE specification(
    specification_id INT,
    specification_name VARCHAR(30),
    course_id INT,
    CONSTRAINT specification_pk PRIMARY KEY (specification_id),
    CONSTRAINT specification_fk FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE module_info(
    module_id INT,
    module_name VARCHAR(30),
    CONSTRAINT module_pk PRIMARY KEY (module_id)
);
CREATE TABLE module_instructor(
    module_id INT,
    instructor_id INT,
    salay INT,
    instructor_status VARCHAR(30),
    CONSTRAINT module_instructor_fk FOREIGN KEY (module_id) REFERENCES module_info(module_id),
    CONSTRAINT module_instructor_fk2 FOREIGN KEY(instructor_id) REFERENCES instructor_info(instructor_id)
);

CREATE TABLE student_info(
    student_id INT,
    person_id INT,
    accommodation_id INT,
    course_id INT,
    CONSTRAINT student_info_fk FOREIGN KEY (person_id) REFERENCES person(person_id),
    CONSTRAINT student_info_fk2 FOREIGN KEY(accommodation_id) REFERENCES accommodation(accommodation_id),
    CONSTRAINT student_info_fk3 FOREIGN KEY(course_id) REFERENCES courses(course_id)
);

INSERT INTO addresses VALUES(1,'nepal','bagmati','kathmandu', 'mahankal',331,'9843773217','1541514514');
INSERT INTO person VALUES(1,'samrat','ghale',19,'25-JAN-18','male','9843773217',1);
INSERT INTO person VALUES(2,'kausal','gurung',19,'25-JAN-20','male','9843773217',1);
INSERT INTO email_info VALUES(1,'sarmat.biz19@gmail.com',1);
INSERT INTO email_info VALUES(2,'kausal.biz19@gmail.com',2);
INSERT INTO instructor_info VALUES(1,2,5);
INSERT INTO accommodation VALUES(1,'full time',300,1);
INSERT INTO courses VALUES(1,'BBA',4000,'full time',1);
INSERT INTO specification VALUES(1,'international business',1);
INSERT INTO module_info VALUES(1,'networking');
INSERT INTO module_instructor VALUES(1,1,4000,'active');
INSERT INTO student_info VALUES(1,1,1,1);

select * from addresses;
select * from person; 
select * from email_info;
select * from instructor_info;
select * from accommodation;
select * from courses;
select * from specification;
select * from module_info;
select * from module_instructor;
select * from student_info;
