require("pry")
require_relative("../models/album")
require_relative("../models/artist")

artist1 = Artist.new({
  'name' => 'Justin Thyme'
  })

album1 = Album.new({
  'album_title' => "Running out of Time"
  'release_date' => "25/9/2019"
  })

album1 = Album.new({
  'album_title' => "Too much Time"
  'release_date' => "8/9/2019"
  })

binding.pry
nil
