require 'httparty'

describe 'JSON example tests' do

  before(:all) do
    @api = JSON.parse(HTTParty.get('https://api.postcodes.io/postcodes/GY68XY').body)
  end

  it 'quality should be a number that ranges from 1-9' do
    expect(@api['result']['quality']).to be_between(1,9)
  end

  it 'should include a space in the postcode' do
    expect(@api['result']['postcode']).to include(' ')
  end

  it 'has longitude saved as a float' do
    expect(@api['result']['longitude']).to be_a(Float)
  end

  it 'has latitude saved as a float' do
    expect(@api['result']['latitude']).to be_a(Float)
  end

  it 'eastings should be an integer unless the country is "Channel Islands" or "Isle of Man"' do
    if (@api['result']['country']) == "Channel Islands" || "Isle of Man"
      p "works"
      expect(@api['result']['eastings']).to be(nil)
    else
      expect(@api['result']['eastings']).to be_a(Integer)
    end
  end

  it 'northings should be an integer unless the region is "Channel Islands" or "Isle of Man"' do
    if (@api['result']['country']) == "Channel Islands" || "Isle of Man"
      expect(@api['result']['northings']).to be(nil)
    else
      expect(@api['result']['northings']).to be_a(Integer)
    end
  end

end
