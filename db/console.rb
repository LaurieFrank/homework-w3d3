require("pry")
require_relative("../models/album")
require_relative("../models/artist")

artist1 = Artist.new({
  'name' => 'Justin Thyme'
  })

artist1.save()

artist2 = Artist.new({
  'name' => 'Helen Hywater'
  })

artist2.save()

album1 = Album.new({
  'album_title' => 'Running out of Time',
  'genre' => 'new age',
  'artist_id' => artist1.id
  })

album1.save()

album2 = Album.new({
  'album_title' => 'Low Tide',
  'genre' => 'sailor shanty',
  'artist_id' => artist2.id })

album2.save()

binding.pry
nil
