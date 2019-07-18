class Serie < ApplicationRecord
  include Themed
  include PgSearch

  multisearchable against: [ :title, :synopsis ]

  pg_search_scope :search_by_title_and_synopsis,
    against: [ :title, :synopsis ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def self.find_by_title_and_synopsis(query)
    sql_query = "title @@ :query OR synopsis @@ :query"
    where(sql_query, query: "%#{query}%")
  end

  def category
    "TV Series"
  end
end
