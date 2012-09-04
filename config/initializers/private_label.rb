module PrivateLabel
  def app_name
    "Converse"
  end

  def app_domain
    ENV["APP_DOMAIN"] || "localhost"
  end

  def from_email
    "noreply@#{app_domain}"
  end
end

Lobsters::Application.extend PrivateLabel
