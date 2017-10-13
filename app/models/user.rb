class User < ApplicationRecord
	has_many :palettes,dependent: :destroy
	validates_presence_of :username,:ip_address
end
