var express = require('express');
var router = express.Router();
var Todo = require('./models/tasks');

// api ---------------------------------------------------------------------
// get all todos
router.get('/', function(req, res) {
	Todo.find({} , function(err, todos) {
		if (err){
			res.sendStatus(500);
			return;
		}
		res.send(todos);
	});
});

	// create todo and send back all todos after creation
router.post('/', function(req, res) {
	Todo.create({
		text : req.body.text
	}, function(err, todo) {
		if (err) {
			res.sendStatus(500);
			return;
		}
		res.sendStatus(201);
	});
});

	// delete a todo
router.delete('/:todo_id', function(req, res) {
	Todo.remove({
		_id : req.params.todo_id
	}, function(err, todo) {
		if (err){
			res.sendStatus(500);
			return;
		}
		res.sendStatus(204);
	});
});

module.exports = router;
