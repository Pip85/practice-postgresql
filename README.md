# **sql-db-employee-analysis**

Student project - Analyze employee records from the 1980's & 1990's.

## **software/tools used**

ERD & Table Schema per Quick Database Diagrams:   https://www.quickdatabasediagrams.com<br>
PostgreSQL 13:  https://www.postgresql.org/<br>
pgAdmin 4:  https://www.pgadmin.org/<br>
pandas:  https://pandas.pydata.org/<br>
Jupyter Notebook:  https://jupyter.org/<br>

## **project background**

It is a beautiful spring day, and it is two weeks since you have been hired as a new data engineer at Pewlett Hackard. Your first major task is a research project on employees of the corporation from the 1980s and 1990s. All that remain of the database of employees from that period are six CSV files.

In this assignment, you will design the tables to hold data in the CSVs, import the CSVs into a SQL database, and answer questions about the data. In other words, you will perform:

1. Data Engineering

3. Data Analysis

---
## **acknowledgement**
Background and datasets provided as part of Georgia Tech Data Analytics Boot Camp:<br>
Mockaroo, LLC. (2021). Realistic Data Generator. [https://www.mockaroo.com/](https://www.mockaroo.com/)<br>
© 2021 Trilogy Education Services, LLC, a 2U, Inc. brand. Confidential and Proprietary. All Rights Reserved.

Author:  Valerie Pippenger - https://github.com/Pip85

## **process**

The first challenge was to produce an ERD of the 6 tables to be used in the SQL database for analysis.
This was done using the Quick Database diagrams application. The application also produces a table schema output for use in the SQL database.

ERD:
![ERD](https://github.com/Pip85/sql-db-employee-analysis/blob/main/EmployeeSQL/ERD.png)

Table Schema:  https://github.com/Pip85/sql-db-employee-analysis/blob/main/EmployeeSQL/Table_Schema.sql

Using pgAdmin4, the database was created and the table schema was run within the database.  Now the database included 6 empty tables for employee, salary, department and title information.
The 6 provided csv files were then imported, using pgAdmin4, into their respective tables.
Eight queries were then run on the data.  Details can be found in the queries file included in this repository.
Queries:  https://github.com/Pip85/sql-db-employee-analysis/blob/main/EmployeeSQL/Queries.sql

For the bonus section, a Jupyter Notebook was created.  The SQL database was then imported into the notebook using sqlalchemy.  Data was imported into salaries, employees and titles dataframes for use in plots.  The first plot is a histogram showing the salary ranges of employees.

The second plot required merging the data from all 3 dataframes.  A bar chart was then created based on the
average salary by job title.