Redscrum UI
=====================

Introduction
---------------------

Redscrum is a pretty basic web app that queries the redmine API and auto-gerenates
scrum burndown charts.

The user interface is written in CoffeeScript, making pretty heavy use of [BackboneJS](http://backbonejs.org/).

Because of Cross Domain issues we do not query the Redmine API directly, but instead make (somewhat simplified) calls to our own server.
Our server then does some manipulation on the data (largely using the magic of LINQ) and returns it in a more palatable form.

Dependecies
---------------------

Redscrum uses [Html5 Boilerplate](http://html5boilerplate.com/), [Bootstrap](http://twitter.github.com/bootstrap/), [Backbone](http://backbonejs.org/), [Underscore](http://underscorejs.org/),
[jQuery](http://jquery.com/), [Require](http://requirejs.org/) and
the [Google Chart Tools](https://developers.google.com/chart/).