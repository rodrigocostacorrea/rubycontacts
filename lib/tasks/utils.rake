namespace :utils do

  desc "Populate database with fake information"
  task seed: :environment do

    puts "Generating Contacts"
    100.times do
      Contact.create! name: Faker::Name.name, email: Faker::Internet.email, kind: Kind.all.sample, rmk: LeroleroGenerator.sentence([1,2,3,4,5].sample)
    end
    puts "Generating Contacts => OK"

    puts "Generating Addresses"
    Contact.all.each do |contact|
      Address.create! street: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, contact: contact
    end
    puts "Generating Addresses => OK"

    puts "Generating Phones"
    Contact.all.each do |contact|
      Random.rand(1 .. 5).times do
        Phone.create! phone: Faker::PhoneNumber.phone_number, contact: contact
      end
    end
    puts "Generating Phones => OK"

  end

end
