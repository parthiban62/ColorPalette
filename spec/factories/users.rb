FactoryGirl.define do
  factory :user do
    username { Faker::Name.first_name }
    ip_address { Faker::Number.number(1).Faker::Number.number(1).Faker::Number.number(1).Faker::Number.number(1) }
  end
end