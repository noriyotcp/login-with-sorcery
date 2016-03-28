RSpec.describe User, type: :model do
  require "validates_email_format_of/rspec_matcher"

  describe "VALIDATION" do
    it { is_expected.to validate_length_of(:password).is_at_least(3) }
    it { is_expected.to validate_confirmation_of(:password) }
    it { is_expected.to validate_presence_of(:password_confirmation) }
    it { is_expected.to validate_email_format_of(:email).with_message('is invalid format') }
  end
end
