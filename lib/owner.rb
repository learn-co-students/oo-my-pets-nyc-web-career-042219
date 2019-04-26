#require 'pry'
class Owner
  # code goes here
  attr_accessor :pets, :name
  attr_reader :species

  @@all = []

  def initialize(species)
    @name = name
    @species = species
    @@all << self
    @pets = {fishes: [], cats: [], dogs: []}

  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def species
    @species
  end

  def say_species
    "I am a #{self.species}."

  end

  def name
    @name
  end

  def buy_fish(fish_name)
    fish_name = Fish.new(fish_name)
    self.pets[:fishes] << fish_name
  end

  def buy_cat(cat_name)
    cat_name = Cat.new(cat_name)
    self.pets[:cats] << cat_name
  end

  def buy_dog(dog_name)
    dog_name = Dog.new(dog_name)
    self.pets[:dogs] << dog_name
  end

  def walk_dogs
    self.pets[:dogs].map {|dog| dog.mood = "happy" }


  end

  def play_with_cats
    self.pets[:cats].map {|cat| cat.mood = "happy"}
  end

  def feed_fish
    self.pets[:fishes].map{|fish| fish.mood = "happy"}
  end

  def sell_pets
    self.pets.each {|k, v| v.map { |pet| pet.mood = "nervous"} }
    self.pets.clear

  end

  def list_pets
    "I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."

  end


end
