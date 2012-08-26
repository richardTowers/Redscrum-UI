###global require###

# Main
#==================
# A single entry point for Redscrum. Sets up dependecies and
# builds the necessary models and views.

# Set up require.js to load non-AMD modules
require.config
  paths:
    underscore: 'libs/underscore'
    backbone: 'libs/backbone'
    bootstrap: 'libs/bootstrap'
  shim:
    underscore:
      exports: '_'
    backbone:
      deps: ['underscore']
      exports: 'Backbone'

require [
  # Load dependencies
  'underscore'
  'backbone'
  # Load Models
  'Models/User'
  # Load Views
  'Views/Main'
  'Views/Login'
  'Views/UserDetails'
  'Router'],
  (_, Backbone, UserModel, MainView, LoginView, UserDetailsView) ->
    'use strict'
    
    # Models
    # ---------------
    
    
    # Create a user model (see [Models/User](Models/User.coffee.html) ).
    userModel = new UserModel()
    
    # Views
    # ---------------
    
    #### Child Views ####
    # We need to create child views first, so that they can be passed into their parents.
    
    
    #### Top Level Views ####
    
    # Create a main view (see [Views/Main](Views/Main.coffee.html)).
    mainView = new MainView({model: userModel})
    # Create a login view (see [Views/Login](Views/Login.coffee.html)).
    loginView = new LoginView({model: userModel})
    # Create a user details view (see [Views/UserDetails](Views/UserDetails.coffee.html)).
    userDetailsView = new UserDetailsView({model: userModel})
    
    
    
    return
