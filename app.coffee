restify = require 'restify'
utils = require './utils'
mongoose = require 'mongoose'
models = require './models'

respond = (req, res, next) ->
    res.send 'hello' + req.params.name

#using default content-type and formatter provided by restify library
#therefore not initializing servers with any property
app = module.exports = restify.createServer()
mongoose.connect 'mongodb://127.0.0.1/kriti'
app.use restify.acceptParser(app.acceptable)
app.use restify.authorizationParser()
app.use restify.dateParser()
app.use restify.queryParser()
app.use restify.bodyParser(rejectUnknown: false)
app.use restify.throttle(
  burst: 100
  rate: 50
  ip: true
  overrides:
    "192.168.1.1":
      rate: 0
      burst: 0
)
app.use restify.conditionalRequest()
app.get 'hello/:name', respond
app.head 'hello/:name', respond

models.defineModels mongoose, ->
    app.Book = mongoose.model 'Book'
    app.Chapter = mongoose.model 'Chapter'
    app.Section = mongoose.model 'Section'
    app.SectionTemplate = mongoose.model 'SectionTemplate'
    app.ChapterTemplate = mongoose.model 'ChapterTemplate'
    app.BookTemplate = mongoose.model 'BookTemplate'
    

###sectionstore = require('./stores/sectionstore').sectionstore
chapterstore = require('./stores/chapterstore').chapterstore
bookstore = require('./stores/bookstore').bookstore
bookstore.populate(chapterstore, sectionstore)

console.log sectionstore.sections

#console.log bookstore.findAll()
###
require('./routes/books') app
require('./routes/templates') app

app.listen 8181, ->
    console.log '%s listening at %s', app.name, app.url
    
