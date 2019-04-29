class Owner
  # code goes here
    @@all = []
    @@count = 0

    attr_accessor :name, :pets
    attr_reader :species

    def initialize(species)
      @species = species
      @@all << self
      @pets = {:fishes => [], :dogs => [], :cats => []}
      @@count += 1
    end

    def self.all
      @@all
    end

    def self.count
      @@count
    end

    def self.reset_all
      self.all.clear
    end

    def say_species
      "I am a #{species}."
    end

    def buy_fish(name)
      fish = Fish.new(name)
      self.pets[:fishes] << fish
    end

    def buy_cat(name)
      cat = Cat.new(name)
      self.pets[:cats] << cat
    end

    def buy_dog(name)
      dog = Dog.new(name)
      self.pets[:dogs] << dog
    end

    def walk_dogs
      self.pets[:dogs].each {|dog| dog.mood = "happy"}
    end

    def play_with_cats
      self.pets[:cats].each {|cat| cat.mood = "happy"}
    end

    def feed_fish
      self.pets[:fishes].each {|fish| fish.mood = "happy"}
    end

    def sell_pets
    pets.each do |species, pet|
      pet.each do |pet|
        pet.mood = "nervous"
      end
      pets.clear
    end
  end

  def list_pets
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end

end
