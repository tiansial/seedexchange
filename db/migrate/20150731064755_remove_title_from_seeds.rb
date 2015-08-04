class RemoveTitleFromSeeds < ActiveRecord::Migration
  def change
    remove_column :seeds, :title, :string
  end
end
