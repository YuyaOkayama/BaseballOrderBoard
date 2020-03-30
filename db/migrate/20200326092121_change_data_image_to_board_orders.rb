class ChangeDataImageToBoardOrders < ActiveRecord::Migration[5.1]
  def change
  	change_column :board_orders, :image, :text
  end
end
