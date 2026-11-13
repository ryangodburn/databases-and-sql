-- a. List the first name, middle initial, and last name of all employees who earn more than the average salary of all employees.
SELECT Fname, Minit, Lname
FROM employee
WHERE Salary > (SELECT AVG(Salary) FROM employee);

-- b. List the first name, last name, and address of all employees who have a son as a dependent but do not have a daughter as a dependent.
SELECT Fname, Lname, Address
FROM employee
WHERE Ssn IN (
 SELECT Essn FROM dependent WHERE Relationship = 'Son'
) AND Ssn NOT IN (
 SELECT Essn FROM dependent WHERE Relationship = 'Daughter'
);
-- c. List the full name (first name, middle initial, and last name) of each employee in a single column named , sorting the employees in alphabetical order by last name. If the employee has a supervisor, list the full name of the supervisor in a single column named .
SELECT CONCAT(e.Fname, ' ', e.Minit, '. ', e.Lname) AS Employee,
 (SELECT CONCAT(s.Fname, ' ', s.Minit, '. ', s.Lname) FROM
employee s WHERE s.Ssn = e.Super_ssn) AS Supervisor
FROM employee e
ORDER BY e.Lname;

-- d. List the name and total working hours for all projects based in Houston that have more than two employees working on them.
SELECT Pname, SUM(Hours) as Total_Hours
FROM project p JOIN works_on w ON p.Pnumber = w.Pno
WHERE Plocation = 'Houston'
GROUP BY Pname
HAVING COUNT(DISTINCT Essn) > 2;

-- e. List the SSN, first name, middle initial, and last name of all employees who work in the department that has the employee with the highest salary among all employees.
SELECT Ssn, Fname, Minit, Lname
FROM employee
WHERE Dno = (
 SELECT Dno FROM employee WHERE Salary = (SELECT MAX(Salary)
FROM employee)
);

-- f. List the project name and the department that manages that project for all projects that have supervisors working on them for at least 20 hours.
SELECT Pname, Dname
FROM project p
JOIN department d ON p.Dnum = d.Dnumber
JOIN works_on w ON p.Pnumber = w.Pno
JOIN employee e ON w.Essn = e.Ssn
WHERE w.Hours >= 20 AND e.Super_ssn IS NOT NULL
GROUP BY Pname, Dname;

-- g. List the name of the department whose employees have the greatest total of dependents.
SELECT D.Dname
FROM department D, employee E, dependent DE
WHERE D.Dnumber = E.Dno AND E.Ssn = DE.Essn
GROUP BY D.Dname
ORDER BY COUNT(*) DESC
LIMIT 1;

-- h. List the location(s) of the department that works the fewest number of hours on projects.
SELECT Dlocation
FROM dept_locations dl JOIN department d ON dl.Dnumber =
d.Dnumber
GROUP BY Dlocation
ORDER BY SUM((SELECT SUM(Hours) FROM works_on w JOIN project p ON
w.Pno = p.Pnumber WHERE p.Dnum = d.Dnumber)) ASC
LIMIT 1;