require 'faker'


50.times do
 u = User.new(username: Faker::Name.last_name, email: Faker::Internet.email)
 u.password = (('A'..'Z').to_a.sample(2)+('a'..'z').to_a.sample(4)+(0..9).to_a.sample(2)).join('')
 u.save!
end





