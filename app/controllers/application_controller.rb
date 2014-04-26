class ApplicationController < ActionController::Base
  protect_from_forgery

  include SessionsHelper

  def handle_unverified_request
    sign_out
    super
  end

  private

    def signed_in_user
      if !signed_in?
        session[:target_url]=request.url
      end
      redirect_to root_url, flash: {danger: "Please sign in"} unless signed_in?
    end

end
