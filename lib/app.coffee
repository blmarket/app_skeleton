http = require 'http'
path = require 'path'
express = require 'express'
RedisStore = require('connect-redis')(express)

routes = require './routes'

app = express()

app.configure ->
  app.set 'port', process.env.PORT || 4000
  app.set 'views', path.resolve(__dirname, '../views')
  app.set 'view engine', 'jade'

  if 'development' == app.get('env')
    app.use express.logger('dev')
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser()
  app.use express.session {
    secret: 'skpallk123jl1k2fvdvsadf!!@$#!@#'
    store: new RedisStore()
  }
  app.use app.router
  app.use express.static(path.resolve(__dirname, '../public'))
  if 'development' == app.get('env')
    app.use express.errorHandler()

routes.route app

http.createServer(app).listen app.get('port'), ->
  console.log "Listening on port #{app.get('port')}"
