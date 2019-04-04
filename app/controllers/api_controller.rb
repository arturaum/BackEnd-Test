class ApiController < ApplicationController
  before_action :set_default_format
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

private

  def set_default_format
    request.format = :json
  end

  def not_found
    respond_with '{"error": "not_found"}', status: :not_found
  end

end
