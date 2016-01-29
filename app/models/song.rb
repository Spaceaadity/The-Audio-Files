class Song < ActiveRecord::Base
	has_many :users, through: :playlists

	validates :title, presence: true 
	validates :artist, presence: true
	validates :artist, length: { minimum: 2 }
end
