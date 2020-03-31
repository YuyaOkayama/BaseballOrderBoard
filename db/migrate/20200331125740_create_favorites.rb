class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :board_user, null:false#foreign_key: true
      t.references :board_order, null:false#foreign_key: true

      t.timestamps
    end
  end
end
