class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name
      t.text :description
      t.references :jot, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
