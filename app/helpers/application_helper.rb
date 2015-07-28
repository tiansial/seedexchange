module ApplicationHelper
	def cp(path)
	  "current" if current_page?(path)
	end

	def users_online
	  $redis_onlines.keys.count
	  # => ["123", "234", "1", "23"]
	  # Returns an array with id online of users
	end
end
