class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    mount_uploader :picture, PictureUploader
    validates :username, :name, :email, presence: true
    validates :name, length: { maximum: 60 }
    validates :email, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
    validates :username, uniqueness: { case_sensitive: false }, format: { with: /\A[-a-z0-9]+\Z/i, on: :create }
end
