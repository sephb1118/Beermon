class Beer < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :brewery, presence: true, length: {minimum: 3}
  validates :name, presence: true, length: {minimum: 3}
  validates :tasting_notes, presence: true, length: {minimum: 3}                   
end
