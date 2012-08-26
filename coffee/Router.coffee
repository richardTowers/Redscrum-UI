###global define ###

define ['underscore', 'backbone'],
  (_, Backbone) ->
    'use strict'
    Backbone.Router.extend
      routes:
        'queries' : 'queries'
        'tickets' : 'tickets'
        'tickets/query/:queryId' : 'tickets'
        'dates' : 'dates'
        'chart/tickets/:tickets/from/:from/to/:to' : 'chart'
        '*actions' : 'queries'
        
      queries: () ->
        window.console.log('queries')