class SessionsController < ApplicationController

  def destroy
    # cookies.delete(:user_id)
    session[:user_id] = nil
    # cookies[:user_id] = nil
    redirect_to "/movies"
  end

  def create
    user = User.find_by(email: params["email"])
    if user != nil
      if user.password == params["password"]
        session[:user_id] = user.id
        # cookies[:user_id] = user.id
        # cookies.signed[:user_id] = user.id
        # cookies.encrypted[:user_id] = user.id
        # cookies.encrypted.signed[:user_id] = user.id
        redirect_to "/movies"
      else
        redirect_to "/sessions/new"
      end
    else
      redirect_to "/sessions/new"
    end
  end

end
