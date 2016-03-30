FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "test#{n}@example.com"
    end
    sequence :username do |n|
      "user#{n}"
    end
    password "password"
    password_confirmation "password"
    salt { "asdasdastr4325234324sdfds" }
    crypted_password { Sorcery::CryptoProviders::BCrypt.encrypt("password",
                     salt) }
  end
end