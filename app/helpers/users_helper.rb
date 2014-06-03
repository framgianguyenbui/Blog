module UsersHelper
	# Returns the Gravatar (http://gravatar.com/) for the given user.
	def gravatar_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "http://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/100px-Ruby_logo.svg.png"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end

end


