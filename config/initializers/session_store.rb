# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_proprojects_session',
  :secret      => '740e70b2274a57dfdbf882bcf66cd422e60008236749233de3ed8cb8e1f8518c8153c4f40fa7e5ce005d49e1c3d4c07549bfc6365dff1bca1b5f354e9d88603e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
