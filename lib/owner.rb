require 'pry'
class Owner
  # code goes here
  attr_reader :species
  attr_accessor :name

  @@all = []

  def initialize(species)
    @species = species
    @@all << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
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

  def pets=(pet_hash)
    @pets = pet_hash
  end

  def buy_fish(pet_name)
    fish = Fish.new(pet_name)
    self.pets[:fishes] << fish
  end

  def buy_cat(pet_name)
    cat = Cat.new(pet_name)
    self.pets[:cats] << cat
  end

  def buy_dog(pet_name)
    dog = Dog.new(pet_name)
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
    self.pets.each do |species, arr|
      arr.each {|pet| pet.mood = "nervous"}
      arr.clear
    end
  end

  def list_pets
    fish_count = dog_count = cat_count = 0
    self.pets.each do |species, arr|
      arr.each do |pet|
        case species
        when :dogs
          dog_count += 1
        when :cats
          cat_count += 1
        when :fishes
          fish_count += 1
        end
      end
    end
    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end
end
