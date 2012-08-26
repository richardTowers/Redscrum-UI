###global define ###

# Main View
#==================
# Renders and handles the user interface for users that are logged in. 

define [
  # Load dependencies
  'underscore'
  'backbone'
  # Load template
  'text!Templates/Main.html'
  # Load child views
  'Views/Queries'
  'Views/Tickets'
  'Views/Dates'
  'Views/Chart'],
  (_, Backbone, mainTemplate, QueriesView, TicketsView, DatesView, ChartView) ->
    'use strict'
    Backbone.View.extend
      
      # Target Element
      # --------------
      # This is the selector for the DOM element that the view will be rendered in.
      el: '#main'
      
      # Initialize
      # --------------
      initialize: () ->
        # Set the view up to re-render whenever the model changes.
        # We will need to redraw if the user logs out.
        @model.on 'change', this.render, this
        # Render the View (if necessary).
        @render()
      
      # Template
      # --------------
      # The main template just holds placeholders for its children. 
      template: _.template( mainTemplate, {} )
      
      # Render
      # --------------
      render: () ->
        # Only render this view if the user is logged in.
        if @model.get 'isLoggedIn'
          # Render the main template
          @$el.html(this.template)
          # Render the child views
          @queries = new QueriesView()
          @tickets = new TicketsView()
          @dates = new DatesView()
          @chart = new ChartView() 
        return
        