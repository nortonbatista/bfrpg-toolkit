# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create; end

  def destroy
    logout
    redirect_to root_path, notice: 'Logged out successfully'
  end
end
