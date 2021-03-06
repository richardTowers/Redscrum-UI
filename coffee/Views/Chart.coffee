###global define###

define [
  # Load dependencies
  'underscore'
  'backbone'
  # Load template
  'text!Templates/Chart.html'],
  (_, Backbone, chartTemplate) ->
    'use strict'
    Backbone.View.extend
      
      # Target Element
      # --------------
      # This is the selector for the DOM element that the view will be rendered in.
      el: '#chart'
      
      # Initialize
      # --------------
      initialize: () ->
        # Set the view up to re-render whenever the model changes.
        # @model.on 'change', this.render, this
        # Render the View (if necessary).
        @render()
      
      # Template
      # --------------
      template: _.template( chartTemplate, {} )
      
      # Render
      # --------------
      render: () ->
        # Render the template
        @$el.html(this.template)
        return