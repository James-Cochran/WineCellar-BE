FactoryBot.define do
  factory :wine do
    name { Faker::Beer.name } # Using Beer name as a placeholder for wine names
    wine_type { ["Red", "White", "Rosé", "Sparkling"].sample }
    rating { rand(1..5) }
    notes { Faker::Lorem.sentence }
    association :user
  end
end