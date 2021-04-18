class CreateSurfboards < ActiveRecord::Migration[6.0]
  def change
    create_table :surfboards do |t|
      t.string :name
      t.string :shaper
      t.string :location
      t.integer :price
      t.string :img_url
      t.string :size
      t.text :description

      t.timestamps
    end
  end
end
