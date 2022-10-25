class User < ApplicationRecord

	has_many :areas, dependent: :destroy
end
