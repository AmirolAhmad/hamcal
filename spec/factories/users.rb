FactoryGirl.define do
  factory :user do
    callsign { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    confirmed_at Date.today
  end
end
