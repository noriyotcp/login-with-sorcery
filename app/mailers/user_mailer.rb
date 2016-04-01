class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_needed_email.subject
  #
  def activation_needed_email(user)
    @user = user
    # Instead of 0.0.0.0:3000, use my Cloud9's url
    @url  = "https://login-with-sorcery-noriyotcp.c9users.io/users/#{user.activation_token}/activate"
    mail(:to => user.email,
         :subject => "Welcome to My Awesome Site")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_success_email.subject
  #
  def activation_success_email(user)
    @user = user
    # Instead of 0.0.0.0:3000, use my Cloud9's url
    @url  = "https://login-with-sorcery-noriyotcp.c9users.io/login"
    mail(:to => user.email,
         :subject => "Your account is now activated")
  end

  def reset_password_email(user)
    @user = User.find user.id
    @url  = "https://login-with-sorcery-noriyotcp.c9users.io" + edit_password_reset_path(@user.reset_password_token)
    mail(:to => user.email,
         :subject => "Your password has been reset")
  end
end
