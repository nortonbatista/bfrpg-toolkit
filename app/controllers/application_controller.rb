# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def authenticate_user!
    redirect_to root_path, alert: 'You must be signed in to view this page' unless user_signed_in?
  end

  def current_user = Current.user ||= authenticate_user_from_session
  helper_method :current_user

  def authenticate_user_from_session = User.find_by(id: session[:user_id])

  def user_signed_in? = current_user.present?
  helper_method :user_signed_in?

  def login(user)
    Current.user = user

    reset_session
    session[:user_id] = user.id
  end

  def logout
    Current.user = nil

    reset_session
  end
end
