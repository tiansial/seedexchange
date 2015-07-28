class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|

      t.timestamps null: false
      t.string :terms
    end
  end
end
