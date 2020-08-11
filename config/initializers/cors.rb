Rails.application.config.middleware.insert_before 0, Rack::Cors do
    #inserting middleware to be intercepted by rails application
    #allows us to whitelist sites
  allow do
    origins "http://localhost:3000"
    resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end

  allow do
    origins "https://weflix-nick.herokuapp.com"
    resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head],credentials: true
  end
  
end
