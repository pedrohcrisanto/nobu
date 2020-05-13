require 'rails_helper'

RSpec.describe Account, type: :model do
	describe "#create" do
		context "with valid result" do
			subject { described_class.new(
				id: 1,
				balance: 1000,
				status: "Ativa",
				user_id: 1
			) }
						it "verify object" do
				expect(subject.id).to eq(1)
				expect(subject.balance).to eq(1000)
				expect(subject.status).to eq("Ativa")
				expect(subject.user_id).to eq(1)
			end
		end
	end
end
