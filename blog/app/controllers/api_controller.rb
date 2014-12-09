# class ApiController < ApplicationController
#   protect_from_forgery with: :null_session

#   def current_user

#     @current_user ||= warden.authenticate(:scope => :user)

#     if @current_user.blank?
#       # debugger
#       token = headers["Auth-Token"] || request.headers['auth-token'] || params[:auth_token] || env["HTTP_AUTH_TOKEN"]
#       email = headers["Auth-Id"] || request.headers['auth-id'] || params[:auth_id] || env["HTTP_AUTH_ID"]
#       @current_user = User.where(:email => email, :authentication_token => token).first if token.present? && email.present?
#     end

#     @current_user
#   end

#   def authenticate_user!(opts={})
#     # opts[:scope] = :user
#     # warden.authenticate!(opts) if !devise_controller? || opts.delete(:force)
#     return access_denied! if current_user.blank?
    
#     true
#   end

#   def not_found!(resource = nil)
#     respond_to do |format|
#       format.html {}
#       format.json { render :json  => {error: "Not Found"}, status: :not_found }
#     end
#   end

#   def access_denied!
#     respond_to do |format|
#       format.html {}
#       format.json {render :json => {error: "Access Denied"}, status: :unauthorized }
#     end
    
#   end

# end
#   