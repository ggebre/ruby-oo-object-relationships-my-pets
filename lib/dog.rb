class Dog
  # code goes here
  @@all = []
  attr_accessor :owner, :mood
  attr_reader :name
  def initialize (name, owner)
    @name = name
    @owner = owner 
    @mood = "nervous"
    save 
  end

  def save 
    @@all << self
  end

  def self.all
    @@all
  end
end