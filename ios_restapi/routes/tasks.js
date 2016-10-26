var express = require('express');
var router = express.Router();
var Task = require('../models/task');
var mongo = require('mongodb');


// api ----------------------------------------
// get all todos
router.get('/', function(req, res) {
	Task.find({} , function(err, task) {
		if (err){
			res.sendStatus(500);
			return;
		}
		res.send(task);
	});
});

	//get 1 task
router.get('/:id', function(req, res){

	Task.findById(req.params.id,function(err,task){
		if(err){
			res.sendStatus(500);
			return;
		}
		console.log(task);
		res.send(task);
	});
});

	// create todo and send back all todos after creation
router.post('/', function(req, res) {
	var task = Task(req.body);
	console.log(req.body);
	task.save(function(err){
		if(err){
			res.sendStatus(500);
			return;
		}
		res.sendStatus(201);
	});
});

	//Update a todo
router.put('/:id', function(req, res){
	var task = req.body;
	Task.findByIdAndUpdate(req.params.id, task, function(err, task){
		if(err){
			res.sendStatus(500);
			return
		}
		res.sendStatus(204);
	});
});

	// delete a todo
router.delete('/:id', function(req, res) {
	Task.findByIdAndRemove(req.params.id, function(err){
		if(err){
			res.sendStatus(500);
		}
		console.log("Deleted id: " , req.params.id);
		res.sendStatus(204)
  });
});

module.exports = router;
