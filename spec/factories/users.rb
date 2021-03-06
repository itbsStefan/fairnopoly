require 'faker'

FactoryGirl.define do
  factory :user, aliases: [:seller, :buyer, :sender, :follower, :followable] do
    email       { Faker::Internet.email }
    password    'password'
    nickname    { Faker::Internet.user_name }
    surname     { Faker::Name.last_name }
    forename    { Faker::Name.first_name }
    privacy     true
    legal       true
    legal_entity { [true, false].sample }
    about_me    { Faker::Lorem.paragraph( rand(7)+1 ) }

    confirmed_at  Time.now

    factory :admin_user do
      admin       true
    end
  end
end