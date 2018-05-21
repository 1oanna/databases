# databases

--------- Homework week 1 -----------

Draw a database design for a TODO App
Design a database for an app that keeps track of TODO lists of its users. In this app a user can:

Create a TODO item with some text in it
Add tags to the TODO items, like homework, groceries etc..
Mark a TODO item as done


Bonus round:
Write a todo.sql file and put it in the homework folder where you create the database structure from your ERD


World database queries!

Create a database called world and source the SQL data into the database databases/world.sql.

---- Answer the following questions using the world database and put your answers in your homework

-- What are the names of all the cities in the Netherlands?

-- What is the population of Rotterdam ?

-- What's the name of all the countries on the continent ‘North America’ ?

-- What's the top 10 countries by SurfaceArea ?

-- What's the top 10 most populated cities?

-- Select the top 3 countries by population that their names start with the letter ‘P’

-- What is the population in Asia?

-- Which languages are spoken in the Region of ‘South America’

-- What are the languages spoken on all cities named ‘Barcelona’ (you may need to join 3 tables =) )





--------- Homework week 2 -----------

Create a database called todo_app.

Write a model to communicate with the database through node.
 
Add a new database user

Until now we've always connected to the database as root. 
We don't want to allow our TODO app access to other databases than the TODO app itself:
Figure out how to create a new user in MySQL.
Restrict the access for that user to only the todo_app database.
Use the newly created user credentials (username, password) in the connector of the index.js file.

Make a program in order for your newly created user to be able to extract TODOs from the database, update them, and delete them via mysql command prompt while the program runs on node.


