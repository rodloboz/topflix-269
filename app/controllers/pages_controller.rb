class PagesController < ApplicationController
  def home
    @movies = Movie.all + Serie.all
  end
end
