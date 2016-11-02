var express = require('express');
var router = express.Router();
var Message = require('./models/message');

router.use(function timeLog(req, res, next){
  console.log("Request Recieved: " , dateDisplayed(Date.now()));
  next();
});

router.get('/', function(req, res){
  res.json({message: "Rest API"});
});

router.route('/messages').get(function(req, res) {
  Message.find(function(err, messages) {
    if (err)
    res.send(err);
    res.json(messages);
  });
});

router.route('/messages').post(function(req, res) {
  var message = new Message();
  message.text = req.body.text;
	message.user = req.body.user;
  message.save(function(err) {
    if (err)
    res.send(err);
    res.json({ message: 'Message created successfully!' });
  });
});

router.route('/messages/:message_id').get(function(req, res) {
  Message.findById(req.params.message_id, function(err, message) {
    if (err)
    res.send(err);
    res.json(message);
  });
});

router.route('/messages/:message_id').put(function(req, res) {
  Message.findById(req.params.message_id, function(err, message) {
    if (err)
    res.send(err);
	  message.text = req.body.text;
    message.save(function(err) {
      if (err)
      res.send(err);
      res.json({ message: 'Message successfully updated!' });
    });
  });
});

router.route('/messages/:message_id').delete(function(req, res) {
  Message.remove({
    _id: req.params.message_id
  }, function(err, message) {
    if (err)
    res.send(err);
    res.json({ message: 'Successfully deleted message!' });
  });
});


module.exports = router;

function dateDisplayed(timestamp) {
  var date = new Date(timestamp);
  return (date.getMonth() + 1 + '/' + date.getDate() + '/' + date.getFullYear()+ " " + date.getHours() + ':' + date.getMinutes());
}
