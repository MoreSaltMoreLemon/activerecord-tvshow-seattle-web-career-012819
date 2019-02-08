require 'pry'
class Show < ActiveRecord::Base
  def self.highest_rating
    highest_rated_show = Show.all.max_by {|s| s.rating }
    highest_rated_show.rating
  end

  def self.most_popular_show
    Show.all.max_by {|s| s.rating }
    # binding.pry
  end

  def self.lowest_rating
    lowest_rated_show = Show.all.min_by {|s| s.rating }
    lowest_rated_show.rating
  end

  def self.least_popular_show
    Show.all.min_by {|s| s.rating }
  end

  def self.ratings_sum
    Show.all.reduce(0) do |sum, show|
      sum += show.rating
    end
  end

  def self.popular_shows
    Show.all.select do |show|
      show.rating > 5
    end
  end

  def self.shows_by_alphabetical_order
    Show.all.sort do |a, b|
      a.name <=> b.name
    end
  end

end