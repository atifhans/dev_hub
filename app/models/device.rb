class Device < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :type_dev, presence: true, length: { maximum: 20 }
  validates :status, presence: true, length: { maximum: 20 }
end
