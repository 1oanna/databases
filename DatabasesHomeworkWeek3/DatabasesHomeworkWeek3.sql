CREATE DATABASE company;

use company;

CREATE TABLE Supervisors
	(Supervisor_number INT UNISIGNED PRIMARY KEY AUTOINCREMENT NOT NULL,
	 Supervisor_name varchar(45) NOT NULL)
	ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Departments
	(Department_name varchar(45) PRIMARY KEY NOT NULL)
	ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Employees
	(Employee_number INT UNSIGNED NOT NULL PRIMARY KEY AUTOINCREMENT,
	 Employee_name varchar(45) NOT NULL)
	ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Projects
	(Project_number INT UNSIGNED NOT NULL PRIMARY KEY AUTOINCREMENT,
	 Project_name varchar(45) NOT NULL)
	ENGINE=InnoDB DEFAULT CHARSET=utf8;			

CREATE TABLE Employee_Departments
	(Department_name varchar(45) NOT NULL,
	 Employee_number INT UNSIGNED NOT NULL,
		PRIMARY KEY(Department_name),
		PRIMARY KEY(Employee_number),
		FOREIGN KEY(Department_name) REFERENCES Departments(Department_name) ON DELETE CASCADE,
		FOREIGN KEY(Employee_number) REFERENCES Employees(Employee_number) ON DELETE CASCADE
		)
	ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Employee_Projects
	(Employee_number INT UNSIGNED NOT NULL,
	 Project_number INT UNSIGNED NOT NULL,
		PRIMARY KEY(Employee_number),
		PRIMARY KEY(Project_number),
		FOREIGN KEY(Employee_number) REFERENCES Employees(Employee_number) ON DELETE CASCADE,
		FOREIGN KEY(Project_number) REFERENCES Projects(Project_number) ON DELETE CASCADE
		)
	ENGINE=InnoDB DEFAULT CHARSET=utf8;	

