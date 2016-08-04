class Tweet < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
TWEET_REGEX = /[\S\s]{1,140}/i
validates :content, :presence => true, uniqueness: {case_sensitive: false, message: " more than 140 characters"}, :format => TWEET_REGEX
belongs_to :user
end
