require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create :user }

  describe "#validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_length_of(:email).is_at_most(255) }

    context "format email" do
      it "when invalid format" do
        user.email = "abc"

        expect(user.valid?).to eq(false)
        expect(user.errors.full_messages).to eq(["Email is invalid"])
      end

      it "when valid format" do
        user.email = "abc@example.com"

        expect(user.valid?).to eq(true)
      end
    end

    context "uniqueness" do
      it "when email has already been taken" do
        new_user = FactoryBot.build :user, email: user.email

        expect(new_user.valid?).to eq(false)
        expect(new_user.errors.full_messages).to eq(["Email has already been taken"])
      end
    end
  end
end
