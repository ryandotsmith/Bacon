require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Movie Industry" do
  before(:each) do
    @storage    = Graph.new
    @hollywood  = MovieIndustry.new
    @hollywood.inject_storage(@storage)
    @movie      = Movie.new
    @actor_one  = Actor.new
    @actor_two  = Actor.new
    @actor_three= Actor.new
  end
  after(:each) do
    @storage = nil
    @hollywood = nil
  end
  it "should connect one actor with many actors" do
    @hollywood.connect(@actor_one, [@actor_two])
  end
  it "should show actors in the same movie as friend rank 0" do
    @hollywood.produce(@movie,[@actor_one,@actor_two])
    @hollywood.friend_rank(@actor_one,@actor_two).should eql(1)
  end
  it "should show actors related in a distant movie as" do
    @hollywood.produce(@movie,[@actor_one,@actor_two])
    @hollywood.produce(@movie,[@actor_two,@actor_three])
    @hollywood.friend_rank(@actor_one,@actor_three).should eql( 2 )
  end
end

