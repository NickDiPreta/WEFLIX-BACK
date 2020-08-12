class SessionsController < ApplicationController
  include CurrentUserConcern

  def create
    user = User
    #front end is going to wrap up a user object
      .find_by(email: params["user"]["email"])
      .try(:authenticate, params["user"]["password"])

    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user,
      }
    else
      render json: { status: 401 }
    end
  end

  #checks to see if the current user is logged in or not
  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user,
      }
    else
      render json: {
        logged_in: false,
      }
    end
  end


  def logout
    reset_session
    render json: {
      status: 200, logged_out: true
    }
  end
end
