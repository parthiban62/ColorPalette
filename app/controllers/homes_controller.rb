class HomesController < ApplicationController
	before_action :set_user_name
	skip_before_action :verify_authenticity_token

	def index
	end

	def set_user_name
		user = User.where(ip_address: request.remote_ip).last
		if user.present?
			@user = user
		else
			username = find_unique_username(Faker::Name.first_name)
			@user = User.create(username: username,ip_address: request.remote_ip)
		end
	end

	def find_unique_username(username)
	    taken_usernames = User.where("username LIKE ?", "#{username}%").pluck(:username)

	    # username if it's free
	    return username if ! taken_usernames.include?(username)

	    count = 2
	    while true
	      # username_2, username_3...
	      new_username = "#{username}_#{count}"
	      return new_username if ! taken_usernames.include?(new_username)
	      count += 1
	    end
  	end

  	def update_tile_color
  		params.permit!
  		params[:tiles].split(",").each do |tile|
  			position = tile.split("-")[1].split("_")
  			@user.palettes.create(code: params[:color_code],row: position[0],column: position[1])
  		end
  		respond_to :js
  	end

  	def reload_tiles
  		respond_to :js
  	end

  	def leaderboard
  		@users = User.joins(:palettes).select("users.*, count(palettes.id) as scount").group("users.id").order("scount DESC")
  	end
end
