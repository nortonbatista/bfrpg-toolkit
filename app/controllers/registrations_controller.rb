# frozen_string_literal: true

class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(registrations_params)

    if @user.save
      login @user
      redirect_to root_path, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def registrations_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
