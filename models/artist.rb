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

  
end
