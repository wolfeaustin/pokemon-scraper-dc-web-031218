
require 'pry'
class Pokemon

  attr_accessor :name, :type, :db, :id

  def initialize(parts = {})
    @name = parts.fetch(:name)
    @type = parts.fetch(:type)
    @db = parts.fetch(:db)
    @id = parts.fetch(:id)
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(idNum, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = (?)", idNum)
    poke = poke.flatten
    po = Pokemon.new(name: poke[1], type: poke[2], id:poke[0], db: db)


  #  binding.pry
  end



end
