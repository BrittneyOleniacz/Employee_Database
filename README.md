# Employee Database

## Background
The task is to conduct research on employees of the corporation from the 1980s and 1990s. Howver, all that remains of the database of employees from that period are six CSV files. Design tables to hold data in the CSVs, import the CSVs into a SQL database, and answer questions about the data. 

## Instructions
#### Data Modeling
Inspect the CSVs and sketch out an ERD of the tables by using a tool like http://www.quickdatabasediagrams.com

![ERD](ERDs/rearrangedERD.png)

#### Data Engineering
- - -
* Create a table schema for each of the six CSV files and specify the data types, primary keys, foreign keys, and other constraints.
  * Primary keys should be reserved for unique columes, otherwise create a [composite key] (https://en.wikipedia.org/wiki/Compound_key). Which takes to primary keys in order to uniquely identify a row.
  * Be sure to create tables in the correct order to handle foreign keys.

#### Data Analysis
- - -
With the complete database, produce the following:
1. List the following details of each employee: employee number, last name, first name, sex, and salary. 
2. List first name, last name, and hire date for employees who were hired in 1986.
3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
4. List the department of each employee with the following information: employee number, last name, first name, and department name.
5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

As you examine the data, you are overcome with a creeping suspicion that the dataset is fake. You surmise that your boss handed you spurious data in order to test the data engineering skills of a new employee. To confirm your hunch, you decide to take the following steps to generate a visualization of the data, with which you will confront your boss:

1. Import the SQL database into Pandas. This step may require some research. Feel free to use the code below to get started. Be sure to make any necessary modifications for your username, password, host, port, and database name:
2. 
   ```sql
   from sqlalchemy import create_engine
   engine = create_engine('postgresql://localhost:5432/<your_db_name>')
   connection = engine.connect()
   ```
3. Create a histogram to visualize the most common salary ranges for employees.
![salary ranges](images/histogram.png)
4. Create a bar chart of average salary by title.
![avg. salary](images/bar_chart.png)

## Epilogue
Evidence in hand, you march into your boss's office and present the visualization. With a sly grin, your boss thanks you for your work. On your way out of the office, you hear the words, "Search your ID number." You look down at your badge to see that your employee ID number is 499942.
