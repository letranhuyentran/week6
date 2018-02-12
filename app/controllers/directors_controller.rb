class DirectorsController < ApplicationController

  def update
    director = Director.find_by(id: params["id"])
    director.name = params["name"]
    director.save
    redirect_to "/directors"
  end

  def destroy
    director = Director.find_by(id: params["id"])
    director.delete
    redirect_to "/directors"
  end

  def create
    Director.create :name => params["name"]
    redirect_to "/directors"
  end

end
