class InvitationMailer < ActionMailer::Base
  def invitation(invitation)
    @invitation = invitation

    mail(:to => invitation.email,
      :from => "#{Lobsters::Application.app_name} Invitation <#{Lobsters::Application.from_email}>",
      subject: "[#{Lobsters::Application.app_name}] Welcome to #{Lobsters::Application.app_name}")
  end
end
