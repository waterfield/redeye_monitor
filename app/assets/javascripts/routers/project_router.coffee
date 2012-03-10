#= require_tree ../models
#= require_tree ../collections
#= require_tree ../views
#= require ../keyspace

class App.ProjectRouter extends Backbone.Router  
  initialize: (options) ->
    @project = new App.Project options.project
    @project.bind 'ready', => @render()
    @_included_d3 = false
  
  routes:
    'projects/:project_id': 'start'
    'projects/:project_id/:action': 'action'
    'projects/:project_id/workers/:worker_id': 'worker'

  start: ->
    @nav = new App.Navigation(el: $('#navbar')).render()
    @keyspace = new App.Keyspace(@project)
    @project.get_ready()
    # TODO: initialize main views

  render: ->
    @keyspace.render()

  action: (project_id, action) -> @[action]()

  worker: (project_id, id) ->
    # TODO

  navigate: (fragment, options) ->
    super "/projects/#{@project.id}/#{fragment}", options
