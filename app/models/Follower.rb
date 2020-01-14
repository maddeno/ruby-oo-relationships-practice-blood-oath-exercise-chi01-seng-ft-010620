class Follower
    @@all = []
    attr_reader :name, :age, :life_motto

    def initialize(name, age, life_motto )
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end
    

    def cults
        BloodOath.all.select do |oath|
            oath.follower == self
        end.map do |oath|
            oath.cult
        end
    end
    

    def join_cult(cult)
        BloodOath.new(cult, self, "#{Time.now.year}-#{Time.now.month}-#{Time.now.day}")
    end


    def self.all
        @@all
    end


    def self.of_a_certain_age(age)
        self.all.select do |follower|
            follower.age >= age
        end
    end


    def my_cults_slogans
        self.cults.map do |cult|
            cult.slogan
        end
    end


    def self.most_active
        self.all.max_by do |follower|
            follower.cults.length
        end
    end


    def self.top_ten
        self.all.max_by(10) do |follower|
            follower.cults.length
        end
    end


end