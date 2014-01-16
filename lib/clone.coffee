fs    = require 'fs'
exec  = require('child_process').exec
path  = require 'path'
rewriteIndex = require './rewriteIndex'
shelljs = require 'shelljs/global'
tilde = (dir) -> dir.replace "~", process.env.HOME

module.exports = (dir, cloneTo) ->

  dir     = tilde dir
  cloneTo = tilde cloneTo

  dev = path.resolve "./Developer"
  console.log dev

  cp "-R", dir+"/*", cloneTo
  mkdir '-p', cloneTo+"/vendor/startup"
  cp "-R", dev+"/common-files/*", cloneTo+"/vendor/startup"
  cp "-R", dev+"/flat-ui", cloneTo+"/vendor"

  index = fs.readFileSync "#{dir}/index.html", 'utf8'
  index = rewriteIndex index
  
  fs.writeFileSync "#{cloneTo}/index.html", index
