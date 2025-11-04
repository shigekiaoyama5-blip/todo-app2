# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


jon = User.create!(email: 'john@example.com', password: 'password')
emily = User.create!(email: 'emily@example.com', password: 'password')

5.times do

    jon.tasks.create(
        title: Faker::Lorem.sentence(word_count: 5),
        description: Faker::Lorem.sentence(word_count: 100),
        deadline: Faker::Date.forward(days: 50)
    )
end

5.times do

    emily.tasks.create(
        title: Faker::Lorem.sentence(word_count: 5),
        description: Faker::Lorem.sentence(word_count: 100),
        deadline: Faker::Date.forward(days: 50)
    )
end