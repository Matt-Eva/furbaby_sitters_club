puts "Clearing db..."
Appointment.destroy_all
Client.destroy_all
Sitter.destroy_all
Pet.destroy_all

Faker::Time.unique.clear
# Faker::Name.unique.clear
Faker::PhoneNumber.unique.clear
Faker::FunnyName.unique.clear
Faker::Internet.unique.clear

puts "Making clients👤..."
# 10.times {Client.create(full_name: Faker::Name.unique.name, 
# image: Faker::LoremFlickr.image(size: "50x60", search_terms: ['celebrities']), 
# address: Faker::Address.full_address, 
# phone_number: Faker::PhoneNumber.unique.cell_phone)}
Client.create(
    username:'User1', 
    password:'password', 
    full_name:'Mickey Mouse', 
    image:'https://static.wikia.nocookie.net/disney/images/b/bf/Mickey_Mouse_Disney_1.png/revision/latest?cb=20180813011713', 
    address:'105 Town Square, Main Street, Disneyland, California, 91521',
    phone_number:"877-764-2539")

puts "Making sitters👤..."
5.times {Sitter.create(
    name: Faker::FunnyName.unique.name,
    image: Faker::LoremFlickr.image(size: "50x60", search_terms: ['Marvel Characters']), phone_number: Faker::PhoneNumber.unique.cell_phone, 
    email: Faker::Internet.unique.email, 
    bio: Faker::Lorem.sentence(word_count: 5), 
    availability: true)}

# puts "Making pets🐶🐱🐰..."
# 20.times {Pet.create(name: Faker::JapaneseMedia::StudioGhibli.character, 
# species: Faker::Creature::Animal.name, 
# meds: Faker::Lorem.sentence(word_count: 7), 
# fears: Faker::Lorem.sentence(word_count: 4), 
# likes: Faker::Lorem.sentence(word_count: 3), 
# image: Faker::LoremFlickr.image(size: "50x60", search_terms: ['pets']) ,
# client_id: Client.ids.sample)}

puts "Making appointments🗒..."
20.times {Appointment.create(
    datetime: Faker::Time.unique.forward(days: 23, period: :day, format: :long), 
    petcare: Faker::Lorem.paragraph, 
    client_id: Client.ids.sample,
    sitter_id: Sitter.ids.sample)} 

puts "Done seeding✔️!"