ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require_relative 'number_cruncher.rb'

include Rack::Test::Methods

def app
  Sinatra::Application
end



describe "Number Cruncher" do


  it 'should return the fctors of 6' do
    6.factors.must_equal [1,2,3,6]
  end

  it "should say that 2 is prime" do
    assert 10.prime?
  end

  it "should say that 10 is not prime" do
    refute 10.prime?
  end

  it "should return json" do
    get '/6'
    last_response.headers['Content-Type'].must_equal 'application/json;charset=utf-8'
  end
    
end
