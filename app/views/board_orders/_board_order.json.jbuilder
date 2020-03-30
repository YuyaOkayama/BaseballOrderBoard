json.extract! board_order, :id, :message, :boarduser_id, :image, :created_at, :updated_at
json.url board_order_url(board_order, format: :json)
