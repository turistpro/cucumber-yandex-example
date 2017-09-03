# frozen_string_literal: true
require 'cucumber/formatter/io'

module Autotest
    module RerunFeature
        class Formatter
            include Cucumber::Formatter::Io
            def initialize(runtime, io, options)
                @io = ensure_io(io)
                # @runtime = runtime
                @feature_list = {}
            end
        
            def after_test_case(test_case, result)
              feature = test_case.source.first
              # scenario = test_case.source.last
              file = feature.file.to_s
              @feature_list[file] ||= true
              @feature_list[file] &&= result.passed?
            end
            def after_features(features)
                @feature_list.each do |key, value|
                    @io.puts "#{key.to_s}:#{value.to_s}"
                end
            end
          end
    end
end