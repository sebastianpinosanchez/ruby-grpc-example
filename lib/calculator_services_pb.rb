# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: calculator.proto for package 'calculator'

require 'grpc'
require_relative 'calculator_services_pb'

module Calculator
  module Calculator
    class Service

      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'calculator.Calculator'

      rpc :Add, ::Calculator::AddRequest, ::Calculator::AddResponse
    end

    Stub = Service.rpc_stub_class
  end
end
