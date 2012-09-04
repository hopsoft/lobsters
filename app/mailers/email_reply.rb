class EmailReply < ActionMailer::Base
  default :from => Lobsters::Application.from_email

  def reply(comment, user)
    @comment = comment 
    @user = user

    mail(:to => user.email, :from => "#{Lobsters::Application.app_name} <#{Lobsters::Application.from_email}>",
      :subject => "[#{Lobsters::Application.app_name}] Reply from #{comment.user.username} on " <<
      "#{comment.story.title}")
  end
end
