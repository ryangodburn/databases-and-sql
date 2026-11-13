-- Assignment 09
-- Ryan Godburn 

-- 1. Give Tom the privilege to read the entire Department table, insert rows into the Department table, and pass on these privileges to other users.
GRANT SELECT, INSERT ON company.department TO Tom WITH GRANT OPTION;

-- 2. Revoke Tom’s privilege to insert rows into the Department table and revoke this privilege from anyone who received that privilege from Tom.
REVOKE INSERT ON company.department FROM Tom CASCADE;

-- 3. Give Jessica the privilege to insert or update rows in the Works_On table, but do not allow Jessica to pass these privileges on to other users.
GRANT INSERT, UPDATE ON company.works_on TO Jessica;

-- 4. Give Mark the privilege to view the names and addresses of all employees who work for the Research department.
CREATE VIEW research_employees AS
SELECT Fname, Lname, Address
FROM company.employee
WHERE Dno = (SELECT Dnumber FROM company.department WHERE Dname = 'Research');
GRANT SELECT ON research_employees TO Mark;

-- 5. Give Allison the privilege to read the entire Dependent table and to use the primary key in that table as a foreign in other tables she creates in the database.
GRANT SELECT, REFERENCES (Essn, Dependent_name) ON company.dependent TO Allison;