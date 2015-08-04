class AddCharacteristicsToSeeds < ActiveRecord::Migration
  def change
    add_column :seeds, :common_name, :string
    add_column :seeds, :scientific_name, :string
    add_column :seeds, :production_year, :integer
    add_column :seeds, :location, :string
  end
end
