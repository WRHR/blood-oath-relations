class Cult
    attr_reader :name, :location, :slogan, :founding_year

    @@all = []

    def initialize name, location, slogan, founding_year
        @name = name
        @location = location
        @slogan = slogan
        @founding_year = founding_year

        @@all << self
    end

    def recruit_follower follower
        BloodOath.new(self, follower)
    end

    def followers
        BloodOath.all.select {|oath| oath.cult == self}
    end

    def cult_population
        followers.count
    end

    def self.all
        @@all
    end

    def self.find_by_name name
        all.find {|cult| cult.name == name}
    end

    def self.find_by_location location
        all.select {|cult| cult.location == location}
    end

    def self.find_by_founding_year year
        all.select {|cult| cult.founding_year == year}
    end
    
    def average_age
        age_total = self.followers.reduce(0) { |total_ages, follower| 
            total_ages += follower.age }
        age_total.to_f / self.cult_population
    end

    def my_followers_mottos
        followers.map {|follower| follower.life_motto}
    end

    def self.least_popular
        all.reduce do |least_popular, cult|
            least_popular.cult_population > cult.cult_population ?
                least_popular = cult : least_popular
        end
    end

    def self.cult_location_counts
        all.reduce({}) do |location_counts, cult|
            if location_counts["#{cult.location}"]
                location_counts["#{cult.location}"] += 1
            else
                location_counts["#{cult.location}"] = 1
            end
            location_counts
        end
    end

    def self.most_common_location
        cult_location_counts.reduce do |most_common, location_count| 
                most_common[1] > location_count[1] ?
                    most_common : most_common = location_count
        end[0]
    end

end