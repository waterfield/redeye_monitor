class App.Navigation extends Backbone.View
  events:
    'click li': 'navigate'
  
  navigate: (event) ->
    li = $(event.currentTarget)
    @$('.selected').removeClass 'selected'
    li.addClass 'selected'
    window.app.navigate li.attr('id')    
  
  render: ->
    @$el.find('li').hover ->
      $(this).toggleClass 'hover'
    this