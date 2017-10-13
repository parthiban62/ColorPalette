FactoryGirl.define do
  factory :palette do
    color_code { Faker::StarWars.character }
    row 1
    column 5
    user_id nil
  end
end