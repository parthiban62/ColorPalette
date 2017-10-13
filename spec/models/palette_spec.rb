require 'rails_helper'

RSpec.describe Palette, type: :model do
  # Association test
  # ensure an item record belongs to a single todo record
  it { should belong_to(:user) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:code) }
  it { should validate_presence_of(:row) }
  it { should validate_presence_of(:column) }
  it { should validate_presence_of(:user_id) }
end
