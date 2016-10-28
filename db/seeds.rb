# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 200.times do
#   Post.create({ title: Faker::Hipster.sentence,
#                     body:  Faker::ChuckNorris.fact })
# end
# puts "200 Posts generated"
# 10.times do
#   Category.create({ title: Faker::Commerce.department(1)})
# end
# puts "10 categories generated"
# 700.times do
#   Comment.create({ body: Faker::ChuckNorris.fact,
#                     post_id: rand(1..201)})
# end
# puts "700 comments generated"
50.times do
  User.create({ first_name: Faker::Name.first_name,
                    last_name:  Faker::Name.last_name,
                    email: Faker::Internet.free_email,
                    password: "123"})
end
puts "50 users generated"
