class AddCategoryCodeToBoardOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :board_orders, :category_code, :integer
  end
end
