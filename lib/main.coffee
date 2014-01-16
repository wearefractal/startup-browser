exec    = require('child_process').exec
path    = require 'path'
express = require 'express'
clone   = require './clone'

app = express()
app.use express.query()
app.use express.json()
app.use express.urlencoded()
console.log __dirname + '/public'
app.use express.static(__dirname+'/public')
app.use "/samples", express.static(path.resolve('./Developer/samples'))
app.use "/common-files", express.static(path.resolve('./Developer/common-files'))
app.use "/flat-ui", express.static(path.resolve('./Developer/flat-ui'))

app.post "/clone", (req, res) ->

  clone path.resolve("./Developer/samples/sample-#{req.body.sample}"), req.body.path

app.listen 3000, -> exec "open http://localhost:3000"

