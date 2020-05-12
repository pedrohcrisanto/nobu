FactoryBot.define do
  factory :account do
    balance { 1.5 }
    status { "MyString" }
    user { nil }
  end
end
