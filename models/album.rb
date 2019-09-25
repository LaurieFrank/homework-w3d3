require('pg')
require_relative('../db/sql_runner')
require_relative('artist')

class Album

  attr_accessor :album_title, :release_date
  attr_reader :id, :artist_id


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @album_title = options['album_title']
    @release_date = options['release_date']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums
    (
      album_title,
      release_date,
      artist_id
    ) VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@album_title, @release_date, @artist_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end


end
