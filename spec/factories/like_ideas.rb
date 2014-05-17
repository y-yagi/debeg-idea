# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :like_idea do
    user
    idea
  end
end
