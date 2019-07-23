# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

NUM_IDEAS = 200
NUM_USERS = 10
PASSWORD = "supersecret"

Review.destroy_all()
Idea.destroy_all()
User.delete_all



super_user = User.create(
  first_name: "Jon",
  last_name: "Snow",
  email: "js@winterfell.gov",
  password: PASSWORD,
  is_admin: true
)

 NUM_USERS.times do
  first_name =  Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    password: PASSWORD
  )
end
users = User.all




NUM_IDEAS.times do
  created_at = Faker::Date.backward(365 * 5)
 i = Idea.create({
    title: Faker::Cannabis.strain,
    description: Faker::Cannabis.health_benefit,
    created_at: created_at,
    updated_at: created_at,
    user: users.sample
  })
  if i.valid?
    i.reviews = rand(0..15).times.map do
      Review.new(
        body: Faker::GreekPhilosophers.quote,
        user_id: users.sample
        )
    end
  end
end




review = Review.all
idea = Idea.all

puts Cowsay.say("Generated #{idea.count} ideas", :frogs)
puts Cowsay.say("Generated #{review.count} reviews", :tux)
puts Cowsay.say("Generated #{users.count} users", :stegosaurus)


puts "Login with #{super_user.email} and password: #{PASSWORD}"