# sql-challenge

Analyze employee records from the 1980's - 90's.

The first challenge was to produce an ERD of the 6 tables to use in the SQL database for the analysis.
This was done using the Quick Database diagrams application. The application also produces table schema output
for use in the SQL database.

Using pgAdmin4, the database was created and the table schema was run within the database.  Now the database
included 6 empty tables for employee, salary, department and title information.


The 6 provided csv files were then imported, using pgAdmin4, into their respective tables.

Eight queries were then run on the data.  Details can be found in the queries file included in this repository.

For the bonus section, a Jupyter Notebook was created.  The SQL database was then imported into the notebook
using sqlalchemy.  Data was then imported into salaries, employees and titles dataframes for use in plots.

The first plot is a histogram showing the salary ranges of employees.
The second plot required merging the data from all 3 dataframes.  A bar chart was then created based on the
average salary by job title.

 