require 'rgl/adjacency'
require 'rgl/traversal'

class Graph

  def initialize
    @graph = RGL::DirectedAdjacencyGraph.new
  end

  def connect(one_thing, another_thing)
    @graph.add_edge(one_thing,another_thing) 
  end

  def verticies
    @graph.vertices
  end

  def add_singleton(one_thing)
    @graph.add_vertex(one_thing)
  end

  def distance(one_thing,another_thing)
    bfs_graph = @graph.bfs_search_tree_from(one_thing)
    visitor = RGL::BFSIterator.new(bfs_graph)
    visitor.attach_distance_map
    bfs_graph.depth_first_search(visitor) do |u|
      if u == another_thing
        return visitor.distance_to_root(u)
      end
    end
  end

end
