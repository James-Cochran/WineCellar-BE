# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Wine.destroy_all
User.destroy_all

users = 1.times.map do
  User.create!(username: Faker::Internet.username)
end

users.each do |user|
  3.times do
    Wine.create!(
      name: Faker::Beer.name,
      wine_type: ["Red", "White", "Rose", "Sparkling"].sample,
      rating: rand(1..5),
      notes: Faker::Lorem.sentence,
      user: user
    )
  end
end