class Attachment < ActiveRecord::Base
  belongs_to :post

  mount_uploader :file_attachment, FileAttachment
end
