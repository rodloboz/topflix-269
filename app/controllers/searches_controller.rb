class SearchesController < ApplicationController
  # def show
  #   # it will either be NIL or a STRING
  #   query = params.dig(:search, :query)

  #   if query.present?
  #     @movies = Movie.where(title: query) + Serie.where(title: query)
  #   else
  #     @movies = Movie.all + Serie.all
  #   end
  # end

  # def show
  #   # it will either be NIL or a STRING
  #   query = params.dig(:search, :query)

  #   if query.present?
  #     @movies = Movie.where("title ILIKE ?", "%#{query}%") + Serie.where("title ILIKE ?", "%#{query}%")
  #   else
  #     @movies = Movie.all + Serie.all
  #   end
  # end

  # def show
  #   # it will either be NIL or a STRING
  #   query = params.dig(:search, :query)

  #   if query.present?
  #     @movies = Movie.find_by_title_and_synopsis(query) + Serie.find_by_title_and_synopsis(query)
  #   else
  #     @movies = Movie.all + Serie.all
  #   end
  # end

  # def show
  #   # it will either be NIL or a STRING
  #   query = params.dig(:search, :query)

  #   if query.present?
  #     @movies = Movie.global_search(query) + Serie.find_by_title_and_synopsis(query)
  #   else
  #     @movies = Movie.all + Serie.all
  #   end
  # end

  def show
    # it will either be NIL or a STRING
    query = params.dig(:search, :query)

    if query.present?
      @movies = Movie.global_search(query) + Serie.search_by_title_and_synopsis(query)
    else
      @movies = Movie.all + Serie.all
    end
  end
end






