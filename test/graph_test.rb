require File.expand_path(File.dirname(__FILE__) + '/../bacon')
Shindo.tests do
    
  before do
    @graph = Graph.new  
  end

  test("size of a graph") do
    @graph.connect(1,2)
    @graph.size == 2
  end

  test("returning vertices") do
    @graph.connect(1,2)
    @graph.connect(2,3)
    @graph.verticies == [1,2,3]
  end

  test("distance between verticeis") do
    @graph.connect(1,2)
    @graph.connect(2,3)
    @graph.distance(1,3) == 2
  end

end
