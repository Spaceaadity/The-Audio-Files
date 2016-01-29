class User < ActiveRecord::Base
	has_many :songs, through: :playlists

	has_secure_password
  	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  	validates :first_name, presence: true
  	validates :last_name, presence: true
  	validates :password, presence: true, confirmation: true, :on => [:create]
  	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: {with: EMAIL_REGEX} 

end
