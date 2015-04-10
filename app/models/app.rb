class App < ActiveRecord::Base
  belongs_to :user
  has_many :events

  validates :url, uniqueness: true
  validates :app_name, uniqueness: true
end
