require 'sinatra'
require 'json'


class Integer
  def factors
    square_root = self**0.5
    (1..square_root).map{ |n| [n,self/n] if self/n*n == self }.compact.flatten.sort
  end

  def prime?
    self.factors.size == 2 ? true : false
  end
end

##############
#  ROUTES    #
##############

get '/' do
  content_type :json
  greeting = 'Hello World. This is an api test app.'
  instructions = "After '/'  pick a number 1 - 9999 to return a JSON response"
  {
    greeting: greeting,
    instructions: instructions
  }.to_json
end

get '/:number' do
  content_type :json

  if params[:number].to_i < 10000
    number = params[:number].to_i
  end

  { number:  number,
    factors: number.factors,
    odd:     number.odd?,
    even:    number.even?,
    prime:   number.prime?
    }.to_json
end
