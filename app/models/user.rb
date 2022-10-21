class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :post_images, dependent: :destroy
 attachment :profile_image
 has_many :books, dependent: :destroy
 validates :email, presence: true, length: { maximum: 255 }, uniqueness: true
 validates :name, presence: true, length: {minimum: 2, maximum: 20 }, uniqueness: true
 validates :introduction, length: { maximum: 50 }


end
