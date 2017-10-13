class Palette < ApplicationRecord
	belongs_to :user
	validates_presence_of :code,:row,:column,:user_id

	def self.find_color_code_and_user_stamp(x,y)
		result = []
		palette = Palette.where(row: x,column: y).last
		if palette.present?
			result = [palette.code,"#{palette.user.username} #{palette.updated_at.strftime("%d-%m-%Y %H:%M:%S")}"]
		end
		return result
	end

end
