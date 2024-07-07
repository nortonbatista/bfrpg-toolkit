# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  encrypts :email, deterministic: true

  validates :email, presence: true, uniqueness: true
  normalizes :email, with: ->(email) { email.strip.downcase }
end
