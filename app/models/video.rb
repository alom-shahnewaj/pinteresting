class Video < ActiveRecord::Base
	belongs_to :user
	has_attached_file :video
	validates_attachment_content_type :video, :content_type => ['video/x-msvideo', 'video/x-flv', 'video/quicktime', 'video/mp4'], :message => "Sorry, this site currently only supports mp4, flv, avi, mov video"

	validates :description, presence: true
	validates :video, presence: true

	
end
