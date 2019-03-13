require("pry")
require_relative("../models/album")
require_relative('../models/artist')

Album.delete_all
Artist.delete_all

artist1 = Artist.new({'name' => 'Van Halen'})
artist2 = Artist.new({'name' => 'Paul Simon'})
artist3 = Artist.new({'name' => 'Prince'})

artist2.save()
artist1.save()
artist3.save()

album1 = Album.new({'title' => '1984', 'artist_id' => artist1.id, 'genre' => 'rock'})
album2 = Album.new({'title' => 'Graceland', 'artist_id' => artist2.id, 'genre' => 'folk'})
album3 = Album.new({'title' => 'Van Halen', 'artist_id' => artist1.id, 'genre' => 'rock'})
album4 = Album.new({'title' => 'Purple Rain', 'artist_id' => artist3.id, 'genre' => 'rock'})
album5 = Album.new({'title' => 'Lovesexy', 'artist_id' => artist3.id, 'genre' => 'rock'})

album2.save()
album1.save()

albums = Album.all
artists = Artist.all

artist3.name = 'The artist formally known as Prince'
artist3.update
#
#
binding.pry
nil
