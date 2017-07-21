class Seed

  Animal.destroy_all

  def self.begin
    seed = Seed.new
    seed.generate_animals
  end

  def generate_animals
    20.times do |i|
      Animal.create!(
        name: Faker::Name.first_name,
        species: 'cat',
        type: Faker::Cat.breed,
        age: rand(1..20)
      )
    end
    20.times do |i|
      Animal.create!(
        name: Faker::Name.first_name,
        species: 'dog',
        type: Faker::Music.instrument,
        age: rand(1..20)
      )
    end
  end
end
