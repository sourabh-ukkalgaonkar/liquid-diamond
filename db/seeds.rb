# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  name: "Tester",
  email: "tester@yopmail.com",
  password: '123456',
  password_confirmation: '123456'
)

(0..1000).each do
  Product.create(
    name: Faker::Team.name.split(' ').first.remove(','),
    model: Faker::Company.sic_code,
    brand: Faker::Company.name.split(' ').first.remove(','),
    year: rand(10.years).seconds.ago.year,
    ram: (1..8).to_a.sample,
    external_storage: (1..4).to_a.map{|i| i*32}.sample
  )
end