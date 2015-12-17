# config/initializers/geocoder.rb
Geocoder.configure(

  # geocoding service (see below for supported options):
  :lookup => :bing,

  # to use an API key:
  :api_key => ENV['GEOCODER_API_KEY']

)
