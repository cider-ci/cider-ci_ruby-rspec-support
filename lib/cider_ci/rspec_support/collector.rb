require 'cider_ci/rspec_support'
require 'cider_ci/rspec_support/task'
require 'rspec/core'

module CiderCI
  module RspecSupport
    class Collector
      RSpec::Core::Formatters.register self, :example_started

      attr_reader :tasks
      attr_reader :feature_tasks

      def initialize(_output)
        ::CiderCI::RspecSupport.collector = self
        @tasks = Set.new
        @feature_tasks = Set.new 
      end

      def example_started(notification)
        metadata = notification.example.example_group.metadata 
        task = Task.new(
          file_path: metadata[:file_path],
          line_number: nil,
          description: metadata[:file_path])
        case metadata[:type]
        when :feature
          @feature_tasks << task
        else
          @tasks << task
        end
      end

    end
  end
end
