module ApplicationHelper
    def get_tile_details(i,j)
      return Palette.find_color_code_and_user_stamp(i,j)
    end

    def generate_tile(i,j,tile_info)
    	raw("<div onclick='toggleClass(this);' class='content' id='tile-#{i}_#{j}' style='background-color: #{tile_info[0]}' title='#{tile_info[1]}'></div>")
    end
end
