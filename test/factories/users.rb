FactoryGirl.define do
  factory :user do
    sequence :username do |n|
      "someone #{n}"
    end
    sequence :email do |n|
      "something#{n}@somewhere.com"
    end
    password '12345678'
    password_confirmation '12345678'
  end
end
