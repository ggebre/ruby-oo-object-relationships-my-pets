require 'pry'
class Owner
  # code goes here
  @@all = []
  attr_reader :name, :species
  
  def initialize(name)
    @name = name
    @species = "human"
    save
  end

  def cats 
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat (cat_name)
    # create instance of Cat with the given name and self as owner 
       Cat.new(cat_name, self)
  end

  def buy_dog (dog_name)
    # create instance of Cat with the given name and self as owner 
       Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.map {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.map {|cat| cat.mood = "happy"}
  end

  def sell_pets
    # self.dogs.map do |dog| 
    #   dog.mood = "nervous" 
    #   dog.owner = nil
    # end
    pet_mood_changer(self.dogs)
    # self.cats.map do |cat| 
    #   cat.mood = "nervous" 
    #   cat.owner =nil 
    # end
    pet_mood_changer(self.cats)
  end

  def pet_mood_changer (pets)
    pets.map do |pet|
      pet.mood = "nervous" 
      pet.owner = nil
    end
  end
  def list_pets
     "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end

  def save 
    @@all << self
  end

  def say_species
    "I am a #{species}."
  end
# class methods 
  def self.all
    @@all
  end

  def self.count 
    self.all.size
  end

  def self.reset_all
    self.all.clear
  end
end