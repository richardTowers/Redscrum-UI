###global define ###

# User Model
#==================
# Deals with logging in and out, the Redmine API key and the Username.

#
define ['underscore', 'backbone'], (_, Backbone) ->
  'use strict'
  Backbone.Model.extend
  
    defaults:
      'apiKey': ''
      'username': ''
      'isLoggedIn': false
    
    # Initialize
    # --------------
    initialize: () ->
      # Check if the user's API key is already stored in local storage.
      if window.localStorage
        result = window.localStorage.getItem 'apiKey'
        if result?
          # Since there's already a key, we can just go ahead and try and log in with it.
          # There's no need to provide an error callback; if the log in fails we should just
          # show the normal logged out views. 
          @logIn result, () ->
    
    # LogIn
    # --------------
    logIn: (key, error) ->
      # Make a GET request to User.json to get the user's details.
      # The error callback will execute if the key doesn't correspond to a user.
      $.ajax('User.json?' + key,
        dataType: 'json'
        success: (data) =>
          # Hooray! We can log in.
          @set {'apiKey': key}
          @set {'username': data.userName}
          # Registered views will automatically update themselves when `isLoggedIn` changes.
          @set {'isLoggedIn': true}
          if window.localStorage
            window.localStorage.setItem 'apiKey', key
        error: error)
    
    # LogOut
    # --------------    
    logOut: () ->
      # Clear out all of our state.
      @set {'apiKey': ''}
      @set {'username': ''}
      # Registered views will automatically update themselves when 'isLoggedIn' changes.
      @set {'isLoggedIn': false}
      if window.localStorage
            window.localStorage.removeItem 'apiKey'