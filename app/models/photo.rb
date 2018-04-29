class Photo < ActiveRecord::Base
  mount_uploader :image, AvatarUploader
  belongs_to :user
  validates :user_id,presence: true
  validates :image,presence: true
  before_save :update_photo_attributes
  
  private
    def update_photo_attributes
      if image.present? && image_changed?
        self.photo_type = image.file.content_type
        @count = Photo.where(user_id: self.user_id).count
        
        self.sequence = @count + 1
        self.url = self.image.url
      end
    end
  
end