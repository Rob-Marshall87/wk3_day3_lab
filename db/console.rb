require("pry")
require_relative("../models/album")
require_relative('../models/artist')

Album.delete_all
Artist.delete_all

artist1 = Artist.new({'name' => 'Van Halen'})
artist2 = Artist.new({'name' => 'Paul Simon'})

artist2.save()
artist1.save()

album1 = Album.new({'title' => '1984', 'artist_id' => artist1.id, 'genre' => 'rock'})
album2 = Album.new({'title' => 'Graceland', 'artist_id' => artist2.id, 'genre' => 'folk'})
album3 = Album.new({'title' => 'Van Halen', 'artist_id' => artist1.id, 'genre' => 'rock'})

album2.save()
album1.save()

albums = Album.all
artists = Artist.all
#
#
binding.pry
nil
