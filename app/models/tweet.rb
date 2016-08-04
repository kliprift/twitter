class Tweet < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
validates :content, length: { maximum: 140, message: " more than 140 characters"  } , :presence => true
belongs_to :user
end

