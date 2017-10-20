require 'httparty'

describe 'JSON example tests' do

  before(:all) do
    @api = JSON.parse(HTTParty.get('https://api.postcodes.io/postcodes/sw178sf').body)
  end

  it 'quality should be a number that ranges from 1-8' do
    expect(@api['result']['quality']).to be_between(1,8)
  end

  it 'should include a space in the postcode' do
    expect(@api['result']['postcode']).to include(' ')
  end

end
