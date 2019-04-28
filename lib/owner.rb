class Owner
attr_accessor :name, :pets
attr_reader :species
@@all = []
  def initialize(species)
    @species = species
    @name = name
    @@all << self
    @pets = {fishes: [], cats: [], dogs: []}
  end

  def self.all
    @@all
  end
  def self.count
    @@all.count
  end
  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{self.species}."
  end
  def pets
    @pets
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def walk_dogs
    pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    pets.each do |pet, pet_array|
      pet_array.each do
        |pet| pet.mood = "nervous"
      end
      pet_array.clear
    end
  end

  def list_pets
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end

end
