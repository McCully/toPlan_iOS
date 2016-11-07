var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var tasksSchema   = new Schema({
    text: String,
    user: String
});

module.exports = mongoose.model('Tasks', tasksSchema);
