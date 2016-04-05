# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


5.times do
  User.create!(
  name: Faker::StarWars.character,
  email: Faker::Internet.safe_email,
  password_digest: Faker::Internet.password(8),
  bio: Faker::Hipster.sentence
  )
end

20.times do
  Link.create!(
  title: Faker::Book.title,
  url: Faker::Internet.url,
  summary: Faker::Lorem.sentence,
  user: User.order("RANDOM()").first
  )
end

1000.times do
  Vote.create!(
  link_id: Link.find((1..20).to_a.sample).id
  )
end
