# frozen_string_literal: true

class PasswordsController < ApplicationController
  before_action :authenticate_user!

  def edit; end

  def update
    if current_user.update(passwords_params)
      redirect_to edit_passwords_path, notice: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def passwords_params
    params.require(:user)
          .permit(:password, :password_confirmation, :password_challenge)
          .with_defaults(password_challenge: '')
  end
end
