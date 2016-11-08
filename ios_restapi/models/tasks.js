var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var tasksSchema = new Schema({
    task: String,
    user: String
});

var Tasks = mongoose.model('Tasks', tasksSchema);


module.exports = Tasks;
