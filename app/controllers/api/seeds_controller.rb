module Api
	class Api::SeedsController < ApplicationController

		respond_to :json

		def all
			render json: Seed.all
		end

		def default_serializer_options
			{ root: false }
		end
	end

end