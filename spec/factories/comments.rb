FactoryBot.define do
  factory :comment do
    text         {Faker::Lorem.sentence}
    user_id   {1}
  end
end
