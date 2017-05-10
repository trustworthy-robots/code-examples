CarrierWave.configure do |config|
  config.permissions = 0655
  config.directory_permissions = 0775
  config.storage = :file
end