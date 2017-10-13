Rails.application.routes.draw do
	root :to => "homes#index"
	post '/homes/update_tile_color'
	get '/homes/reload_tiles'
	get '/homes/leaderboard'
end
