class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :bikes, through: :orders
  has_many :rents, through: :orders
  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
end
