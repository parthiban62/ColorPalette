class HomesController < ApplicationController
	before_action :set_user_name

	def index
	end

	def set_user_name
		user = User.where(ip_address: request.remote_ip).last
		if user.present?
			@user_name = user.username
		else
			username = find_unique_username(Faker::Name.first_name)
			user = User.create(username: username,ip_address: request.remote_ip)
			@user_name = user.username
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
end
