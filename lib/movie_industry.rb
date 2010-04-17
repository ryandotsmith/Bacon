class MovieIndustry

  def initialize(storage)
    @storage = storage
  end

  def produce(movie,actors)
    actors.each {|actor| connect(actor,(actors-[actor])) }
  end

  def friend_rank(actor_one, actor_two)
    @storage.distance(actor_one, actor_two) 
  end

  def connect(one_actor,group_of_actors)
    return if group_of_actors.empty?
    @storage.connect(one_actor,group_of_actors.pop)
    connect(one_actor,group_of_actors)
  end

end
