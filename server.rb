require 'grpc'
require_relative 'lib/calculator_services_pb.rb'

class CalculatorServer < Calculator::Calculator::Service
  def add(request, _unused_call)
    response = Calculator::AddResponse.new
    response.sum = request.a + request.b
    response
  end
end

server = GRPC::RpcServer.new
server.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
server.handle(CalculatorServer.new)
server.run_till_terminated
