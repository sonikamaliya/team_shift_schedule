class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_FORMAT = /\A(?=[A-Z]{1})(?=.[a-z]{1,7})(?=.*[@])(?=.*[0-9]).{3}/
  validates :password, 
            presence: true,
            :length => { :within => 6..40 },
            :format => { with: PASSWORD_FORMAT },
            confirmation: true,
            on: :create

end
