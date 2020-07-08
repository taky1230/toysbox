class CreateToys < ActiveRecord::Migration[5.2]
  def change
    create_table :toys do |t|
      t.string :name, limit: 30, null: false
      t.text :description

      t.timestamps
      t.index :name, unique: true
    end
  end
end
