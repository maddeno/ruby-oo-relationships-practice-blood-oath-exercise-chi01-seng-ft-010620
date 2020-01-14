class BloodOath
    @@all = []
    attr_reader :cult, :follower, :initiation_date

    def initialize(cult, follower, initiation_date)
        @cult = cult
        @follower = follower
        @initiation_date = initiation_date
        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        self.all[0].follower
    end

end