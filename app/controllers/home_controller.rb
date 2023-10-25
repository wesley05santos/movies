class HomeController < ApplicationController
  def index
    @movies = Movie.all
    render 'movies/index'
  end
end