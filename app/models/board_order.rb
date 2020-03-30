class BoardOrder < ApplicationRecord
	#mount_uploader :image, ImageUploader

	belongs_to :board_user, optional: true

	#validates :message, presence:{message:'は、必須項目です'}
end
