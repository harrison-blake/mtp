class UsersController < ApplicationController
	def show
		@start_of_week = start_of_week
		@user = User.find(params[:id])
		if !current_user_profile?
			flash[:notice] = "not allowed bitch"
			redirect_to root_url
		end
	end

	private
	def current_user_profile?
		@user == current_user
	end

	def start_of_week
		Date.today.beginning_of_week
	end
end
