# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all
Chat.destroy_all
Message.destroy_all
User.create(name: "ujjwal", email: "ujjwal@chat.com", password: "Ujjwal1502")
User.create(name: "sheefa", email: "sheefa@chat.com", password: "Sheefa1502")
