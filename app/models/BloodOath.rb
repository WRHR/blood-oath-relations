require 'date'

class BloodOath
    attr_reader :cult, :follower, :initiation_date
    @@all = []

    def initialize cult, follower, initiation_date = Date.today.strftime('%F')
        @cult = cult
        @follower = follower
        @initiation_date = initiation_date

        @@all << self
    end

    def self.all 
        @@all
    end

    def initiation_date
        "_#{@initiation_date}_"
    end

    def self.first_oath
        oldest = all.reduce do |oldest_oath, oath|
            Date.parse(oldest_oath.initiation_date) < Date.parse(oath.initiation_date) ?
                oldest_oath : oldest_oath = oath
        end
        oldest.follower
    end
end