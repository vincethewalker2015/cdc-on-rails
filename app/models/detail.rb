class Detail < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    #validates :employee_name, presence: true
    #validates :title, presence: true
    validates :user_id, presence: true
    
    belongs_to :user
    
    mount_uploader :picture, PictureUploader
    
    def picture_size
       if picture.size > 5.megabytes
           errors.add(:picture, "Should be less than 5MB")
       end
    end
    
end