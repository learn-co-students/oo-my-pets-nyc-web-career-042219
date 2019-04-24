class Owner
  @@all = []
  @@count = 0

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@count = 0
    @@all.clear
  end

  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @@all << self
    @@count += 1
    @pets = {fishes: [], cats: [], dogs: []}
  end

  def species
    @species = "human"
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    pets[:dogs] << dog
  end

  def walk_dogs
    pets[:dogs].each { |dog| dog.mood = "happy" }
  end

  def play_with_cats
    pets[:cats].each { |cat| cat.mood = "happy" }
  end

  def feed_fish
    pets[:fishes].each { |fish| fish.mood = "happy" }
  end

  def sell_pets
    pets.each do |specie, pets|
      pets.each { |pet| pet.mood = "nervous" }
    end
    pets.clear
  end

  def list_pets
    "I have #{pets[:fishes].length} fish, #{pets[:dogs].length} dog(s), and #{pets[:cats].length} cat(s)."
  end
  
end