class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string            :shop_name
      t.string            :shop_image
      t.text              :shop_description
      t.references        :user, foreign_key: true
      t.timestamps
    end
  end
end
