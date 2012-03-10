class App.Project extends Backbone.Model
  
  urlRoot: '/projects'
  
  initialize: ->
    @workers = new App.Workers
    @workers.project = this
    @workers.bind 'reset', => @trigger 'ready'
  
  get_ready: ->
    @workers.fetch()
