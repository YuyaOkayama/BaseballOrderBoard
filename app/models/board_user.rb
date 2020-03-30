class BoardUser < ApplicationRecord
	belongs_to :account
	has_many :board_order

	#has_secure_password

	validates :nickname, presence: {message:'は、必須項目です。'}
end
