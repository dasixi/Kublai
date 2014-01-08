require_relative 'spec_helper'

describe Kublai::BTCChina do
  subject { described_class.new }

  it "fetches tickers" do
    VCR.use_cassette('ticker') do
      ticker = {"high"=>"5354.99", "low"=>"4501.00", "buy"=>"4906.37", "sell"=>"4920.02", "last"=>"4880.09", "vol"=>"30105.87100000"}
      expect(subject.ticker).to eq(ticker)
    end
  end

  it "fetches market orders" do
    body_matcher = lambda do |req1, req2|
      body1 = JSON.parse(req1.body)
      body2 = JSON.parse(req2.body)
      body1['method'] == body2['method'] && body1['params'] == body2['params']
    end
    VCR.use_cassette('orders', match_requests_on: [:method, body_matcher]) do
      orders = {"bid"=>[{"price"=>4911.19, "amount"=>49.092}, {"price"=>4911, "amount"=>0.01}, {"price"=>4910.05, "amount"=>0.1}, {"price"=>4910, "amount"=>1.1}, {"price"=>4909.37, "amount"=>0.44}, {"price"=>4908, "amount"=>0.4}, {"price"=>4907, "amount"=>0.1}, {"price"=>4906.9, "amount"=>0.95}, {"price"=>4906.28, "amount"=>3.732}, {"price"=>4906.26, "amount"=>0.12}], "ask"=>[{"price"=>4911.2, "amount"=>46.319}, {"price"=>4911.21, "amount"=>12.34}, {"price"=>4912, "amount"=>2}, {"price"=>4913.65, "amount"=>0.389}, {"price"=>4913.91, "amount"=>0.449}, {"price"=>4924.04, "amount"=>0.005}, {"price"=>4942, "amount"=>0.3}, {"price"=>4942.02, "amount"=>0.6}, {"price"=>4943.97, "amount"=>0.05}, {"price"=>4943.98, "amount"=>19.147}]}
      bids = orders['bid']
      asks = orders['ask']
      expect(bids.size).to eq(10)
      expect(asks.size).to eq(10)
    end
  end
end
