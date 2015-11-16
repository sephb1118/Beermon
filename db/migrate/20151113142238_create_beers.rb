class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :brewery
      t.string :name
      t.text :tasting_notes

      t.timestamps null: false
    end
  end
end
