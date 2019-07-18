class Movie < ApplicationRecord
  include Themed
  
  belongs_to :director

  def category
    "Movie"
  end
end
