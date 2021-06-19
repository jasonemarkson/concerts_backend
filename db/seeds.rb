# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
boc = Artist.create(name: "Blue Öyster Cult")
rhcp = Artist.create(name: "Red Hot Chili Peppers")
kol = Artist.create(name: "Kings of Leon")

Concert.create([
    {venue: "B.B. King Blues Club & Grill", date: "June 6, 2009", city: "New York", state: "NY", artist_id: 1},
    {venue: "Prudential Center", date: "May 4, 2012", city: "Neward", state: "NJ", artist_id: 2},
    {venue: "PNC Bank Arts Center", date: "May 20, 2017", city: "Holmdel", state: "NJ", artist_id: 3}
])