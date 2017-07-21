class AddAnimalsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :species
      t.string :type
      t.integer :age
      t.timestamps
    end
  end
end
