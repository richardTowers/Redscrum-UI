// Generated by CoffeeScript 1.3.3
/*global require
*/

require.config({
  paths: {
    underscore: 'libs/underscore',
    backbone: 'libs/backbone',
    bootstrap: 'libs/bootstrap/bootstrap'
  },
  shim: {
    underscore: {
      exports: '_'
    },
    backbone: {
      deps: ['underscore'],
      exports: 'Backbone'
    }
  }
});

require(['underscore', 'backbone', 'Models/User', 'Views/Login', 'Views/UserDetails', 'Router'], function(_, Backbone, UserModel, LoginView, UserDetailsView) {
  'use strict';

  var loginView, userDetailsView, userModel;
  userModel = new UserModel();
  loginView = new LoginView({
    model: userModel
  });
  userDetailsView = new UserDetailsView({
    model: userModel
  });
});
