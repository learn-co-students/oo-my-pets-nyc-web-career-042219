class Owner

  @@all = []
  @@count = 0

  attr_reader :species
  attr_accessor :pets, :name

  def initialize(species)
    @@all << self
    @@count += 1

    @species = species
    @pets = { :dogs => [], :cats => [], :fishes => [] }
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(fish_name)
    fish = Fish.new(fish_name)
    @pets[:fishes] << fish
  end

  def buy_cat(cat_name)
    cat = Cat.new(cat_name)
    @pets[:cats] << cat
  end

  def buy_dog(dog_name)
    dog = Dog.new(dog_name)
    @pets[:dogs] << dog
  end

  def walk_dogs
    @pets[:dogs].map { |dog| dog.mood = "happy" }
  end

  def play_with_cats
    @pets[:cats].map { |cat| cat.mood = "happy" }
  end

  def feed_fish
    @pets[:fishes].map { |fish| fish.mood = "happy" }
  end

  def list_pets
    fish_num = @pets[:fishes].length
    dog_num = @pets[:dogs].length
    cat_num = @pets[:cats].length

    "I have #{fish_num} fish, #{dog_num} dog(s), and #{cat_num} cat(s)."
  end

  def sell_pets
    @pets.each do |types, names|
      names.map { |pet| pet.mood = "nervous"}
      names.clear
    end
  end

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@all.clear
    @@count = 0
  end

end
