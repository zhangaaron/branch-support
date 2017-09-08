require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


CSV.foreach("#{Rails.root}/db/seeds.csv",headers: true) do |line|
  user, timestamp, content = line[0], line[1], line[2]
  Message.create!(resolved: false, sender: user, created_at: timestamp, updated_at: timestamp, body: content, priority: 5)
end
user = User.create!(email: 'greg@branch.co', name: 'Sir Rawnald Gregory the 5th')
message = Message.first

message.replies.build(:user_id => user.id, :body => "Hi there, we're not presently aware of this problem. Can you please describe your problem?").save!
message.replies.build(:sender => "208", :body => "Some more detailed information! Thanks friendo!").save!
message.replies.build(:user_id => user.id, :body => "Gotcha! We are escalating this with our engineering team.
Please don't call me friendo, we're family here! Call me pal-o").save!