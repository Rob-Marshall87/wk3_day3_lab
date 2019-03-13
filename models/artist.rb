require_relative('../db/sql_runner.rb')
require_relative('./album.rb')

class Artist

  attr_reader(:id)
  attr_accessor(:name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = "INSERT INTO artists (name)
    VALUES ($1) RETURNING *"
    values = [@name]
    returned_array = SqlRunner.run(sql, values)
    artist_hash = returned_array.first
    @id = artist_hash['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM artists"
    artist_hashes = SqlRunner.run(sql)
    return artist_hashes.map { |artist| Artist.new(artist) }
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    album_hashes = SqlRunner.run(sql, values)
    return album_hashes.map { |album| Album.new(album) }
  end

  def update
    sql = "UPDATE artists SET name = $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT FROM artists WHERE artist_id = $1"
    values = [id]
    album_hashes = SqlRunner.run(sql, values)
    return album_hashes.map { |artist| Artist.new(artist) }
  end
  
  def delete()
    sql = "DELETE FROM artists where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end
end
