require 'faker'

# create a few users

#TODO: Once you have implemented BCrypt - you can use these to seed your database.


# User.create :name => 'Dev Bootcamp Student', :email => 'me@example.com', :password => 'password'
50.times do
 User.create(username: Faker::Name.last_name,email: Faker::Internet.email, password: (('A'..'Z').to_a.sample(2)+('a'..'z').to_a.sample(4)+(0..9).to_a.sample(2)).join(''))
 
end


