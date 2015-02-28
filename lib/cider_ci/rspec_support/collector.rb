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

      def parent_metadata(metadata)
        if (pmd = metadata[:parent_example_group])
          parent_metadata(pmd)
        else
          metadata
        end
      end

      def example_started(notification)
        metadata = parent_metadata(notification.example.example_group.metadata)
        task = Task.new(file_path: metadata[:file_path],
                        description: metadata[:file_path]
                       )
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
