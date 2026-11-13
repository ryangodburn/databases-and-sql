# Databases and SQL

Coursework from **Databases and SQL** at the **University of New Haven**, Fall 2023 (second year, fall semester).

- **Author:** Ryan Godburn
- **Tools:** MySQL 8.0

## Files

| File | Assignment | Topics |
| --- | --- | --- |
| `RGodburn_Assign03-2.sql` | Assignment 3 | Queries against the COMPANY sample database (`employee`, `department`, `dependent`, `project`, `works_on`): `BETWEEN`, `IN` / `NOT IN` subqueries, `CONCAT` for full names, a self-join to list each employee's supervisor, and multi-table joins. |
| `RGodburn_Assign04-1.sql` | Assignment 4 | Harder COMPANY queries: comparisons against `AVG` and `MAX`, `GROUP BY` with `HAVING`, `COUNT(DISTINCT ...)`, and `ORDER BY ... LIMIT 1` to find the department with the most dependents or the fewest project hours. |
| `RGodburn_Assignment06.sql` | Assignment 6 | MySQL dump of a `soccerleague` schema designed for the assignment: `teams`, `players`, `positions`, `games` and `game_details`, with primary keys, composite keys and foreign-key constraints. |
| `RGodburn_Assignment09-1.sql` | Assignment 9 | Database security: `GRANT` / `REVOKE` (including `WITH GRANT OPTION` and `CASCADE`), column-level `REFERENCES` privileges, and a view that limits a user to the Research department's employees. |
| `tutoringservice.sql` | Tutoring service database | MySQL dump of a `tutoringservice` database (`students`, `tutors`, `sessions`) with sample rows and foreign keys using `ON DELETE RESTRICT` / `ON UPDATE CASCADE`. |

## Running the scripts

The two dumps (`RGodburn_Assignment06.sql` and `tutoringservice.sql`) recreate their databases on their own:

```bash
mysql -u root -p -e "CREATE DATABASE tutoringservice"
mysql -u root -p tutoringservice < tutoringservice.sql
```

Assignments 3, 4 and 9 are query scripts. They need the COMPANY database from the Elmasri & Navathe textbook, which isn't included here.

---

*Archived coursework, shared as part of my portfolio. If you're taking this course now, please follow your instructor's academic integrity policy.*
