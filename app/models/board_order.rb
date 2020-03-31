class BoardOrder < ApplicationRecord

	belongs_to :board_user, optional: true

	has_many :favorites
  	has_many :board_users, through: :favorites
	#validates :message, presence:{message:'は、必須項目です'}
end
