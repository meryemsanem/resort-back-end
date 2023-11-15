class RemoveUserIdFromDestinations < ActiveRecord::Migration[6.0]
  def change
    remove_column :destinations, :user_id
    remove_index :destinations, name: "index_destinations_on_user_id"
  end
end
