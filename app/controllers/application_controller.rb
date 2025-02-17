# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def authenticate_user!
    redirect_to root_path, alert: I18n.t('application.user_must_be_signed_in') unless user_signed_in?
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
