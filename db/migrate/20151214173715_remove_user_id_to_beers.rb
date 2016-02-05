class RemoveUserIdToBeers < ActiveRecord::Migration
  def change
    remove_reference :beers, :user_id, index: true, foreign_key: true
  end
end
