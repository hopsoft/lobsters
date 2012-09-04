module PrivateLabel
  def app_name
    "Converse"
  end

  def app_domain
    ENV["APP_DOMAIN"] || "localhost"
  end

  def from_email
    "noreply@#{ENV["MAILGUN_DOMAIN"]}"
  end
end

Lobsters::Application.extend PrivateLabel
