FactoryGirl.define do

  factory :user do |user|
    user.name     "Bob Simth"
    user.email    "bob@simth.com"
    user.password "foobar"
    user.password_confirmation "foobar"
  end
end