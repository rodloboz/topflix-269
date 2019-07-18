class Movie < ApplicationRecord
  include Themed
  include PgSearch

  belongs_to :director

  multisearchable against: [ :title, :synopsis ]

  pg_search_scope :search_by_title_and_synopsis,
    against: [ :title, :synopsis ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  pg_search_scope :global_search,
    against: [ :title, :synopsis ],
    associated_against: {
      director: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
    }

  def self.find_by_title_and_synopsis(query)
    sql_query = "title ILIKE :query OR synopsis ILIKE :query"
    where(sql_query, query: "%#{query}%")
  end

  # def self.global_search(query)
  #   sql_query = " \
  #       movies.title @@ :query \
  #       OR movies.synopsis @@ :query \
  #       OR directors.first_name @@ :query \
  #       OR directors.last_name @@ :query \
  #     "
  #   joins(:director).where(sql_query, query: "%#{query}%")
  # end

  def category
    "Movie"
  end
end
