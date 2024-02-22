# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"

puts "Cleaning database..."
Movie.destroy_all
List.destroy_all
Bookmark.destroy_all

puts "Creating movies..."

10.times do |i|
  Movie.create(
   title: Faker::Movie.title,
   overview: Faker::Movie.quote,
   poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg",
   rating: Faker::Number.between(from: 1, to: 10),
  )
end

puts "#{Movie.count} created."
