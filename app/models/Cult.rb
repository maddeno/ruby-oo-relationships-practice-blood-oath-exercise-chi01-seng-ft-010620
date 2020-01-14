class Cult
    @@all = []
    attr_reader :name, :location, :founding_year, :slogan
    

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end


    def recruit_follower(follower)
        BloodOath.new(self, follower, "#{Time.now.year}-#{Time.now.month}-#{Time.now.day}")
    end


    def bloodOath_instances
        BloodOath.all.select do |oath|
            oath.cult == self
        end
    end


    def cult_population
        bloodOath_instances.length
    end


    def self.all
        @@all
    end


    def self.find_by_name(name)
        self.all.find do |instance|
            instance.name == name
        end
    end


    def self.find_by_location(location)
        self.all.select do |instance|
            instance.location == location
        end
    end


    def self.find_by_founding_year(founding_year)
        self.all.select do |instance|
            instance.founding_year == founding_year
        end
    end


    def average_age
        follower_ages = bloodOath_instances.map do |instance|
            instance.follower.age
        end
        (follower_ages.sum/follower_ages.count)
    end


    def my_followers_mottos
        bloodOath_instances.map do |instance|
            instance.follower.life_motto
        end
    end


    def self.least_popular
        self.all.min_by do |cult|
            cult.cult_population
        end
    end


    def self.locations
        self.all.map do |cult|
            cult.location
        end
    end


    def self.most_common_location
        location_count = Hash.new(0)
        Cult.locations.each do |location|
            location_count[location] += 1
        end
        location_count.max_by do |location, count|
            count
        end[0]
    end


end