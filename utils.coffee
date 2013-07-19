###

These are functions I could'nt find a home for. These would be 'helpers'.

###
fs = require 'fs'

###
Returns a structued message that we send to the user.
###
exports.message = (result, message, options) ->
	if !options
		options = {}

	options.result = result
	options.message = message

	return options

###
Returns a structured error message that will send.
###
exports.error_message = (message, options) ->
	if !options
		options = {}

	options.result = false
	options.message = message

	return options

###
Lists all Files recursivevly.

This is used mainly to load files from a directory tree, such as schemas and handlers
###
exports.walk = (dir, fn) ->
	results = []

	fs.readdir dir, (err, list) ->
		if err
			return fn err
		
		i = 0
		next = ->
			file = list[i++]
			if !file 
				return fn null, results
			file = dir + '/' + file
			fs.stat file, (err, stat) ->
				if stat && stat.isDirectory()
					exports.walk file, (err, res) ->
						results = results.concat res
						next()
				else
					results.push file
					next()

		next()