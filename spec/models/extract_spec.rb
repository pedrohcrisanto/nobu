require 'rails_helper'

RSpec.describe Extract, type: :model do
  describe "#create" do
    context "with valid result" do
        subject { described_class.new(
          id: 1,
          user_id: 1,
          type_transaction: "Saque",
          value: 1000,
          account_id: 1,
          tax: 0
          ) }
          
        it "verify object" do
            expect(subject.id).to eq(1)
            expect(subject.user_id).to eq(1)
            expect(subject.type_transaction).to eq("Saque")
            expect(subject.value).to eq(1000)
            expect(subject.account_id).to eq(1)
            expect(subject.tax).to eq(0)
        end
    end
    end
end
