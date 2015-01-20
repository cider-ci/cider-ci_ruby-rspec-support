require 'set'
module CiderCI
  module RspecSupport
    module Util
      IDENDITY = ->(x) { x }
      class << self
        def transform(object, 
                      key_transformer = IDENDITY, 
                      value_transformer = IDENDITY) 
          case object
          when Hash
            Hash[object.map do |k, v| 
              [key_transformer.call(k), 
               transform(v, key_transformer, value_transformer)]
            end]
          when Array
            object.map { |v| transform(v, key_transformer, value_transformer) }
          else
            value_transformer.call(object)
          end
        end

        def deep_symbolize_keys(object)
          transform(object, ->(x) { x.to_sym })
        end

        def deep_stringify_keys(object)
          transform(object, ->(x) { x.to_s })
        end
      end
    end
  end
end
