CREATE DATABASE Company;
USE Company;
create TABLE Company(
	c_id INT NOT NULL auto_increment,
	c_name VARCHAR(255),
	PRIMARY KEY(C_ID),
);
CREATE TABLE Employee(
	e_id INT NOT NULL auto_increment,
	e_name VARCHAR(255),
	salary INT,
	c_id INT NOT NULL,
	PRIMARY KEY(e_id),
	FOREIGN KEY(c_id) REFERENCES company(c_id),
);
CREATE TABLE Projects(
	p_id INT NOT NULL auto_increment,
	p_tittle VARCHAR(100),
	e_id INT NOT NULL,
	PRIMARY KEY(p_id),
	FOREIGN KEY(e_id) REFERENCES Employee(e_id),
);
INSERT INTO Company(c_name)
VALUES
('Google'),
('Tesla');

INSERT INTO Employee(e_name,salary,c_id)
values
('Ali',20000,1),
('pejman',50000,2);

INSERT INTO Projects(p_tittle,e_id)
VALUES
('HTML',2),
('PYTHON',1);

SELECT c_name,e_name,p_tittle FROM Projects INNER JOTN Employee ON Projects.e_id = Employee.e_id INNER JOIN Company ON Company.c_id = Employee.c_id;

SELECT e_name,c_name,p_tittle FROM Company RIGHT JOIN Employee ON Company.c_id = Employee.c_id LEFT JOIN Projects ON Projects.e_id = Employee.e_id;