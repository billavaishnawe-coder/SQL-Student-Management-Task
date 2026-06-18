CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(50)
);
CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    grade INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
INSERT INTO courses(course_name)
VALUES
('SQL'),
('Python'),
('Power BI'),
('Excel');
INSERT INTO enrollments(student_id, course_id, grade)
VALUES
(1,1,85),
(2,1,76),
(3,2,92),
(4,2,68),
(5,3,81),
(6,3,95),
(7,4,35),
(8,4,88),
(9,1,77),
(10,2,84);

select s.name,c. course_name
from students s
join enrollments e 
on s.student_id = e.student_id
join courses c
on c.course_id=e.course_id;

select c.course_name , avg(e.grade) as average_grade_per_course
from enrollments e
join courses c
on c.course_id=e.course_id
group by c.course_name;

select s.name , avg(e.grade) as average_grade_per_course 
from enrollments e
join courses c 
on c.course_id=e.course_id
join students s
on s.student_id=e.student_id
group by s.name
limit 3;

select COUNT(*) as failed_students
from enrollments
where grade < 40;