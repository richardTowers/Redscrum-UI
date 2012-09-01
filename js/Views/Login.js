// Generated by CoffeeScript 1.3.3
/*global define
*/

define(['underscore', 'backbone', 'text!Templates/Login.html', 'bootstrap'], function(_, Backbone, loginTemplate) {
  'use strict';

  var apiKeyFieldSelector, logInButtonSelector, loginErrorTextSelector, loginFieldSetSelector;
  logInButtonSelector = '#login';
  apiKeyFieldSelector = '#apiKey';
  loginFieldSetSelector = '#loginGroup';
  loginErrorTextSelector = '#loginErrorGroup .help-block';
  return Backbone.View.extend({
    el: '#main',
    initialize: function() {
      this.model.on('change', this.render, this);
      return this.render();
    },
    template: _.template(loginTemplate, {}),
    render: function() {
      if (!(this.model.get('isLoggedIn'))) {
        this.$el.html(this.template);
      }
    },
    events: {
      'click #login': 'handleLogin'
    },
    handleLogin: function() {
      var apiKey;
      $(logInButtonSelector).button('loading');
      apiKey = $(apiKeyFieldSelector).val();
      if (/^[a-f,0-9]{40}$/.test(apiKey)) {
        this.model.logIn(apiKey, this.handleErroneousLogin);
      } else {
        this.handleErroneousLogin();
      }
    },
    handleErroneousLogin: function() {
      $(logInButtonSelector).button('reset');
      $(loginFieldSetSelector).addClass('error');
      return $(loginErrorTextSelector).show();
    }
  });
});
