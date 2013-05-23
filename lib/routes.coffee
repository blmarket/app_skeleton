config = require '../config.json'

route = (app) ->
  app.get '/', (req, res) ->
    res.render 'index.jade', {
      title: 'hello world'
    }

module.exports.route = route
