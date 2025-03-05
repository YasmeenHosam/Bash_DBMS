# Bash_DBMS
Project Description:
This project is a simple Database Management System (DBMS) written in Bash. It allows users to create, manage, and manipulate databases and tables using a command-line interface. The system uses directories to represent databases and text files to represent tables.

Features:
Database Operations

Create a new database

List all available databases

Use a database

Drop (delete) a database

Table Operations (When inside a database)

Create a table

Alter a table (add columns)

Insert data into a table

Select (view) data from a table

Update table records

Delete specific records from a table

Drop (delete) a table

📂 Project Structure:

project-folder/
│-- databases/        # Stores all databases as directories
│   ├── db1/          # Example database directory
│   │   ├── table1.txt  # Example table stored as a text file
│   │   ├── table2.txt
│   ├── db2/
│-- dbms.sh          # Main Bash script to run the DBMS
│-- README.md        # Project documentation

🚀 How to Use

1️⃣ Run the Script

Make sure the script is executable:

chmod +x dbms.sh
./dbms.sh

2️⃣ Main Menu Options

Once you run the script, you will see a menu with the following options:

--------------------------------
Simple Bash DBMS
1) Create Database
2) Show Databases
3) Use Database
4) Drop Database
5) Exit
--------------------------------

3️⃣ Using a Database

When you select "Use Database", you will enter another menu for table management:

--------------------------------
Managing Database: my_database
1) Create Table
2) Alter Table
3) Insert into Table
4) Select from Table
5) Update Table
6) Delete from Table
7) Drop Table
8) Back to Main Menu
--------------------------------

You can now perform different operations on tables within the selected database.

📌 Implementation Details

Databases are represented as directories inside the databases/ folder.

Tables are text files (.txt) stored within their respective database directories.

Each row of a table is stored as a new line in the text file.

Basic data handling is implemented using Bash commands like mkdir, ls, rm, sed, and echo.
