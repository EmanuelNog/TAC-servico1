#User.create(name:"novonome", email:"novoemail@gmail.com", password:"123")

puts 'Creating Users'
15.times do
  User.create(
  	email: Faker::User.email,
    password: Faker::User.password,
    name: Faker::User.name
  )
end
puts 'Done Creating Users'