require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


kitten = Cult.new("kitten", "Chicago", 2020, "Meow")
dog = Cult.new("dog", "Chicago", 1920, "Woof")
rat = Cult.new("rat", "New York", 1800, "Squeak")

bart = Follower.new("Bart", 10, "Cowabunga")
marge = Follower.new("Marge", 35, "Homer!")
homer = Follower.new("Homer", 40, "Mmmm, donuts.")
lisa = Follower.new("Lisa", 8, "Saxaphone!")

first_oath = BloodOath.new(kitten, bart, "1990-6-10")
second_oath = BloodOath.new(kitten, marge, "1995-10-31")
third_oath = BloodOath.new(rat, homer, "2000-04-09")
fourth_oath = BloodOath.new(dog, bart, "1998-2-15")
fifth_oath = BloodOath.new(rat, lisa, "2001-11-20")
sixth_oath = BloodOath.new(dog, lisa, "2013-5-10")
binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
