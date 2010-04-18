require 'bacon'

Shindo.tests do
  Shindo.tests do 

    test("connecting actors") do
      storage = Graph.new
      hollywood = MovieIndustry.new(storage)
      hollywood.connect(Actor.new,[Actor.new,Actor.new])
    end

    test("connecting actors by using a movie and an array of actors") do
      storage = Graph.new
      hollywood = MovieIndustry.new(storage)
      hollywood.produce(Movie.new,[Actor.new,Actor.new,Actor.new])
    end

    test("frind rank should return nil if the actors are not connected") do
      jeff_bridges  = Actor.new
      ryan_smith    = Actor.new

      storage = Graph.new
      hollywood = MovieIndustry.new(storage)

      hollywood.produce(Movie.new,[jeff_bridges])
      hollywood.produce(Movie.new,[ryan_smith])

      hollywood.friend_rank(ryan_smith,jeff_bridges) == nil
    end
    test("friend rank should produce 1 for actors in the same movie") do
      jeff_bridges  = Actor.new
      john_goodman  = Actor.new

      storage = Graph.new
      hollywood = MovieIndustry.new(storage)

      hollywood.produce(Movie.new,[john_goodman,jeff_bridges])

      hollywood.friend_rank(john_goodman,jeff_bridges) == 1
    end

    test("friend rank should produce 2 for actors who transitivly acted with antoher actor") do
      jeff_bridges  = Actor.new
      john_goodman  = Actor.new
      clooney       = Actor.new

      storage = Graph.new
      hollywood = MovieIndustry.new(storage)

      hollywood.produce(Movie.new,[john_goodman,jeff_bridges])
      hollywood.produce(Movie.new,[john_goodman,clooney])


      hollywood.friend_rank(jeff_bridges,clooney) == 2
    end

  end
end
