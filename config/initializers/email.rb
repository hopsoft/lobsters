ActionMailer::Base.smtp_settings = {
  :address => "127.0.0.1",
  :port => 25,
  :domain => "converse.aws.af.cm",
  :enable_starttls_auto => false,
}
