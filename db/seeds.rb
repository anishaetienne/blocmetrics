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
 60.times do
   App.create!(
    user:   users.sample,
    description: Faker::Lorem.paragraph(2),
     url:  Faker::Internet.url,
     app_name:   Faker::App.name
   )
 end
 apps = App.all

 100.times do
   Event.create!(
    app:   apps.sample,
     event_name:   Faker::Hacker.verb
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
 puts "#{Event.count} events created"


