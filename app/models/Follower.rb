class Follower
    attr_reader :name, :age, :life_motto

    @@all = []
    
    def initialize name, age, life_motto
        @name = name
        @age = age
        @life_motto = life_motto

        @@all << self
    end

    def oaths
        BloodOath.all.select {|oath| oath.follower == self}
    end

    def cults 
        oaths.map(&:cult)
    end

    def join_cult cult
        BloodOath.new(cult, self)
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age age
        all.select {|follower| follower.age == age}
    end

    def my_cults_slogans
        cults.map {|cult| puts "#{cult.slogan}"}
    end

    def self.most_active
        all.reduce {|most_active, follower| 
            most_active.cults.size < follower.cults.size ?
                 most_active = follower : most_active}
    end

    def self.sort_by_most_active
        all.sort {|follower_a, follower_b| 
            follower_b.cults.count <=> follower_a.cults.count}
    end 

    def self.top_ten
        sort_by_most_active[0...9]
    end
end