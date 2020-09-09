class Show < ActiveRecord::Base

    def self.highest_rating
        self.maximum('rating')
    end

    def self.most_popular_show
        x = self.all.select do |show|
            show.rating == self.highest_rating
        end
        x[0]
    end

    def self.lowest_rating
        self.minimum('rating')
    end

    def self.least_popular_show
        x = self.all.select do |show|
            show.rating == self.lowest_rating
        end
        x[0]
    end

    def self.ratings_sum
        self.sum(:rating)
    end
    
    def self.popular_shows
        self.all.select do |show|
            show.rating > 5
        end
    end

    def self.shows_by_alphabetical_order
        self.all.order(:name)
    end
end

