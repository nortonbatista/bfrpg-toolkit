# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  it { is_expected.to have_secure_password }

  describe '#email' do
    subject { create(:user) }

    it { is_expected.to encrypt(:email).deterministic(true) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to normalize(:email).from(' FoO@bAr.COM ').to('foo@bar.com') }
  end
end
