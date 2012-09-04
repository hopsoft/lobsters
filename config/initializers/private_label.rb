module PrivateLabel
  def app_name
    "Converse"
  end

  def app_domain
    "converse.aws.af.cm"
  end

  def from_email
    "noreply@converse.aws.af.cm"
  end
end

Lobsters::Application.extend PrivateLabel
