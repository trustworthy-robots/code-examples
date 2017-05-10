class FileAttachment < CarrierWave::Uploader::Base
  def store_dir
    "attachments/#{model.id}"
  end

  def cache_dir
    'tmp/'
  end
end