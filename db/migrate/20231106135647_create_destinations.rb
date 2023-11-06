class CreateDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :city_name
      t.decimal :fee
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
