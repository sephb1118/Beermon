class AddUserIdToBeers < ActiveRecord::Migration
  def change
    add_reference :beers, :user, index: true, foreign_key: true
  end
  
  add_index
end
