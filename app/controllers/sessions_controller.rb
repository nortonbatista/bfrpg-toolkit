# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.authenticate_by sessions_params

    if user
      login user
      redirect_to root_path, notice: 'Logged in successfully'
    else
      flash[:alert] = 'Invalid email or password'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Logged out successfully'
  end

  private

  def sessions_params
    params.permit(:email, :password)
  end
end
