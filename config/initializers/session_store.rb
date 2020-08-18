if Rails.env == "production"
Rails.application.config.session_store :cookie_store, key: "_authentication_app", domain: "weflix.org" , same_site: :none, secure: true
else 
    Rails.application.config.session_store :cookie_store, key: "_authentication_app"
end
    