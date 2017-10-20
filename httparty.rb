require 'httparty'

puts postcode_call = HTTParty.get('https://api.postcodes.io/postcodes/sw178sf').body
