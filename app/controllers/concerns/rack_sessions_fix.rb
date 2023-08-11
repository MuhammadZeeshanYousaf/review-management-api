# Error Fix for: ActionDispatch::Request::Session::DisabledSessionError
# Devise by default write in rack session but it is disabled for rails API app

module RackSessionsFix
  extend ActiveSupport::Concern


  # Fix for devise by creating fake session
  class FakeRackSession < Hash
    def enabled?
      false
    end

    def destroy; end
  end


  included do
    before_action :set_fake_session

    private

    def set_fake_session
      request.env['rack.session'] ||= FakeRackSession.new
    end
  end

end