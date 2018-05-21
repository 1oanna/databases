/*jshint esversion: 6 */

// This is the connector (also known as driver)
// that we can use to connect to a MySQL process
// and access its databases.
const mysql = require('mysql');

class TodoModel {
	constructor(dbConnection) {
		this.dbConnection = dbConnection;
	}

	// Loads all the TODOs in the database
	load(callback) {
		const selectTodoItems = "SELECT * FROM todo_items";
		this.dbConnection.query(selectTodoItems, function(err, results, fields) {
			if(err) {
				callback(err);
				return;
			}

			callback(null, results);
		});
	}

	create(description, uid, callback) {
		// Write code and query to create a new TODO item
		const ssql = "INSERT INTO todo_items VALUES (NULL, ?, ?, ?)";
		const arParams = [description, 0, uid];

		this.dbConnection.query(ssql, arParams, (err, results, fields) => {
			callback(err, results);
		});

	}

	update(id, description, callback) {
		// Write code and query to update and existing TODO item
		const ssql = "UPDATE todo_items SET text=? WHERE id=? LIMIT 1";
		const arParams = [description, id];

		this.dbConnection.query(ssql, arParams, (err, results, fields) => {
			callback(err, results);
		});
	}

	delete(id, callback) {
		// Write code and query to delete an existing TODO item
		const ssql = "DELETE FROM todo_items WHERE id=? LIMIT 1";
		const arParams = [id];

		this.dbConnection.query(ssql, arParams, (err, results, fields) => {
			callback(err, results);
		});
	}

	tagTodoItem(todoItemId, tagId, callback) {
		// Write code and query add a tag to a TODO item
		const ssql = "REPLACE INTO todo_item_tag VALUES (?, ?)";
		const arParams = [todoItemId, tagId];

		this.dbConnection.query(ssql, arParams, (err, results, fields) => {
			callback(err, results);
		});
	}
		
	untagTodoItem(todoItemId, tagId, callback) {
		// Write code and query remove a tag from a TODO item
		const ssql = "DELETE FROM todo_item_tag WHERE todo_item_id=? AND tag_id=? LIMIT 1";
		const arParams = [todoItemId, tagId];

		this.dbConnection.query(ssql, arParams, (err, results, fields) => {
			callback(err, results);
		});
	}

	markCompleted(todoItemId, callback) {
		// Write code to mark a TODO item as completed
		const ssql = "UPDATE todo_items SET is_completed=1 WHERE id=? LIMIT 1";
		const arParams = [todoItemId];

		this.dbConnection.query(ssql, arParams, (err, results, fields) => {
			callback(err, results);
		});
	}
}

const dbConnection = mysql.createConnection({
	host     : 'localhost',
	user     : 'nodetodoapp',
	password : 'mypassword',
	database : 'todo_app'
});

let args = process.argv.slice(2);
let whatToDo = null;
const todoModel = new TodoModel(dbConnection);

dbConnection.connect(function(err) {
	if (err != null) {
		console.error('error connecting: ' + err.stack);
		return;
	}

	switch(args[0]) {
	    case "load":
	        todoModel.load((err, todoItems) => {
				if(err) {
					console.log("error loading TODO items:", err);
				}

				console.log("existing todo items:", todoItems);
			});
	        break;
	    case "create":
	    	//node index.js create "some test task for user 2" 2
	       	todoModel.create( args[1], args[2], (err, res) => {
				if (!err) {
					console.log("Created todo item");
					return;
				}

				console.log("Oops error in creating new todo", err);
			});
	        break;
	    case "update":
	    	//node index.js update 45 "updated task"
	    	todoModel.update(args[1], args[2], (err, res) => {
				if (!err) {
					console.log('Item updated');
					return;
				}

				console.log("oops error in uppdate", err);
			});

	    	break;
	    case "delete":
	    	//node index.js delete 45
	    	todoModel.delete(args[1], (err, res) => {
				if (!err) {
					console.log("item deleted");
					return;
				}

				console.log("oops error in delete", err);
			});
	    	break;
	    case "tagTodoItem":
	    	//node index.js tagTodoItem 43 2
	    	todoModel.tagTodoItem(args[1], args[2], (err, res) => {
				if (!err) {
					console.log("tag added to item");
					return;
				}

				console.log("oops error in adding item", err);
			});
	    	break;
	    case "untagTodoItem":
	  	 	//node index.js untagTodoItem 43 2
	    	todoModel.untagTodoItem(args[1], args[2], (err, res) => {
				if (!err) {
					console.log("tag removed from item");
					return;
				}

				console.log("oops error in removing item", err);
			});
	    	break;
	    case "markCompleted":
	    	//node index.js markCompleted 43
	    	todoModel.markCompleted(args[1], (err, res) => {
				if (!err) {
					console.log("mark completed item");
					return;
				}

				console.log("oops error in mark complete for item", err);
			});
	    	break;
	    default:
	        console.log("add some args to proceed");
	        break;
	}

	dbConnection.end(); //to close connection and terminate app
});