fs = require("fs")
module.exports = (app) ->
  fs.readdirSync(__dirname).forEach (file) ->
    return  if file is "index.js"
    name = file.substr(0, file.indexOf("."))
    require("./" + name) app
