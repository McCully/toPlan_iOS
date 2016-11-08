var express    = require('express');
var app        = express();
var bodyParser = require('body-parser');
var Todo       = require('./app/taskRoute.js');
var passport   = require('passport');
// var expressSession = require('express-session');
var mongoose   = require("mongoose");
var path       = require('path');
var router = express.Router();

/** ---------- MONGOOSE CONNECTION HANDLING ---------- **/
var databaseUri = 'mongodb://localhost:27017/restdb';
mongoose.connect(databaseUri);
mongoose.connection.on('connected' , function(){
  console.log("Eagle One has connected to: " , databaseUri);
});
mongoose.connection.on('error' , function(err){
  console.log("Eagle one failed because error: " , err);
})



// app.use(expressSession({secret: 'mySecretKey'}));
// app.use(passport.initialize());
// app.use(passport.session());
//
// passport.serializeUser(function(user, done) {
//   done(null, user._id);
// });

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use('/taskRoute', Todo);

app.set('port' , (process.env.PORT || 8080));
app.listen(app.get('port') , function(){
  console.log('Listening on port: ' , app.get('port'));
});
