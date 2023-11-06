class CreateDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :city_name
      t.numeric :fee
      t.text :description
      t.string :image_url
      t.belongs_to :user, index: true, foreign_key:true

      t.timestamps
    end
  end
end
