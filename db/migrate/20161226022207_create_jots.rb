class CreateJots < ActiveRecord::Migration
  def change
    create_table :jots do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
