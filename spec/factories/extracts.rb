FactoryBot.define do
  factory :extract do
    user { nil }
    type_transaction { "MyString" }
    value { 1.5 }
    account { nil }
    tax { 1.5 }
  end
end
