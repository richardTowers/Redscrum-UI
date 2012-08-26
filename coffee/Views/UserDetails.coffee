###global define###

# User Details View
#==================
# Renders the username and log out option. Handles logging out.

define ['underscore', 'backbone', 'text!Templates/UserDetails.html', 'bootstrap'],
  (_, Backbone, userDetailsTemplate) ->
    'use strict'
    Backbone.View.extend
      
      # Target Element
      # --------------
      # This is the selector for the DOM element that the view will be rendered in.
      el: '#userDetails'
      
      # Initialize
      # --------------
      initialize: () ->
        # Set the view up to re-render whenever the model changes.
        # We will need to redraw if the user name changes or if the user logs out.
        @model.on 'change', this.render, this
        # Render the View (if necessary).
        @render()
      
      # Events
      # --------------
      events:
        'click .btnLogOut' : 'logOut'
      
      # Template
      # --------------
      # `userDetailsTemplate` was loaded by `requirejs`.
      template: _.template(userDetailsTemplate)
      
      # Render
      # --------------
      render: () ->
        # Only render this view if the user is logged in.
        if @model.get 'isLoggedIn'
          # The template needs to know the username, so pass in the model.
          @$el.html(this.template @model.toJSON() )
        else
          @$el.html('')
        return
      
      # LogOut
      # --------------
      logOut: () ->
        # There's no need to do any UI stuff, since all relevant views observe
        # the `User` model. We can just delegate the `logOut` method to the model.
        @model.logOut()