class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :brewery
      t.string :name
      t.text :tasting_notes

      t.timestamps null: false
    end
    
    add_index :beers, [:user_id]
  end
end
