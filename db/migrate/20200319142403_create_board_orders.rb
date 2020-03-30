class CreateBoardOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :board_orders do |t|
      t.text :message
      t.integer :boarduser_id
      t.text :image

      t.timestamps
    end
  end
end
