class User < ApplicationRecord
  mount_uploader :user_image, ImageUploader
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum gender: { man: 0, woman: 1}
  enum user_type: { consumer: 0, shop: 1}


end
