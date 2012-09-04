class EmailMessage < ActionMailer::Base
  default :from => Lobsters::Application.from_email

  def notify(message, user)
    @message = message
    @user = user

    mail(:to => user.email, :from => "#{Lobsters::Application.app_name} <#{Lobsters::Application.from_email}>",
      :subject => "[#{Lobsters::Application.app_name}] Private Message from " <<
        "#{message.author.username}: #{message.subject}")
  end
end
