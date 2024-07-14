# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.authenticate_by sessions_params

    if user
      login user
      redirect_to root_path, notice: t('.success')
    else
      flash[:alert] = t('.invalid_credentials')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: t('.success')
  end

  private

  def sessions_params
    params.permit(:email, :password)
  end
end
