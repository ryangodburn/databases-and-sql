-- a.  List the first name, middle initial, and last name of all employees who earn a salary between 32000 and 45000.
SELECT Fname, Minit, Lname
FROM employee
WHERE Salary BETWEEN 32000 AND 45000; 

-- b. List the first name, last name, and address of all employees who do not have any dependents
SELECT Fname, Lname, Address
FROM employee
WHERE Ssn NOT IN (SELECT Essn FROM dependent); 

-- c. List the first name, last name, and address of all employees who have dependents other than sons or daughters.
SELECT Fname, Lname, Address
FROM employee
WHERE Ssn IN (SELECT Essn FROM dependent WHERE Relationship NOT IN ('Son', 'Daughter')); 

-- d. List the full name (first name, middle initial, and last name) of each employee in a single column named “Employee”, that are member of the "Administration" department, sorting the employees in alphabetical order by last name. 
SELECT CONCAT(Fname, ' ', Minit, ' ', Lname) AS Employee
FROM employee
WHERE Dno = (SELECT Dnumber FROM department WHERE Dname = 'Administration')
ORDER BY Lname;

-- e. List the full name (first name, middle initial, and last name) of each employee in a single column named “Employee”, that are member of the department managed by the person with last name 'Wong'.  sorting the employees in alphabetical order by full name. 
SELECT CONCAT(Fname, ' ', Minit, ' ', Lname) AS Employee
FROM employee
WHERE Dno = (SELECT Dnumber FROM department WHERE Mgr_ssn = (SELECT Ssn FROM employee WHERE Lname = 'Wong'))
ORDER BY Employee;

-- f. List the full name (firstemployee name, middle initial, and last name) of each employee in a single column named “Employee”, sorting the employees in alphabetical order by last name. If the employee has a supervisor, list the full name of the supervisor in a single column named “Supervisor”.
SELECT CONCAT(e1.Fname, ' ', e1.Minit, '. ', e1.Lname) AS Employee,
       (SELECT CONCAT(e2.Fname, ' ', e2.Minit, '. ', e2.Lname) 
        FROM employee e2 
        WHERE e2.Ssn = e1.Super_ssn) AS Supervisor
FROM employee e1
ORDER BY e1.Lname;

-- h. List the project names and their respective project locations that belong to the Research Department. 
SELECT Pname, Plocation
FROM project
WHERE Dnum = (SELECT Dnumber FROM department WHERE Dname = 'Research'); 

-- i. List the distinct project names and their respective locations that are worked on by members of the Research Department
SELECT DISTINCT p.Pname, p.Plocation
FROM works_on w
JOIN project p ON w.Pno = p.Pnumber
JOIN employee e ON w.Essn = e.Ssn
JOIN department d ON e.Dno = d.Dnumber
WHERE d.Dname = 'Research';
