FactoryGirl.define do
  factory :place do
    name  'somename'
    description 'It\'s a restaurant.'
    address 'somewhere'
    latitude(42.3631519)
    longitude(-71.056098)
    association :user
  end
end
