require_relative('../db/sql_runner.rb')
require_relative('./artist.rb')


class Album

  attr_reader :id, :artist_id, :title, :genre

  def initialize(options)
    @title = options['title']
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
    @genre = options['genre']
  end

  def artist
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    artist_hashes = SqlRunner.run(sql, values)
    return artist_hashes.map { |artist| Artist.new(artist) }
  end

  def save()
    sql = "INSERT INTO albums (title, artist_id, genre)
    VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @artist_id, @genre]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    album_hashes = SqlRunner.run(sql)
    return album_hashes.map { |album| Album.new(album)  }
  end

  # def self.find(artist_id)
  #   sql = "SELECT FROM albums WHERE artist_id = $1"
  #   values = [artist_id]
  #   album_hashes = SqlRunner.run(sql, values)
  #   return album_hashes.map { |album| Album.new(album)  }
  # end

  def self.delete_all
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE albums SET title = $1
    WHERE id = $2"
    values = [@title, @id]
    SqlRunner.run(sql, values)
  end
end
