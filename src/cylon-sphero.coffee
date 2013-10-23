###
 * cylon-sphero
 * http://cylonjs.com
 *
 * Copyright (c) 2013 The Hybrid Group
 * Licensed under the Apache 2.0 license.
###

'use strict';

module.exports =
  adaptor: (args...) ->
    new Sphero(args...)

  register: (robot) ->
    console.log "Registering Sphero adaptor for #{robot.name}"
    robot.registerAdaptor 'sphero', 'sphero'

Spheron = require('spheron')

class Sphero
  self = this

  constructor: (opts) ->
    @connection = opts.connection
    @name = opts.name
    @sphero = Spheron.sphero()

  connect: ->
    console.log "Connecting to Sphero '#{@name}'..."
    @sphero.open(@connection.port);
    self

  disconnect: ->
    console.log "Disconnecting from Sphero '#{@name}'..."
    @sphero.close
