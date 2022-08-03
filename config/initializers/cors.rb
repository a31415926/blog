Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3005'
    resource '/articles', 
      headers: :any, 
      methods: [:get, :post]
    resource '/articles/\d*',
      headers: :any,
      methods: [:get, :put, :delete]
  end
end