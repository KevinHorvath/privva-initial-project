class Issue < ApplicationRecord
  belongs_to :reporter, class_name: "User"
  belongs_to :assignee, class_name: "User"

  validates :summary, presence: true
  validates :status, presence: true
end
