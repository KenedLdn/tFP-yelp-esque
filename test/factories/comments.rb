FactoryGirl.define do
  factory :comment do
    rating  '4_stars'
    message 'I will revisit this place. Food is delicious!'
    association :user
    association :place
  end
end
