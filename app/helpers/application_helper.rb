module ApplicationHelper
	def cp(path)
	  "current" if current_page?(path)
	end

	def users_online
	  $redis_onlines.keys.count
	  # => ["123", "234", "1", "23"]
	  # Returns an array with id online of users
	end


	def current_user_photo
		if current_user.photo
			image_tag current_user.photo
		else
			image_tag("avatar-placeholder.jpg")
		end
	end

	def user_liked
		if current_user.voted_for? @seed
			"liked"
		end
	end

	def nav_fixed
		if current_page?(controller: '/seeds', action: 'index') || current_page?(root_path)
			"fixed"
		end
	end
end
