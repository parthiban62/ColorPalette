class Palette < ApplicationRecord
  belongs_to :user
  validates_presence_of :code,:row,:column,:user_id
end
