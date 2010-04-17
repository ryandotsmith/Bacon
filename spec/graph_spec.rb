require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Graph" do
  before(:each) do
    @graph = Graph.new
  end
  it "should add edge for each connection" do
    @graph.connect(1,2)
    @graph.connect(2,3)
    @graph.connect(3,4)
    @graph.verticies.length.should eql(4)
  end
  it "should calculate distance" do
    @graph.connect(1,2)
    @graph.connect(2,3)
    @graph.connect(3,4)
    @graph.distance(1,4).should eql(3)
  end
end


