require 'grpc'
require_relative 'lib/calculator_pb'
require_relative 'lib/calculator_services_pb'

def main
  stub = Calculator::Calculator::Stub.new('0.0.0.0:50051', :this_channel_is_insecure)
  a = 10
  b = 20
  request = Calculator::AddRequest.new(a: a, b: b)
  response = stub.add(request)
  puts "Sum of #{a} and #{b} is #{response.sum}"
end

main
