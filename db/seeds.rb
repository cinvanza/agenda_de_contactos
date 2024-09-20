# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# Limpiar la base de datos
User.destroy_all
Contact.destroy_all
PhoneNumber.destroy_all
Email.destroy_all
ImportantDate.destroy_all

# Crear 3 usuarios
3.times do |i|
  user = User.create!(
    email: Faker::Internet.email,
    password: "password123"
  )

  # Crear 30 contactos para cada usuario
  30.times do
    contact = Contact.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      company: Faker::Company.name,
      main_email: Faker::Internet.email,
      address: Faker::Address.full_address,  # Aquí guardamos la dirección directamente en 'contacts'
      user: user
    )

    # Añadir 2 números de teléfono para cada contacto
    phone_labels = ["Móvil", "Casa", "Trabajo"].shuffle
    2.times do |i|
      PhoneNumber.create!(
        number: Faker::PhoneNumber.phone_number,
        label: phone_labels[i],
        contact: contact
      )
    end

    # Añadir 2 correos electrónicos para cada contacto
    email_labels = ["Personal", "Trabajo"].shuffle
    2.times do |i|
      Email.create!(
        address: Faker::Internet.email,
        label: email_labels[i],
        contact: contact
      )
    end

    # Añadir 1 fecha importante para cada contacto
    ImportantDate.create!(
      date: Faker::Date.birthday(min_age: 18, max_age: 65),
      label: "Cumpleaños",
      contact: contact
    )
  end
end

puts "Seed data with 3 users and 30 contacts each created successfully!"
