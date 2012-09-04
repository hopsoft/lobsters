class PasswordReset < ActionMailer::Base
  def password_reset_link(user, ip)
    @user = user
    @ip = ip

    mail(:to => user.email, :from => "#{Lobsters::Application.app_name} <#{Lobsters::Application.from_email}>",
      :subject => "[#{Lobsters::Application.app_name}] Reset your password")
  end
end
