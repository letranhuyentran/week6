class MoviesController < ApplicationController

  def index
  end

  def update
    movie = Movie.find_by(id: params["id"])
    movie.title = params["title"]
    movie.year = params["year"]
    movie.poster_url = params["poster_url"]
    movie.director_id = params["director_id"]
    movie.save
    redirect_to "/"
  end

  def destroy
    movie = Movie.find_by(id: params["id"])
    movie.delete
    redirect_to "/"
  end

  def create
    Movie.create :title => params["title"],
                 :year => params["year"],
                 :poster_url => params["poster_url"],
                 :director_id => params["director_id"]
    redirect_to "/"
  end



end
