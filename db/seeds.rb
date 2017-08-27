require 'CSV'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


CSV.foreach("#{Rails.root}/db/seeds.csv",headers: true) do |line|
  user, timestamp, content = line[0], line[1], line[2]
  Message.create(sender: user, created_at: timestamp, updated_at: timestamp, body: content, priority: 5, resolved: false)
end