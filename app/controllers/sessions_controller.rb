class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password_digest])
      session[:current_user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:notice] = "Something went wrong haha"
      redirect_to root_url
    end
  end
end