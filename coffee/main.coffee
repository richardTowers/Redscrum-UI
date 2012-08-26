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
    bootstrap: 'libs/bootstrap/bootstrap'
  shim:
    underscore:
      exports: '_'
    backbone:
      deps: ['underscore']
      exports: 'Backbone'

# Load dependencies and other modules
require ['underscore', 'backbone', 'Models/User', 'Views/Login', 'Views/UserDetails', 'Router'],
  (_, Backbone, UserModel, LoginView, UserDetailsView) ->
    'use strict'
    
    # Models
    # ---------------
    
    
    # Create a user model (see [Models/User](Models/User.coffee.html) ).
    userModel = new UserModel()
    
    # Views
    # ---------------
    
    
    # Create a login view (see [Views/Login](Views/Login.coffee.html) ).
    loginView = new LoginView({model: userModel})
    # Create a user details view (see [Views/UserDetails](Views/UserDetails.coffee.html) ).
    userDetailsView = new UserDetailsView({model: userModel})
    
    return
