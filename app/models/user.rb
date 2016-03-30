class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :email, :username, presence: true
  validates :username, format: { with: /\A\w+\z/ }
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, email_format: { message: 'is invalid format' }
  validates :username, uniqueness: true
end
