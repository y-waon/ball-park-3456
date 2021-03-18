FactoryBot.define do
  factory :tweet do
    title        {Faker::Lorem.sentence}
    text         {Faker::Lorem.sentence}
    status_id    {Faker::Number.between(from: 2, to: 4)}
    category_id  {Faker::Number.between(from: 2, to: 7)}
    area_id      {Faker::Number.between(from: 2, to: 48)}
    user_id      {1}
    after(:build) do |tweet|
      tweet.image.attach(io: File.open('public/images/bubu.jpeg'), filename: 'bubu.jpeg')
    end
  end
end
