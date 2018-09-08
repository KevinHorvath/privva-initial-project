class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :recoverable, :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :reported_issues, class_name: "Issue", foreign_key: :reporter_id
  has_many :assigned_issues, class_name: "Issue", foreign_key: :assignee_id

  validates :name, presence: true
end
