require "pry"

class Owner
  # code goes here
  attr_reader :species
  attr_accessor :name, :pets
  @@all =[]

  def initialize(name)
    @pets = {fishes:[], cats:[], dogs:[]}
    @@all << self
    @species = "human"
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cat] = cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] = dog
  end

  def buy_fish(name)
    Fish.new(name)
    @pets[:fishes] = fish
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    @@all = []
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    self.pets[:fishes] <<fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    self.pets[:cats] <<cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    self.pets[:dogs] <<dog
  end

  def walk_dogs
    self.pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    self.pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    self.pets.each do |type, animal|
      animal.each do |single|
        single.mood = "nervous"
      end
    end
    @pets = {fishes:[], cats:[], dogs:[]}
  end

  def list_pets
    "I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."
  end
end
