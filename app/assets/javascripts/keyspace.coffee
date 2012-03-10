#= require d3.v2.min

class App.Keyspace
  
  width: 960
  height: 500
  
  constructor: (@project) ->
    
  nodes: ->
    unless @_nodes
      @_nodes = []
      @_node_map = {}
      @project.workers.each (worker) =>
        @_node_map[worker.id] = @_nodes.length
        @_nodes.push worker.attributes
    @_nodes
  
  links: ->
    unless @_links
      @_links = []
      @project.workers.each (worker) =>
        for link in worker.get('out_links')
          @_links.push
            source: @_node_map[link.from_id]
            target: @_node_map[link.to_id]
    @_links

  render: ->
    @color = d3.scale.category20()
    
    @force = d3.
      layout.
      force().
      charge(-1000).
      linkDistance(100).
      size([@width, @height])

    @svg = d3.
      select('#main').append('svg').
      attr('width', @width).
      attr('height', @height)
    
    @force.
      nodes(@nodes()).
      links(@links()).
      start()

    @link = @svg.
      selectAll('line.link').
      data(@links()).
      enter().
      append('line').
      attr('class', 'link').
      style('stroke-width', 2)
    
    @node = @svg.
      selectAll('rect.node').
      data(@nodes()).
      enter().
      append('rect').
      attr('class', 'node').
      attr('width', 100).
      attr('height', 20).
      attr('stroke', 'black').
      attr('fill', 'black').
      attr('fill-opacity', 0).
      # attr('opacity', 0).
      call(@force.drag)
      # text((d) -> d.prefix)
    
    @node.
      append('text').
      attr('text-anchor', 'middle').
      attr('stroke', '#000').
      attr('stroke-opacity', 1).
      text((d) -> d.prefix)
    
    @node.append('title').text (d) -> d.prefix

    @force.on 'tick', =>
      @link.attr('x1', (d) -> d.source.x)
           .attr('y1', (d) -> d.source.y)
           .attr('x2', (d) -> d.target.x)
           .attr('y2', (d) -> d.target.y)
      
      @node.attr('x', (d) -> d.x - 50)
           .attr('y', (d) -> d.y - 10)

    this