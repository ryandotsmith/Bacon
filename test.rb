require 'bacon'

Shindo.tests do
  Shindo.tests do 

    tests("connecting actors") do
      storage = Graph.new
      hollywood = MovieIndustry.new(storage)
      hollywood.connect(Actor.new,[Actor.new,Actor.new])
    end

    tests("connecting actors by using a movie and an array of actors") do
      storage = Graph.new
      hollywood = MovieIndustry.new(storage)
      hollywood.produce(Movie.new,[Actor.new,Actor.new,Actor.new])
    end

    tests("friend rank should produce 1 for actors in the same movie") do
      jeff_bridges  = Actor.new
      john_goodman  = Actor.new

      storage = Graph.new

      hollywood = MovieIndustry.new(storage)
      hollywood.produce(Movie.new,[john_goodman,jeff_bridges])

      hollywood.friend_rank(john_goodman,jeff_bridges) == 1
    end

    tests("friend rank should produce 2 for actors who transitivly acted with antoher actor") do
      jeff_bridges  = Actor.new
      john_goodman  = Actor.new
      clooney       = Actor.new

      storage = Graph.new

      hollywood = MovieIndustry.new(storage)
      hollywood.produce(Movie.new,[john_goodman,jeff_bridges])

      hollywood = MovieIndustry.new(storage)
      hollywood.produce(Movie.new,[john_goodman,clooney])


      hollywood.friend_rank(jeff_bridges,clooney) == 2
    end

  end
end
