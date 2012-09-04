# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Lobsters::Application.initialize!
Lobsters::Application.config.secret_token = ENV["SECRET_TOKEN"] || 'e8fd2f339970dbc4767c8453aff3a39410983aef1b46d73f9df873562a5300ad'
