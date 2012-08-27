// Generated by CoffeeScript 1.3.3
/*global define
*/

define(['underscore', 'backbone', 'text!Templates/Queries.html'], function(_, Backbone, queriesTemplate) {
  'use strict';
  return Backbone.View.extend({
    el: '#queries',
    initialize: function() {
      return this.render();
    },
    template: _.template(queriesTemplate, {}),
    render: function() {
      this.$el.html(this.template);
    }
  });
});
