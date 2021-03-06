class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    mount_uploader :picture, PictureUploader

    validates :username, :first_name, :last_name, presence: true
    validates :first_name, length: { maximum: 30 }
    validates :last_name, length: { maximum: 50}
    validates :email, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
    validates :username, uniqueness: { case_sensitive: false }, format: { with: /\A[-a-z0-9]+\Z/i, on: :create }

    def login=(login)
      @login = login
    end

   def login
     @login || self.username || self.email
   end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
