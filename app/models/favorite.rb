class Favorite < ApplicationRecord
  belongs_to :board_user
  belongs_to :board_order
end
