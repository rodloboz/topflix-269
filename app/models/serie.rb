class Serie < ApplicationRecord
  include Themed
  
  def category
    "TV Series"
  end
end
