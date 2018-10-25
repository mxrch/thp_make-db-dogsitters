require 'faker'

#DELETE ALL
ActiveRecord::Base.connection.execute("DELETE FROM SQLITE_SEQUENCE")
Stroll.delete_all
Dogsitter.delete_all
Dog.delete_all
City.delete_all


#CITY
40.times do
  city = City.create!(city_name: Faker::Address.unique.city)
end

#DOGSITTERS
30.times do
	dogsitter = Dogsitter.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: rand(1..City.count))
end

#DOGS
50.times do
	dog = Dog.create!(name: Faker::Name.unique.last_name, city_id: rand(1..City.count))
end

#STROLLS
20.times do
	stroll = Stroll.create!(date: Faker::Date.forward(60), dogsitter_id: rand(1..Dogsitter.count), dog_id: rand(1..Dog.count), city_id: rand(1..City.count))
end
