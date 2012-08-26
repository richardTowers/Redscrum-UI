({
    name: 'main',
    out: "../built-js/main.js",
    paths: {
      "underscore": "libs/underscore-min",
      "backbone": "libs/backbone-min",
      "bootstrap": "libs/bootstrap/bootstrap.min"
    },
    optimize: "uglify",
    shim: {
      underscore: {
        exports: '_'
      },
      backbone: {
        deps: ['underscore'],
        exports: 'Backbone'
      }
    }
})
