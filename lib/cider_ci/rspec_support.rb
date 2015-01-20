require 'cider_ci/rspec_support/version'

module CiderCI
  module RspecSupport
    class << self
      attr_accessor :collector
    end
  end
end
