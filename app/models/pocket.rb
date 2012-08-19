class Pocket < ActiveRecord::Base
  attr_accessible :picture, :latitude, :longitude

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" },:storage => :s3, s3_credentials: S3_CREDENTIALS, bucket: 'hotpocket'

end
