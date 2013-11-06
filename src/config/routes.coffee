
# Routes
{print} = require 'sys'
async = require 'async'
{log, error} = console; print = log
{spawn, exec} = require 'child_process'
io = require('socket.io').listen(7777)
languageConfig = require '../../languageConfig'

module.exports = (app, passport) ->

	run = (command, socket, cb) ->
		cb = cb ? () ->
		proc = exec command, (err, stdout, stderr) ->
			console.warn stderr if stderr
			
			cb?() unless err
		proc.stdout.on('data', (buffer) -> socket.emit 'benchmarkStatus', buffer.toString().trim())
		proc.stderr.on('data', (buffer) -> socket.emit 'benchmarkStatus', buffer.toString().trim())
		proc.on 'exit', (status) ->
			socket.emit 'benchmarkDone', true
			cb()
	io.sockets.on 'connection', (socket) ->
		socket.on 'benchmark', (lang) ->
			console.log 'LANG'
			langConfig = languageConfig[lang]
			# run "killall #{lang}", socket
			console.log "Starting #{lang} server..."
			run "#{langConfig.command} ../servers/#{lang}/server.#{langConfig.extension}", socket
			console.log 'Running benchmark tests...'
			run "ab -c 100 -n 10000 http://127.0.0.1:#{langConfig.port}/", socket

	
	app.get '/', (req, res) ->
		res.render 'index', {languages : languageConfig}



