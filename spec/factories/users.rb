FactoryGirl.define do
  factory :user do
    email "test1@example.com"
    password "password"
    password_confirmation "password"
    salt { "asdasdastr4325234324sdfds" }
    crypted_password { Sorcery::CryptoProviders::BCrypt.encrypt("password",
                     salt) }
  end
end