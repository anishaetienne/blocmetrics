require 'faker'

 5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end
 users = User.all
 
 # Create Apps
 10.times do
   App.create!(
    user:   users.sample,
     url:  Faker::Internet.url,
     app_name:   Faker::App.name
   )
 end
 
user = User.first
 user.skip_reconfirmation!
 user.update_attributes!(
   email: 'anisha@sendgrid.com',
   password: 'helloworld'
 )


 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{App.count} apps created"


