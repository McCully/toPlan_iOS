process.env.NODE_ENV = 'test';

var mongoose = require('mongoose');
var Task = require('../models/task');
var chai = require('chai');
var chairHttp = require('chai-http');
var server = require('../server');
var should = chai.should();

chai.use(chaiHttp);

describe('Tasks' , ())
