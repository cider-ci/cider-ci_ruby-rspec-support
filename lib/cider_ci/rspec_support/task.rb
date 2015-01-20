require 'digest'

module CiderCI
  module RspecSupport
    class Task
      

      attr_reader :properties

      def initialize(properties)
        @properties = properties.freeze
      end

      def hash
        Digest.hexencode(Digest::MD5.digest(rspec_path)).to_i(36)
      end

      def eql?(other)
        rspec_path == other.rspec_path
      end

      def rspec_path
        [@properties[:file_path], @properties[:line_number]].compact.join(":")
      end

      alias_method :key, :rspec_path

      def spec_properties(script_main_body_template)
        { name:  @properties[:description],
          scripts: {
            main: {
              body: eval(script_main_body_template)
            }
          }
        }
      end
    end
  end
end
