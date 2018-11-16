class Cocktail < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :doses
  has_many :ingredients, through: :doses

  validates :name, presence: true, uniqueness: true

 before_create :assign_url

 private

 def assign_url
  self.remote_photo_url = 'https://images.unsplash.com/photo-1517620430776-0ec904756579?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=631b4f98b4e594a6653ee1ae97c3a4c9&auto=format&fit=crop&w=668&q=80' if photo_url.nil?
 end

end
