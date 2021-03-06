require 'faker'

FactoryGirl.define do
  factory :user, class: 'Unsakini::User' do
    name {Faker::Name.name_with_middle}
    email { Faker::Internet.email }
    password "12345678"
    password_confirmation "12345678"
  end
end
