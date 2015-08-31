class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  after_action :set_online

  private

  # set to online
  def set_online
    if !!current_user
      #  Wrapper in pipelined for the acceleration, two requests go as one without waiting
      # The answer, usage multi-exec instead of pipelined
      # Does not give such gain in productivity
      $redis_onlines.pipelined do
        # Value is not necessary, the key is necessary only
        $redis_onlines.set(current_user.id, nil)
        # We install key lifetime - 10 minutes, through 10 mine a key to be deleted
        $redis_onlines.expire(current_user.id, 10*60)
      end
    end
  end


end