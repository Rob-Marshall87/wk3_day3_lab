require_relative('../db/sql_runner.rb')
require_relative('./artist.rb')


class Album

  attr_reader :id, :artist_id, :title

  def initialize(options)
    @title = options['title']
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
  end

end
