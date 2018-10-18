namespace :utils do

  desc "Populate database with fake information"
  task seed: :environment do

    puts "Generating New Contacts"
    100.times do

      address = Address.new street: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr
      phone_list = Array.new

      Random.rand(1 .. 5).times do
        phone_list.push Phone.new phone: Faker::PhoneNumber.phone_number
      end

      Contact.create! name:    Faker::Name.name, email: Faker::Internet.email, kind: Kind.all.sample, rmk: LeroleroGenerator.sentence([1, 2, 3, 4, 5].sample),
                      address: address, phones: phone_list

    end
    puts "Generating New Contacts => OK"

  end

end
