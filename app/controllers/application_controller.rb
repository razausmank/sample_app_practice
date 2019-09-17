require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  
  def authenticate_pen!
  authenticate_pen_from_token!
  super
  end


def authenticate_pen_from_token!
  Pen.find_by_authentication_token(pen_token)
end

def pen_token
  request.headers['X-AUTH-TOKEN'].presence || params['token'].presence
end

  protect_from_forgery with: :exception
  include SessionsHelper
  
            private 
              
              def logged_in_user
                unless logged_in?
                  store_location
                  flash[:danger] = "Please log in."
                  redirect_to login_url
                end
              end
end
