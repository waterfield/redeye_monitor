#= require ../models/worker

class App.Workers extends Backbone.Collection
  model: App.Worker
  url: -> @project.url() + '/workers'
