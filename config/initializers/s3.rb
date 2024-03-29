if Rails.env == "production"
  # set credentials from ENV hash
  S3_CREDENTIALS = { :access_key_id => ENV['S3_KEY'], :secret_access_key => ENV['S3_SECRET'], :bucket => "sharedearth-production"}
else
  # get credentials from YML file
  S3_CREDENTIALS = YAML.load(Rails.root.join("config/s3.yml").read)
end
