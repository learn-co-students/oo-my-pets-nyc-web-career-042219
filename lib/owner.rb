require 'pry'

class Owner

	attr_reader :species
	attr_accessor :name

	@@all = []

	def initialize(species)
		@species = species
		@@all << self
		@pets = {:cats=>[], :dogs=>[], :fishes=>[]}
	end

	def say_species
		"I am a #{@species}."
	end

	def pets
		@pets
	end

	def pets=(pet_hash)
    	@pets = pet_hash
  	end

	def buy_fish(fish_name)
		fish = Fish.new(fish_name)
		self.pets[:fishes] << fish
	end

	def buy_cat(cat_name)
			cat = Cat.new(cat_name)
			self.pets[:cats] << cat
		end

	def buy_dog(dog_name)
		dog = Dog.new(dog_name)
		self.pets[:dogs] << dog
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
		self.pets.each do |type, animals|
			animals.each { |pet| pet.mood = "nervous" }
			animals.clear
		end
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

	def list_pets
		"I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."
	end
end
