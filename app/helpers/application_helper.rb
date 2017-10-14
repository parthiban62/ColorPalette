module ApplicationHelper
    def get_tile_details(i,j)
      return Palette.find_color_code_and_user_stamp(i,j)
    end
end
