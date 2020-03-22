FactoryBot.define do
  factory :jwt_blacklist do
    jti { "MyString" }
    exp { "2020-03-22 22:25:45" }
  end
end
