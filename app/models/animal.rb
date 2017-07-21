class Animal < ApplicationRecord
  validates :name, :species, :type, :age, presence: true

  def self.random
    Animal.find(rand((Animal.first.id)..(Animal.last.id)))
  end

  def self.search(name)
    Animal.where(name: name)
  end
end
