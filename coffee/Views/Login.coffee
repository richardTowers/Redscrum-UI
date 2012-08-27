###global define###

# Login View
#==================
# Renders and handles the user interface for users that are not logged in.

# Load dependencies and template.
define ['underscore', 'backbone', 'text!Templates/Login.html', 'bootstrap'],
  (_, Backbone, loginTemplate) ->
    'use strict'
    
    # Declare selectors.
    logInButtonSelector = '#login'
    apiKeyFieldSelector = '#apiKey'
    loginFieldSetSelector = '#loginGroup'
    loginErrorTextSelector = '#loginErrorGroup .help-block'
    
    # Create the Backbone View.
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
      # The login template requires no data, so we can build it here.
      template: _.template(loginTemplate, {})
      
      # Render
      # --------------
      render: () ->
        # Only render this view if the user is *not* logged in.
        if !(@model.get 'isLoggedIn')
          @$el.html(this.template)
        return
      
      # Events
      # --------------
      events:
        'click #login': 'handleLogin'
      
      # Handle Successful Login
      # --------------
      handleLogin: () ->
        # Set the button to loading while we make our AJAX call.
        $(logInButtonSelector).button 'loading'
        # Get the key from the field.
        apiKey = $(apiKeyFieldSelector).val()
        # Check that the key is in a valid format.
        if /^[a-z,0-9]{40}$/.test(apiKey)
          # Use the key to log in.
          @model.logIn(
            apiKey,
            @handleErroneousLogin)
        else
          # Display the fact that the key is invalid to the user.
          # **Todo**: this is a different situation to a valid-key that fails to authenticate. 
          this.handleErroneousLogin()
        return
      
      # Handle Erroroneous Login
      # --------------
      handleErroneousLogin: () ->
        # The AJAX call has finished so we can reset the button state.
        $(logInButtonSelector).button('reset')
        # Display the error to the user.
        $(loginFieldSetSelector).addClass('error')
        $(loginErrorTextSelector).show()