class ApiController < ApplicationController
  include Knock::Authenticable

  before_action :set_default_format
  # make knock jwt compatible with devise
  before_action :authenticate_user
  undef_method :current_user

  private

    def set_default_format
      request.format = :json
    end
end
