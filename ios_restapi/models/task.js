var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var taskSchema = new Schema ({
  "title"   : String,
  "notes"   : String,
  "dueDate" : Date
});

module.exports = mongoose.model('Tasks', taskSchema)
