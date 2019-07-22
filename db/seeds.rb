# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Idea.destroy_all()
1000.times do
  created_at = Faker::Date.backward(365 * 5)
  Idea.create({
    title: Faker::Cannabis.strain,
    description: Faker::Cannabis.health_benefit,
    created_at: created_at,
    updated_at: created_at
  })
end

puts 'created 1000 ideas!'