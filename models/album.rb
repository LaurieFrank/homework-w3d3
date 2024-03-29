require('pg')
require_relative('../db/sql_runner')
require_relative('artist')

class Album

  attr_accessor :album_title, :genre
  attr_reader :id, :artist_id


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @album_title = options['album_title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums
    (
      album_title,
      genre,
      artist_id
    ) VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@album_title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    artist_hash = results[0]
    artist = Artist.new(artist_hash)
    return artist
  end

  def update()
      sql = "
      UPDATE albums SET (
        album_title,
        genre
      ) =
      (
        $1, $2
      )
      WHERE id = $3"
      values = [@album_title, @genre, @id]
      SqlRunner.run(sql, values)
    end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM albums"
    album = SqlRunner.run(sql)
    return album.map { |album| Album.new(album) }
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    album_hash = results.first
    album = Album.new(album_hash)
    return album
  end


end
