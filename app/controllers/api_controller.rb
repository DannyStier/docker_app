class ApiController < ApplicationController

  def index
    api = Api.new
    api.shared_secret
  end

end
