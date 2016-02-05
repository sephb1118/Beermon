class Beer < ActiveRecord::Base
  #attr_accessible :name, :tasting_notes, :brewery, :user_id
  belongs_to :user
  has_many :comments, dependent: :destroy
  #default_scope -> {order(created_at: :asc)}
  validates :brewery, presence: true, length: {minimum: 3}
  validates :name, presence: true, length: {minimum: 3}
  validates :tasting_notes, presence: true, length: {minimum: 3}
  validates :user_id, presence: true                   
end
