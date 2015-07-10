class CreateSeeds < ActiveRecord::Migration
  def change
    create_table :seeds do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
